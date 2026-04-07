package com.example.getnetsmartpos.service;

import android.graphics.Bitmap;
import android.util.Log;
import com.getnet.posdigital.service.IPrinterCallback;
import com.getnet.posdigital.service.PosDigital;
import com.getnet.posdigital.service.printer.AlignMode;
import com.getnet.posdigital.service.printer.FontFormat;

public class PrinterService {

    private static final String TAG = "PrinterService";
    private static final int MAX_CHARS_SMALL = 48;
    private static final int MAX_CHARS_MEDIUM = 32;
    private static final int MAX_CHARS_LARGE = 32;
    private static final int MAX_TEXT_LENGTH = 1800;

    public interface PrinterCallback {
        void onSuccess();
        void onError(String errorMessage);
    }

    /**
     * Imprime texto simples
     */
    public void printText(String text, AlignMode align, FontFormat fontFormat, PrinterCallback callback) {
        if (!validateInitialization(callback)) return;

        try {
            PosDigital.getInstance().getPrinter().init();
            PosDigital.getInstance().getPrinter().setGray(5);
            PosDigital.getInstance().getPrinter().defineFontFormat(fontFormat);
            
            // Validar comprimento do texto
            if (text.length() > MAX_TEXT_LENGTH) {
                if (callback != null) {
                    callback.onError("Texto muito longo. Máximo: " + MAX_TEXT_LENGTH + " caracteres");
                }
                return;
            }
            
            PosDigital.getInstance().getPrinter().addText(align, text);
            PosDigital.getInstance().getPrinter().print(getPrinterCallback(callback));
            
        } catch (Exception e) {
            Log.e(TAG, "Erro ao imprimir texto", e);
            if (callback != null) {
                callback.onError("Erro ao imprimir: " + e.getMessage());
            }
        }
    }

    /**
     * Imprime recibo com múltiplas linhas
     */
    public void printReceipt(ReceiptBuilder receipt, PrinterCallback callback) {
        if (!validateInitialization(callback)) return;

        try {
            PosDigital.getInstance().getPrinter().init();
            PosDigital.getInstance().getPrinter().setGray(5);
            
            for (ReceiptLine line : receipt.getLines()) {
                PosDigital.getInstance().getPrinter().defineFontFormat(line.fontFormat);
                PosDigital.getInstance().getPrinter().addText(line.align, line.text);
            }
            
            PosDigital.getInstance().getPrinter().print(getPrinterCallback(callback));
            
        } catch (Exception e) {
            Log.e(TAG, "Erro ao imprimir recibo", e);
            if (callback != null) {
                callback.onError("Erro ao imprimir recibo: " + e.getMessage());
            }
        }
    }

    /**
     * Imprime imagem bitmap
     */
    public void printImage(Bitmap bitmap, AlignMode align, PrinterCallback callback) {
        if (!validateInitialization(callback)) return;
        if (bitmap == null) {
            if (callback != null) {
                callback.onError("Bitmap não pode ser nulo");
            }
            return;
        }

        try {
            PosDigital.getInstance().getPrinter().init();
            PosDigital.getInstance().getPrinter().addImageBitmap(align, bitmap);
            PosDigital.getInstance().getPrinter().print(getPrinterCallback(callback));
            
        } catch (Exception e) {
            Log.e(TAG, "Erro ao imprimir imagem", e);
            if (callback != null) {
                callback.onError("Erro ao imprimir imagem: " + e.getMessage());
            }
        }
    }

    /**
     * Imprime barcode
     */
    public void printBarcode(String barcode, AlignMode align, PrinterCallback callback) {
        if (!validateInitialization(callback)) return;
        if (barcode == null || barcode.isEmpty()) {
            if (callback != null) {
                callback.onError("Código de barras não pode estar vazio");
            }
            return;
        }

        try {
            if (barcode.length() > 60) {
                Log.w(TAG, "Barcode muito longo. Qualidade pode ser reduzida.");
            }
            
            PosDigital.getInstance().getPrinter().init();
            PosDigital.getInstance().getPrinter().addBarCode(align, barcode);
            PosDigital.getInstance().getPrinter().print(getPrinterCallback(callback));
            
        } catch (Exception e) {
            Log.e(TAG, "Erro ao imprimir barcode", e);
            if (callback != null) {
                callback.onError("Erro ao imprimir barcode: " + e.getMessage());
            }
        }
    }

    /**
     * Imprime QR Code
     */
    public void printQrCode(String qrCode, int heightPixels, AlignMode align, PrinterCallback callback) {
        if (!validateInitialization(callback)) return;
        if (qrCode == null || qrCode.isEmpty()) {
            if (callback != null) {
                callback.onError("QR Code não pode estar vazio");
            }
            return;
        }

        // Validar altura (recomendado 140-300 pixels)
        if (heightPixels < 140 || heightPixels > 300) {
            Log.w(TAG, "Altura do QR Code fora do range recomendado (140-300). Será redimensionado.");
        }

        try {
            PosDigital.getInstance().getPrinter().init();
            PosDigital.getInstance().getPrinter().addQrCode(align, heightPixels, qrCode);
            PosDigital.getInstance().getPrinter().print(getPrinterCallback(callback));
            
        } catch (Exception e) {
            Log.e(TAG, "Erro ao imprimir QR Code", e);
            if (callback != null) {
                callback.onError("Erro ao imprimir QR Code: " + e.getMessage());
            }
        }
    }

    /**
     * Retorna status da impressora
     */
    public int getPrinterStatus() {
        try {
            if (PosDigital.getInstance().isInitiated()) {
                return PosDigital.getInstance().getPrinter().getStatus();
            }
        } catch (Exception e) {
            Log.e(TAG, "Erro ao obter status", e);
        }
        return -1;
    }

    /**
     * Mapeia código de erro para mensagem legível
     */
    public String getStatusMessage(int status) {
        switch (status) {
            case 0: return "OK";
            case 1: return "Imprimindo";
            case 2: return "Impressora não iniciada";
            case 3: return "Impressora superaquecida";
            case 4: return "Fila de impressão muito grande";
            case 5: return "Parâmetros incorretos";
            case 10: return "Porta da impressora aberta";
            case 11: return "Temperatura baixa demais";
            case 12: return "Bateria insuficiente";
            case 13: return "Erro no motor de passo";
            case 15: return "Sem bobina";
            case 16: return "Bobina acabando";
            case 17: return "Bobina travada";
            case 1000: return "Erro desconhecido";
            default: return "Status desconhecido: " + status;
        }
    }

    private boolean validateInitialization(PrinterCallback callback) {
        if (!PosDigital.getInstance().isInitiated()) {
            Log.e(TAG, "PosDigital não está inicializado");
            if (callback != null) {
                callback.onError("Serviço de impressão não disponível");
            }
            return false;
        }
        return true;
    }

    private IPrinterCallback.Stub getPrinterCallback(PrinterCallback callback) {
        return new IPrinterCallback.Stub() {
            @Override
            public void onSuccess() {
                Log.d(TAG, "Impressão realizada com sucesso");
                if (callback != null) {
                    callback.onSuccess();
                }
            }

            @Override
            public void onError(int cause) {
                String errorMsg = getStatusMessage(cause);
                Log.e(TAG, "Erro na impressão: " + errorMsg);
                if (callback != null) {
                    callback.onError(errorMsg);
                }
            }
        };
    }

    /**
     * Classe interna para construir recibos
     */
    public static class ReceiptBuilder {
        private java.util.List<ReceiptLine> lines = new java.util.ArrayList<>();

        public ReceiptBuilder addLine(String text, AlignMode align, FontFormat fontFormat) {
            lines.add(new ReceiptLine(text, align, fontFormat));
            return this;
        }

        public ReceiptBuilder addBlankLine() {
            lines.add(new ReceiptLine(" ", AlignMode.LEFT, FontFormat.SMALL));
            return this;
        }

        public java.util.List<ReceiptLine> getLines() {
            return lines;
        }
    }

    /**
     * Classe interna para representar uma linha do recibo
     */
    public static class ReceiptLine {
        public String text;
        public AlignMode align;
        public FontFormat fontFormat;

        public ReceiptLine(String text, AlignMode align, FontFormat fontFormat) {
            this.text = text;
            this.align = align;
            this.fontFormat = fontFormat;
        }
    }
}
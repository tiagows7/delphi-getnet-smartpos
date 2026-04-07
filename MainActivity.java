package com.example.getnetsmartpos;

import android.app.AlertDialog;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.util.Log;
import android.widget.Button;
import android.widget.TextView;
import com.example.getnetsmartpos.service.PrinterService;
import com.example.getnetsmartpos.ui.BaseActivity;
import com.getnet.posdigital.service.printer.AlignMode;
import com.getnet.posdigital.service.printer.FontFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class MainActivity extends BaseActivity {

    private static final String TAG = "MainActivity";
    private PrinterService printerService;
    private TextView statusText;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        printerService = new PrinterService();
        initializeUI();
    }

    private void initializeUI() {
        statusText = findViewById(R.id.status_text);
        
        Button printTextBtn = findViewById(R.id.btn_print_text);
        Button printReceiptBtn = findViewById(R.id.btn_print_receipt);
        Button printImageBtn = findViewById(R.id.btn_print_image);
        Button printBarcodeBtn = findViewById(R.id.btn_print_barcode);
        Button printQrcodeBtn = findViewById(R.id.btn_print_qrcode);
        Button contactBtn = findViewById(R.id.btn_contact);

        printTextBtn.setOnClickListener(v -> printSimpleText());
        printReceiptBtn.setOnClickListener(v -> printSampleReceipt());
        printImageBtn.setOnClickListener(v -> printSampleImage());
        printBarcodeBtn.setOnClickListener(v -> printSampleBarcode());
        printQrcodeBtn.setOnClickListener(v -> printSampleQrCode());
        contactBtn.setOnClickListener(v -> showContactInfo());

        updateStatus("Aguardando hardware...");
    }

    @Override
    protected void onPosDigitalConnected() {
        super.onPosDigitalConnected();
        updateStatus("Hardware conectado!");
    }

    private void printSimpleText() {
        if (!isPosDigitalInitiated()) {
            showError("Serviço não disponível");
            return;
        }

        String text = "Teste de Impressão\nGetnet SmartPOS DX800\nDelphi Android 11";
        
        printerService.printText(text, AlignMode.CENTER, FontFormat.MEDIUM, new PrinterService.PrinterCallback() {
            @Override
            public void onSuccess() {
                updateStatus("✓ Texto impresso com sucesso!");
            }

            @Override
            public void onError(String errorMessage) {
                updateStatus("✗ Erro: " + errorMessage);
            }
        });
    }

    private void printSampleReceipt() {
        if (!isPosDigitalInitiated()) {
            showError("Serviço não disponível");
            return;
        }

        String timestamp = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss", Locale.getDefault()).format(new Date());

        PrinterService.ReceiptBuilder receipt = new PrinterService.ReceiptBuilder()
            .addLine("LOJA TESTE", AlignMode.CENTER, FontFormat.LARGE)
            .addLine("CNPJ: 00.000.000/0001-00", AlignMode.CENTER, FontFormat.SMALL)
            .addBlankLine()
            .addLine("COMPROVANTE DE VENDA", AlignMode.CENTER, FontFormat.MEDIUM)
            .addBlankLine()
            .addLine("Produto 1 .............. R$ 50,00", AlignMode.LEFT, FontFormat.SMALL)
            .addLine("Produto 2 .............. R$ 30,00", AlignMode.LEFT, FontFormat.SMALL)
            .addLine("Produto 3 .............. R$ 20,00", AlignMode.LEFT, FontFormat.SMALL)
            .addBlankLine()
            .addLine("TOTAL .................. R$ 100,00", AlignMode.LEFT, FontFormat.MEDIUM)
            .addBlankLine()
            .addLine("Data/Hora: " + timestamp, AlignMode.CENTER, FontFormat.SMALL)
            .addLine("Autorização: 123456789", AlignMode.CENTER, FontFormat.SMALL)
            .addBlankLine()
            .addLine("Obrigado pela compra!", AlignMode.CENTER, FontFormat.SMALL);

        printerService.printReceipt(receipt, new PrinterService.PrinterCallback() {
            @Override
            public void onSuccess() {
                updateStatus("✓ Recibo impresso com sucesso!");
            }

            @Override
            public void onError(String errorMessage) {
                updateStatus("✗ Erro: " + errorMessage);
            }
        });
    }

    private void printSampleImage() {
        if (!isPosDigitalInitiated()) {
            showError("Serviço não disponível");
            return;
        }

        try {
            // Tenta carregar uma imagem dos assets (exemplo)
            Bitmap bitmap = BitmapFactory.decodeStream(getAssets().open("logo.png"));
            
            printerService.printImage(bitmap, AlignMode.CENTER, new PrinterService.PrinterCallback() {
                @Override
                public void onSuccess() {
                    updateStatus("✓ Imagem impressa com sucesso!");
                }

                @Override
                public void onError(String errorMessage) {
                    updateStatus("✗ Erro: " + errorMessage);
                }
            });
        } catch (Exception e) {
            Log.e(TAG, "Erro ao carregar imagem", e);
            showError("Imagem não encontrada em assets/logo.png");
        }
    }

    private void printSampleBarcode() {
        if (!isPosDigitalInitiated()) {
            showError("Serviço não disponível");
            return;
        }

        printerService.printBarcode("1234567890123", AlignMode.CENTER, new PrinterService.PrinterCallback() {
            @Override
            public void onSuccess() {
                updateStatus("✓ Código de barras impresso!");
            }

            @Override
            public void onError(String errorMessage) {
                updateStatus("✗ Erro: " + errorMessage);
            }
        });
    }

    private void printSampleQrCode() {
        if (!isPosDigitalInitiated()) {
            showError("Serviço não disponível");
            return;
        }

        String qrData = "https://www.getnet.com.br";
        
        printerService.printQrCode(qrData, 200, AlignMode.CENTER, new PrinterService.PrinterCallback() {
            @Override
            public void onSuccess() {
                updateStatus("✓ QR Code impresso!");
            }

            @Override
            public void onError(String errorMessage) {
                updateStatus("✗ Erro: " + errorMessage);
            }
        });
    }

    private void showContactInfo() {
        AlertDialog dialog = new AlertDialog.Builder(this)
            .setTitle("Fale Conosco - Suporte Getnet")
            .setMessage(
                "Em caso de problemas ou dúvidas:\n\n" +
                "📞 Telefone: 0800 004 8004\n" +
                "📧 Email: suporte@getnet.com.br\n" +
                "🌐 Portal: https://portaldodesenvolvedor.getnet.com.br\n\n" +
                "Versão do APP: 1.0\n" +
                "SDK: libposdigital-1-8-13-release"
            )
            .setPositiveButton("Fechar", null)
            .create();
        dialog.show();
    }

    private void updateStatus(String message) {
        runOnUiThread(() -> {
            Log.d(TAG, message);
            statusText.setText(message);
        });
    }

    private void showError(String message) {
        AlertDialog dialog = new AlertDialog.Builder(this)
            .setTitle("Erro")
            .setMessage(message)
            .setPositiveButton("OK", null)
            .create();
        dialog.show();
    }
}
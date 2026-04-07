package com.example.getnetsmartpos.ui;

import android.os.Bundle;
import android.util.Log;
import androidx.appcompat.app.AppCompatActivity;
import com.getnet.posdigital.service.PosDigital;

public class BaseActivity extends AppCompatActivity {

    private static final String TAG = "BaseActivity";
    private static final int MAX_RECONNECT_ATTEMPTS = 3;
    private int reconnectAttempts = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        connectPosDigitalService();
    }

    private void connectPosDigitalService() {
        Log.d(TAG, "Conectando ao serviço PosDigital...");
        PosDigital.register(getApplicationContext(), bindCallback);
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        try {
            if (PosDigital.getInstance().isInitiated()) {
                PosDigital.unregister(getApplicationContext());
                Log.d(TAG, "PosDigital desregistrado");
            }
        } catch (Exception e) {
            Log.e(TAG, "Erro ao desregistrar PosDigital", e);
        }
    }

    private PosDigital.BindCallback bindCallback = new PosDigital.BindCallback() {
        @Override
        public void onError(Exception e) {
            Log.e(TAG, "Erro na conexão PosDigital", e);
            if (PosDigital.getInstance().isInitiated()) {
                try {
                    PosDigital.unregister(getApplicationContext());
                } catch (Exception ex) {
                    Log.e(TAG, "Erro ao desregistrar", ex);
                }
            }
            
            // Reconectar com limite de tentativas
            if (reconnectAttempts < MAX_RECONNECT_ATTEMPTS) {
                reconnectAttempts++;
                Log.d(TAG, "Tentando reconectar... (" + reconnectAttempts + "/" + MAX_RECONNECT_ATTEMPTS + ")");
                connectPosDigitalService();
            } else {
                Log.e(TAG, "Falha ao conectar após " + MAX_RECONNECT_ATTEMPTS + " tentativas");
                showErrorDialog("Falha na conexão com o hardware.\nTente novamente mais tarde.");
            }
        }

        @Override
        public void onConnected() {
            Log.d(TAG, "PosDigital conectado com sucesso");
            reconnectAttempts = 0;
            onPosDigitalConnected();
        }

        @Override
        public void onDisconnected() {
            Log.d(TAG, "PosDigital desconectado");
            showErrorDialog("Hardware desconectado.\nTente novamente.");
        }
    };

    /**
     * Callback executado quando o PosDigital está conectado
     * Deve ser sobrescrito nas subclasses
     */
    protected void onPosDigitalConnected() {
        // Implementar nas subclasses se necessário
    }

    protected boolean isPosDigitalInitiated() {
        return PosDigital.getInstance().isInitiated();
    }

    protected void showErrorDialog(String message) {
        Log.e(TAG, "Erro: " + message);
        // Implementar exibição de diálogo nas subclasses
    }
}
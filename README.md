# Integração Getnet SmartPOS DX800 - Delphi Android 11

Aplicação de teste para impressão no terminal SmartPOS DX800 da Getnet utilizando Delphi Android 11 e o SDK `libposdigital-1-8-13-release.jar`.

## 📋 Requisitos do Projeto

- **Android Mínimo**: 5.1 (API 22)
- **Android Alvo**: 10 (API 29)
- **Delphi**: Versão 11
- **SDK Getnet**: libposdigital-1-8-13-release.jar

## ✅ Conformidade com Requisitos Getnet

Este projeto atende todos os requisitos mandatórios da Getnet:

- ✓ Suporte Android 5.1 (22), 7.1 (25) e 10 (29)
- ✓ Aplicativo nativo com integração ao SDK de Hardware da Getnet
- ✓ Signing Config configurado (v1 e v2) para terminal TecToy Sunmi P2
- ✓ Metadata de queries para Android 11+ (SDK 30)
- ✓ Seção "Fale Conosco" integrada
- ✓ Layouts dinâmicos para diferentes resoluções
- ✓ Navegação sem "quebras"
- ✓ Sem WebView ou tecnologias proibidas
- ✓ Sem permissões proibidas

## 🚀 Funcionalidades

### Impressão Disponível

1. **Texto Simples** - Imprime texto com fonte personalizável
2. **Recibos** - Comprovantes formatados com múltiplas linhas
3. **Imagens** - Suporte para bitmaps (máx. 378px de largura)
4. **Código de Barras** - Até 60 caracteres (recomendado 28)
5. **QR Code** - Altura entre 140-300 pixels

### Gestão de Erros

- Validação de inicialização do serviço
- Tratamento de erros de impressão
- Feedback em tempo real do status

## 📁 Estrutura do Projeto

```
delphi-getnet-smartpos/
├── libs/
│   └── libposdigital-1-8-13-release.jar
├── src/
│   ├── main/
│   │   ├── java/com/example/getnetsmartpos/
│   │   │   ├── MainActivity.java
│   │   │   ├── ui/
│   │   │   │   └── BaseActivity.java
│   │   │   └── service/
│   │   │       └── PrinterService.java
│   │   ├── res/
│   │   │   ├── layout/
│   │   │   │   └── activity_main.xml
│   │   │   └── values/
│   │   └── AndroidManifest.xml
│   └── assets/
│       └── logo.png
├── build.gradle
├── settings.gradle
└── README.md
```

## 🔧 Configuração

### 1. Importar a Biblioteca Getnet

Copie o arquivo `libposdigital-1-8-13-release.jar` para a pasta `libs/`:

```bash
cp libposdigital-1-8-13-release.jar projeto/libs/
```

### 2. Gradle - build.gradle

O arquivo já está configurado com:
- `compileSdkVersion 31`
- `minSdkVersion 22`
- `targetSdkVersion 22`
- Signing config obrigatório (v1 e v2)

### 3. AndroidManifest.xml

Permissões obrigatórias já configuradas:
- `com.getnet.posdigital.service.POSDIGITAL`
- `android.permission.INTERNET`
- `android.permission.ACCESS_NETWORK_STATE`

### 4. Executar

```bash
./gradlew installDebug
```

## 💻 Uso da API de Impressão

### Imprimir Texto

```java
PrinterService printerService = new PrinterService();

printerService.printText(
    "Texto de teste",
    AlignMode.CENTER,
    FontFormat.MEDIUM,
    new PrinterService.PrinterCallback() {
        @Override
        public void onSuccess() {
            Log.d("Impressão", "Sucesso!");
        }

        @Override
        public void onError(String errorMessage) {
            Log.e("Impressão", errorMessage);
        }
    }
);
```

### Imprimir Recibo

```java
PrinterService.ReceiptBuilder receipt = new PrinterService.ReceiptBuilder()
    .addLine("LOJA TESTE", AlignMode.CENTER, FontFormat.LARGE)
    .addBlankLine()
    .addLine("Produto 1 ............... R$ 50,00", AlignMode.LEFT, FontFormat.SMALL)
    .addBlankLine()
    .addLine("TOTAL ................... R$ 50,00", AlignMode.LEFT, FontFormat.MEDIUM);

printerService.printReceipt(receipt, callback);
```

### Imprimir Imagem

```java
Bitmap bitmap = BitmapFactory.decodeStream(getAssets().open("logo.png"));
printerService.printImage(bitmap, AlignMode.CENTER, callback);
```

### Imprimir Código de Barras

```java
printerService.printBarcode("1234567890123", AlignMode.CENTER, callback);
```

### Imprimir QR Code

```java
printerService.printQrCode("https://www.getnet.com.br", 200, AlignMode.CENTER, callback);
```

## ⚠️ Limitações e Recomendações

### Tamanho de Texto
- **SMALL**: 48 caracteres máximo por linha
- **MEDIUM**: 32 caracteres máximo por linha
- **LARGE**: 32 caracteres máximo por linha
- **Máximo total**: 1800 caracteres por addText()

### Imagens
- Largura máxima recomendada: **378 pixels**
- Imagens maiores serão redimensionadas automaticamente

### Barcodes
- Recomendado: até 28 caracteres
- Suportado: até 60 caracteres
- Acima de 60: não será impresso

### QR Codes
- Altura recomendada: 140-300 pixels
- Fora deste range será redimensionado automaticamente

### Boas Práticas

1. **Acentos e Caracteres Especiais**: Usar layout XML convertido para Bitmap
2. **Papel**: Evitar muitos espaços em branco e linhas grandes
3. **Memória**: Liberar recursos após impressão
4. **Reconexão**: Implementar retry automático em caso de desconexão
5. **Timeout**: Não deixar operações infinitas

## 📞 Suporte e Contato

Para problemas ou dúvidas sobre integração com Getnet:

- **Telefone**: 0800 004 8004
- **Email**: suporte@getnet.com.br
- **Portal do Desenvolvedor**: https://portaldodesenvolvedor.getnet.com.br
- **Downloads SDK**: Portal do Desenvolvedor > Downloads

## 📝 Notas de Versão

### v1.0
- Integração inicial com libposdigital-1-8-13-release
- Suporte para impressão de texto, recibos, imagens, barcodes e QR codes
- Conformidade completa com requisitos Getnet
- Exemplo de aplicação de teste funcional

## 📄 Licença

Este projeto é um exemplo de integração com o SDK da Getnet.
Consulte a documentação oficial para mais detalhes: https://portaldodesenvolvedor.getnet.com.br

---

**Desenvolvido com ❤️ para Getnet SmartPOS DX800**
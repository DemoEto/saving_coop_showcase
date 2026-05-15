class QrResult {
  final String rawValue;
  final QrFormat format;
  final DateTime scannedAt;

  const QrResult({
    required this.rawValue,
    required this.format,
    required this.scannedAt,
  });
}

enum QrFormat { qrCode, barcode, dataMatrix, aztec, unknown }
import 'package:dartz/dartz.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../domain/entities/qr_result.dart';
import '../../domain/repositories/qr_scanner_repository.dart';

// ─── Model ───────────────────────────────────────────────────────────────────

class QrResultModel extends QrResult {
  const QrResultModel({
    required super.rawValue,
    required super.format,
    required super.scannedAt,
  });

  factory QrResultModel.fromBarcode(Barcode barcode) {
    return QrResultModel(
      rawValue: barcode.rawValue ?? '',
      format: _mapFormat(barcode.format),
      scannedAt: DateTime.now(),
    );
  }

  static QrFormat _mapFormat(BarcodeFormat format) {
    switch (format) {
      case BarcodeFormat.qrCode:
        return QrFormat.qrCode;
      case BarcodeFormat.aztec:
        return QrFormat.aztec;
      case BarcodeFormat.dataMatrix:
        return QrFormat.dataMatrix;
      case BarcodeFormat.ean8:
      case BarcodeFormat.ean13:
      case BarcodeFormat.code128:
      case BarcodeFormat.code39:
        return QrFormat.barcode;
      default:
        return QrFormat.unknown;
    }
  }
}

// ─── Repository Implementation ────────────────────────────────────────────────

class QrScannerRepositoryImpl implements QrScannerRepository {
  @override
  Future<Either<QrFailure, QrResult>> processQrCode(String rawValue) async {
    try {
      if (rawValue.isEmpty) return const Left(InvalidQrFailure());

      final result = QrResultModel(
        rawValue: rawValue,
        format: QrFormat.qrCode,
        scannedAt: DateTime.now(),
      );

      return Right(result);
    } catch (e) {
      return Left(ScanFailure(e.toString()));
    }
  }

  @override
  Future<Either<QrFailure, bool>> requestCameraPermission() async {
    final status = await Permission.camera.request();
    if (status.isGranted) return const Right(true);
    return const Left(PermissionDeniedFailure());
  }

  @override
  Future<Either<QrFailure, bool>> hasCameraPermission() async {
    final status = await Permission.camera.status;
    return Right(status.isGranted);
  }
}
import 'package:dartz/dartz.dart';
import '../entities/qr_result.dart';

abstract class QrScannerRepository {
  Future<Either<QrFailure, QrResult>> processQrCode(String rawValue);
  Future<Either<QrFailure, bool>> requestCameraPermission();
  Future<Either<QrFailure, bool>> hasCameraPermission();
}

// Failures
abstract class QrFailure {
  final String message;
  const QrFailure(this.message);
}

class PermissionDeniedFailure extends QrFailure {
  const PermissionDeniedFailure() : super('Camera permission denied');
}

class ScanFailure extends QrFailure {
  const ScanFailure(String message) : super(message);
}

class InvalidQrFailure extends QrFailure {
  const InvalidQrFailure() : super('Invalid QR code');
}
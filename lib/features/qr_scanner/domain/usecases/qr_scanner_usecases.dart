import 'package:dartz/dartz.dart';
import '../entities/qr_result.dart';
import '../repositories/qr_scanner_repository.dart';

class ProcessQrCode {
  final QrScannerRepository repository;
  const ProcessQrCode(this.repository);

  Future<Either<QrFailure, QrResult>> call(String rawValue) =>
      repository.processQrCode(rawValue);
}

class RequestCameraPermission {
  final QrScannerRepository repository;
  const RequestCameraPermission(this.repository);

  Future<Either<QrFailure, bool>> call() =>
      repository.requestCameraPermission();
}

class CheckCameraPermission {
  final QrScannerRepository repository;
  const CheckCameraPermission(this.repository);

  Future<Either<QrFailure, bool>> call() => repository.hasCameraPermission();
}
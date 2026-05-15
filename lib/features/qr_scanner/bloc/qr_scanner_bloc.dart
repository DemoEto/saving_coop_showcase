import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../domain/usecases/qr_scanner_usecases.dart';
import '../domain/entities/qr_result.dart';
import '../domain/repositories/qr_scanner_repository.dart';

part 'qr_scanner_event.dart';
part 'qr_scanner_state.dart';

class QrScannerBloc extends Bloc<QrScannerEvent, QrScannerState> {
  final CheckCameraPermission checkCameraPermission;
  final RequestCameraPermission requestCameraPermission;
  final ProcessQrCode processQrCode;

  bool _isProcessing = false;

  QrScannerBloc({
    required this.checkCameraPermission,
    required this.requestCameraPermission,
    required this.processQrCode,
  }) : super(const QrScannerInitial()) {
    on<QrScannerStarted>(_onStarted);
    on<QrPermissionRequested>(_onPermissionRequested);
    on<QrCodeDetected>(_onCodeDetected);
    on<QrScannerReset>(_onReset);
    on<QrScannerTorchToggled>(_onTorchToggled);
  }

  Future<void> _onStarted(
    QrScannerStarted event,
    Emitter<QrScannerState> emit,
  ) async {
    emit(const QrScannerPermissionChecking());

    final result = await checkCameraPermission();

    result.fold(
      (failure) => emit(const QrScannerPermissionDenied()),
      (hasPermission) {
        if (hasPermission) {
          emit(const QrScannerReady());
        } else {
          emit(const QrScannerPermissionDenied());
        }
      },
    );
  }

  Future<void> _onPermissionRequested(
    QrPermissionRequested event,
    Emitter<QrScannerState> emit,
  ) async {
    final result = await requestCameraPermission();

    result.fold(
      (failure) => emit(const QrScannerPermissionDenied()),
      (_) => emit(const QrScannerReady()),
    );
  }

  Future<void> _onCodeDetected(
    QrCodeDetected event,
    Emitter<QrScannerState> emit,
  ) async {
    if (_isProcessing) return; // debounce
    _isProcessing = true;

    emit(const QrScannerProcessing());

    final result = await processQrCode(event.rawValue);

    result.fold(
      (failure) {
        emit(QrScannerFailure(failure.message));
        _isProcessing = false;
      },
      (qrResult) => emit(QrScannerSuccess(qrResult)),
    );
  }

  void _onReset(QrScannerReset event, Emitter<QrScannerState> emit) {
    _isProcessing = false;
    emit(const QrScannerReady());
  }

  void _onTorchToggled(
    QrScannerTorchToggled event,
    Emitter<QrScannerState> emit,
  ) {
    final currentState = state;
    if (currentState is QrScannerReady) {
      emit(QrScannerReady(torchOn: !currentState.torchOn));
    }
  }
}
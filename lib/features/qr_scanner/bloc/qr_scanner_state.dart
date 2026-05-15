part of 'qr_scanner_bloc.dart';

abstract class QrScannerState extends Equatable {
  const QrScannerState();
  @override
  List<Object?> get props => [];
}
 
class QrScannerInitial extends QrScannerState {
  const QrScannerInitial();
}
 
class QrScannerPermissionChecking extends QrScannerState {
  const QrScannerPermissionChecking();
}
 
class QrScannerPermissionDenied extends QrScannerState {
  const QrScannerPermissionDenied();
}
 
class QrScannerReady extends QrScannerState {
  final bool torchOn;
  const QrScannerReady({this.torchOn = false});
  @override
  List<Object?> get props => [torchOn];
}
 
class QrScannerProcessing extends QrScannerState {
  const QrScannerProcessing();
}
 
class QrScannerSuccess extends QrScannerState {
  final QrResult result;
  const QrScannerSuccess(this.result);
  @override
  List<Object?> get props => [result];
}
 
class QrScannerFailure extends QrScannerState {
  final String message;
  const QrScannerFailure(this.message);
  @override
  List<Object?> get props => [message];
}
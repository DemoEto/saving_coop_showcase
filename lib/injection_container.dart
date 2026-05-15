import 'package:get_it/get_it.dart';
import 'features/qr_scanner/data/repositories/qr_scanner_repository_impl.dart';
import 'features/qr_scanner/domain/repositories/qr_scanner_repository.dart';
import 'features/qr_scanner/domain/usecases/qr_scanner_usecases.dart';
import 'features/qr_scanner/bloc/qr_scanner_bloc.dart';

final sl = GetIt.instance;

void setupDependencies() {
  // ใน setupDependencies() ของโปรเจกต์หลัก เพิ่ม:

// QR Scanner
  sl.registerLazySingleton<QrScannerRepository>(
    () => QrScannerRepositoryImpl(),
  );
  sl.registerLazySingleton(() => CheckCameraPermission(sl()));
  sl.registerLazySingleton(() => RequestCameraPermission(sl()));
  sl.registerLazySingleton(() => ProcessQrCode(sl()));

// ต้อง registerFactory (ไม่ใช่ Singleton) เพราะ BLoC ถูก dispose ทุกครั้งที่ออกจาก tab
  sl.registerFactory(
    () => QrScannerBloc(
      checkCameraPermission: sl(),
      requestCameraPermission: sl(),
      processQrCode: sl(),
    ),
  );
}

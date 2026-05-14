import 'package:flutter_easyloading/flutter_easyloading.dart';

class AppLoading {
  static void show( {String status = 'loading...'}) {
    EasyLoading.show(
      status: status,
      maskType: EasyLoadingMaskType.black,
    );
  }

  static void dismiss() {
    EasyLoading.dismiss();
  }
}

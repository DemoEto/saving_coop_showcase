import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
// import 'package:mobile_application/core/constants/config.dart';
import '../../../core/theme/colors.dart';
import '../../l10n/context_extension.dart';

enum AlertModalType {CONFIRM, WARNING, SUCCESS, ERROR}
class AlertModal extends StatelessWidget {
  final AlertModalType? type;
  final String title;
  final String desc;
  final Function? onConfirm;
  final Function? onCancel;
  final Color? headerColor;
  final Color? titleColor;
  final Color? buttonColor;
  final String? buttonText;
  const AlertModal({
    super.key,
    this.type = AlertModalType.CONFIRM,
    required this.title,
    required this.desc,
    this.onConfirm,
    this.onCancel,
    this.headerColor,
    this.titleColor,
    this.buttonColor,
    this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    String lottiePath = 'alert_confirm';
    String btnConfirmText = context.t.confirm;
    Color topColor = AppColors.blue.withOpacity(0.1);
    Color textTitleColor = AppColors.blue;
    Color btnColor = AppColors.blue;

    if(type == AlertModalType.CONFIRM){
      lottiePath = 'alert_confirm';
      topColor = AppColors.blue.withOpacity(0.1);
      textTitleColor = AppColors.blue;
      btnColor = AppColors.blue;

    }
    if(type == AlertModalType.WARNING){
      lottiePath = 'alert_warning';
      topColor = AppColors.yellow.withOpacity(0.1);
      textTitleColor = AppColors.yellow;
      btnColor = AppColors.yellow;
    }
    if(type == AlertModalType.SUCCESS){
      lottiePath = 'alert_success';
      topColor = AppColors.greenLight.withOpacity(0.1);
      textTitleColor = AppColors.greenLight;
      btnColor = AppColors.greenLight;
    }
    if(type == AlertModalType.ERROR){
      lottiePath = 'alert_error';
      topColor = AppColors.red.withOpacity(0.1);
      textTitleColor = AppColors.red;
      btnColor = AppColors.red;
      btnConfirmText = context.t.okay;
    }

    if(headerColor != null) topColor = headerColor ?? topColor;
    if(titleColor != null) textTitleColor = titleColor ?? textTitleColor;
    if(buttonColor != null) btnColor = buttonColor ?? btnColor;
    if(buttonText != null) btnConfirmText = buttonText ?? btnConfirmText;


    return AlertDialog(
      insetPadding: const EdgeInsets.only(left: 15, right: 15),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      contentPadding: EdgeInsets.zero,
      content: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: screen.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: 100,
                    color: topColor,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: (){
                          if(onCancel != null){
                            onCancel?.call();
                          }
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          margin: const EdgeInsets.only(top: 15, right: 15),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(100)
                          ),
                          child: const Center(
                            child: Icon(Icons.close,color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(15, 80, 15, 20),
                    child: Column(
                      children: [
                        Text(title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: textTitleColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 30),
                          child: Text(desc,
                            textAlign: TextAlign.center,
                          ),
                        ),

                        InkWell(
                          onTap: (){
                            if(onConfirm != null){
                              onConfirm?.call();
                            }
                            Navigator.pop(context);

                          },
                          child: Container(
                            width: screen.width,
                            height: 45,
                            decoration: BoxDecoration(
                              color: btnColor,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child: Center(
                              child: Text(btnConfirmText,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        if(type == AlertModalType.CONFIRM)
                        InkWell(
                          onTap: (){
                            if(onCancel != null){
                              onCancel?.call();
                            }
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(context.t.cancel,
                              style: const TextStyle(
                                color: AppColors.grey
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Positioned(
            //   top: 30,
            //   child: Lottie.asset(
            //     '${AppConfig.lottieAssetPath}/$lottiePath.json',
            //     height: 130,
            //     fit: BoxFit.fill,
            //     repeat: false,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

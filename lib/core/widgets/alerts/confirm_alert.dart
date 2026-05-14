import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../theme/text_style.dart';
import '../../theme/theme.dart';
import '../close_button.dart';

class ConfirmAlert extends StatelessWidget {
  final String title;
  final String desc;
  final String confirmBtn;
  final String cancelBtn;
  final IconData iconUrl;
  final void Function()? onPressed;

  const ConfirmAlert({
    super.key,
    required this.title,
    required this.desc,
    required this.confirmBtn,
    required this.cancelBtn,
    this.iconUrl = LucideIcons.messageCircleQuestionMark,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    void closeDialog() {
      Navigator.of(context).pop();
    }

    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(
        horizontal: width * 0.03,
        vertical: height * 0.01,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomCloseButton(onTap: () {
                closeDialog();
              })
            ],
          ),
          Icon(
            iconUrl,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: height * 0.02,
            ),
            child: BuildText(
              text: title,
              color: AppColors.blue,
              weight: FontWeight.w700,
              size: width * 0.042,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: height * 0.01,
            ),
            child: BuildText(
              text: desc,
              color: AppColors.greyDark,
              size: width * 0.033,
              textOverflow: TextOverflow.visible,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,),
                  onPressed: onPressed,
                  child: BuildText(
                    text: confirmBtn,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                    onPressed: () {
                      closeDialog();
                    },
                    child: BuildText(
                      text: cancelBtn,
                      color: AppColors.grey,
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../theme/colors.dart';
import '../../theme/text_style.dart';
import '../close_button.dart';

class ErrorAlert extends StatelessWidget {
  final String title;
  final String desc;
  final String actionBtn;
  final IconData iconUrl;
  final void Function()? onClosed;

  const ErrorAlert({
    super.key,
    required this.title,
    required this.desc,
    required this.actionBtn,
    this.iconUrl = LucideIcons.circleX,
    this.onClosed,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    void closeDialog() {
      if (onClosed != null) {
        onClosed!();
      } else {
        Navigator.of(context).pop();
      }
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
              color: AppColors.red,
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
                  onPressed: () {
                    closeDialog();
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                      AppColors.red,
                    ),
                  ),
                  child: BuildText(
                    text: actionBtn,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

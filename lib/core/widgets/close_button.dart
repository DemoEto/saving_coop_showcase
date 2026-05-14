import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../theme/colors.dart';

class CustomCloseButton extends StatelessWidget {
  final void Function()? onTap;
  final double size;
  final Color iconColor;
  final Color bgColor;

  const CustomCloseButton({
    super.key,
    required this.onTap,
    this.size = 25.0,
    this.iconColor = AppColors.white,
    this.bgColor = AppColors.greyLight2,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
              width: size,
              height: size,
              child: Icon(
                LucideIcons.circleX,
                color: iconColor,
                size: 24,
              )),
        ),
      ),
    );
  }
}

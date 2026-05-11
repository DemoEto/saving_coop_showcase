import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../theme/colors.dart';

class CustomCircleAvatar extends StatelessWidget {
  final String? path;
  final double radius;
  final bool isCamera;
  final void Function()? onTap;
  final Color? borderColor;

  const CustomCircleAvatar({
    super.key,
    this.path,
    required this.radius,
    this.isCamera = false,
    this.onTap,
    this.borderColor = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: onTap,
      child: Stack(
        children: [
          Material(
            elevation: 0,
            shape: const CircleBorder(),
            child: CircleAvatar(
              radius: radius,
              backgroundColor: borderColor,
              child: CircleAvatar(
                radius: radius * 0.95,
                backgroundColor: AppColors.greyLight2,
                backgroundImage:
                    path != null ? NetworkImage(path!) : null,
                child: path == null
                    ? Icon(
                        LucideIcons.user500,
                        size: radius,
                        color: AppColors.grey,
                      )
                    : null,
              ),
            ),
          ),
          if (isCamera)
            Positioned(
              right: 0,
              bottom: 0,
              child: Material(
                elevation: 2,
                shape: const CircleBorder(),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: radius * 0.3,
                  child: Icon(
                    Icons.camera_alt_rounded,
                    color: AppColors.greyDark,
                    size: radius * 0.4,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

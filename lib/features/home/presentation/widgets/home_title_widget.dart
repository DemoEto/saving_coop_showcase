import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../../core/widgets/custom_circle_avatar.dart';

class HomeTitleWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? userName;
  final String? userSurname;
  final String? avatarPath;
  final VoidCallback? onProfileTap;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onLogoutTap;

  const HomeTitleWidget({
    super.key,
    this.userName,
    this.userSurname,
    this.avatarPath,
    this.onProfileTap,
    this.onNotificationTap,
    this.onLogoutTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            // Avatar + Name
            GestureDetector(
              onTap: onProfileTap,
              child: Row(
                children: [
                  CustomCircleAvatar(path: avatarPath, radius: 20),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'สวัสดี',
                        style: TextStyle(
                          fontSize: AppFontSizes.base,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                          fontFamily: AppFontFamilies.primary,
                        ),
                      ),
                      Text(
                        userName ?? 'ชื่อผู้ใช้',
                        style: const TextStyle(
                          fontSize: AppFontSizes.mini,
                          color: AppColors.grey,
                          fontFamily: AppFontFamilies.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Action icons
            IconButton(
              icon: const Icon(Icons.notifications_outlined,
                  color: AppColors.greyDark),
              onPressed: onNotificationTap,
              tooltip: 'แจ้งเตือน',
            ),
            IconButton(
              icon: const Icon(Icons.logout_rounded, color: AppColors.greyDark),
              onPressed: onLogoutTap,
              tooltip: 'ออกจากระบบ',
            ),
          ],
        ),
      ),
    );
  }
}

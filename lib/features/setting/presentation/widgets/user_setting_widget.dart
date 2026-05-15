import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:saving_coop_showcase/core/routes/app_routes.dart';
import 'package:saving_coop_showcase/core/l10n/context_extension.dart';
import 'package:saving_coop_showcase/core/theme/colors.dart';
import 'package:saving_coop_showcase/core/widgets/alerts/alert_modal.dart';
import 'package:saving_coop_showcase/core/utils/app_loading.dart';

class UserSettingwidget extends StatelessWidget {
  const UserSettingwidget({super.key});

  @override
  Widget build(BuildContext context) {
    void goToChangePassword(BuildContext context, String title) {
      // Navigator.pushNamed(
      //   context,
      //   AppRoutes.changePassword,
      //   arguments: {'title': title},
      // );
    }
    void goToChangePin(BuildContext context, String title) {
      // Navigator.pushNamed(
      //   context,
      //   AppRoutes.changePin,
      //   arguments: {'title': title},
      // );
    }
    void goToManageDevices(BuildContext context, String title) {
      // Navigator.pushNamed(
      //   context,
      //   AppRoutes.manageDevice,
      //   arguments: {'title': title},
      // );
    }
    void goToManageNotifications(BuildContext context, String title) {
      // Navigator.pushNamed(
      //   context,
      //   AppRoutes.manageNotification,
      //   arguments: {'title': title},
      // );
    }

    void onTapUserMenu(BuildContext context, String component) {
      switch (component) {
        case 'SettingChangePassword':
          goToChangePassword(context, context.t.changePassword);
          break;

        case 'ChangePin':
          goToChangePin(context, context.t.changePin);
          break;

        case 'SettingManageDevice':
          goToManageDevices(context, context.t.manageDevices);
          break;

        case 'SettingManageNotification':
          goToManageNotifications(context, context.t.manageNotification);
          break;
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
          decoration: BoxDecoration(color: AppColors.greyLight),
          child: Text(
            context.t.userSetting,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: GridView.count(
            padding: EdgeInsets.zero,
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.2,
            children: [
              Cardmenu(
                title: context.t.editMemberInfo,
                icon: LucideIcons.userPen,
                ontap: () async {
                  // แสดง loading
                  AppLoading.show();

                  // ตรวจสอบสิทธิ์ก่อน

                  AppLoading.dismiss();

                  // แสดงข้อความแจ้งเตือน
                  showDialog(
                    context: context,
                    builder: (_) => AlertModal(
                      type: AlertModalType.WARNING,
                      title: context.t.accessDenied,
                      desc:
                          "ท่านไม่สามารถแก้ไขข้อมูลได้ในขณะนี้ อาจเนื่องจากสหกรณ์ปิดปรับปรุงระบบหรือจำกัดสิทธิ์การเข้าถึง",
                      onConfirm: () {},
                    ),
                  );
                },
              ),
              Cardmenu(
                  title: context.t.changePassword,
                  icon: LucideIcons.keyRound,
                  ontap: () => onTapUserMenu(context, 'SettingChangePassword')),
              Cardmenu(
                  title: context.t.changePin,
                  icon: LucideIcons.grip,
                  ontap: () => onTapUserMenu(context, 'ChangePin')),
              Cardmenu(
                  title: context.t.manageDevices,
                  icon: LucideIcons.tabletSmartphone,
                  ontap: () => onTapUserMenu(context, 'SettingManageDevice')),
              Cardmenu(
                  title: context.t.manageNotification,
                  icon: LucideIcons.bellRing,
                  ontap: () =>
                      onTapUserMenu(context, 'SettingManageNotification')),
            ],
          ),
        ),
      ],
    );
  }
}

class Cardmenu extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? ontap;

  const Cardmenu({
    super.key,
    required this.title,
    required this.icon,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: ontap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 44, color: AppColors.blueDark3),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis, // ⭐ กันข้อความล้น
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:saving_coop_showcase/core/bloc/auth/auth_bloc.dart';
import 'package:saving_coop_showcase/core/routes/app_routes.dart';
import 'package:saving_coop_showcase/core/l10n/context_extension.dart';
import 'package:saving_coop_showcase/core/theme/colors.dart';
import 'package:saving_coop_showcase/core/widgets/alerts/alert_modal.dart';
// import 'package:saving_coop_showcase/core/widgets/alerts/alert_modal.dart';

class OtherSettingwidget extends StatelessWidget {
  const OtherSettingwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
              decoration: BoxDecoration(color: Colors.grey[200]),
              child: Text(
                context.t.other,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 8),
            OtherItem(
              title: context.t.faq,
              icon: LucideIcons.circleQuestionMark,
            ),
            OtherItem(
              title: context.t.personalDataProtection,
              icon: LucideIcons.shieldUser,
            ),
            OtherItem(
              title: context.t.versionApplication,
              icon: LucideIcons.info,
            ),
            OtherItem(
                title: context.t.signout,
                icon: LucideIcons.logOut,
                ontap: () => _confirmLogout(context)),
          ],
        );
      },
    );
  }

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('ออกจากระบบ'),
        content: const Text('คุณต้องการออกจากระบบหรือไม่?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('ยกเลิก'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              context.read<AuthBloc>().add(AuthLogoutRequested());
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.red),
            child: const Text('ออกจากระบบ'),
          ),
        ],
      ),
    );
  }
}

class OtherItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? ontap;

  const OtherItem({
    super.key,
    required this.title,
    required this.icon,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        InkWell(
          onTap: ontap,
          child: Container(
            height: 45, 
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(icon, size: 32, color: AppColors.blueDark3),
                const SizedBox(width: 10),
                Text(title, style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: const Divider(color: Colors.grey, thickness: 0.5),
        ),
      ],
    );
  }
}

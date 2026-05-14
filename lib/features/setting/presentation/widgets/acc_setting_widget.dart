import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:saving_coop_showcase/core/l10n/context_extension.dart';
import 'package:saving_coop_showcase/core/bloc/locale/locale_bloc.dart';
import 'package:saving_coop_showcase/core/theme/colors.dart';
// import 'package:mobile_application/core/bloc/settings/settings_bloc.dart';
// import 'package:saving_coop_showcase/feature/setting/presentation/pages/setting_view_balance_page.dart';

class AccSettingwidget extends StatelessWidget {
  const AccSettingwidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool markacc = true;

    // return BlocProvider.value(
    //   value: context.read<SettingsBloc>()..add(SettingsInitEvent()),
    //   child:
    //   BlocBuilder<SettingsBloc, SettingsState>(
    //     builder: (context, state) {
    //       if (state is SettingsLoadedState) {
    //         markacc = state.hideAccount ?? markacc;
    //       }

    return BlocBuilder<LocaleBloc, LocaleState>(
      builder: (context, _) {
        return Column(
          children: [
            /// ===== Header =====
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
              decoration: BoxDecoration(color: Colors.grey[200]),
              child: Text(
                context.t.accountSetting,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),

            SizedBox(height: 8),
            AccItem(
              title: context.t.appAccountDeletion,
              icon: LucideIcons.userMinus,
              isFontAwesome: true,
            ),
            AccItem(
              title: context.t.limitAmountTransaction,
              icon: LucideIcons.gauge,
            ),
            AccItem(
              title: context.t.markAccountNo,
              icon: LucideIcons.eyeOff,
              undertitle: Text(
                '001-xxx-1001',
                style: const TextStyle(color: Colors.grey),
              ),
              trailing: Switch(
                value: markacc,
                onChanged: (value) {
                  // context.read<SettingsBloc>().add(
                  //   SettingsChangeHideAccountEvent(value),
                  // );
                },
              ),
            ),
            AccItem(title: context.t.favorite, icon: LucideIcons.star),
            AccItem(
              title: context.t.viewBalanceAtHome,
              icon: LucideIcons.walletCards,
              ontap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => SettingViewBalance()),
                // );
              },
            ),
          ],
        );
      },
    );
  }
}

class AccItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isFontAwesome;
  final VoidCallback? ontap;
  final Widget? trailing;
  final Widget? undertitle;

  const AccItem({
    super.key,
    required this.title,
    required this.icon,
    this.isFontAwesome = false,
    this.ontap,
    this.trailing,
    this.undertitle,
  });

  @override
  Widget build(BuildContext context) {
    final double size = isFontAwesome ? 30 : 34;
    final String textspace = isFontAwesome ? " " : "";

    return Column(
      children: [
        InkWell(
          onTap: ontap,
          child: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(icon, size: size, color: AppColors.blueDark3),
                const SizedBox(width: 12),
                //-- If undertitle null show normal widget
                (undertitle == null)
                    ? Expanded(
                        child: Text(
                          textspace + title,
                          style: const TextStyle(fontSize: 16),
                        ),
                      )
                    : Expanded(
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 3),
                                Text(
                                  textspace + title,
                                  style: const TextStyle(fontSize: 16),
                                ),
                                undertitle!,
                              ],
                            ),
                          ],
                        ),
                      ),
                if (trailing != null) trailing!,
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

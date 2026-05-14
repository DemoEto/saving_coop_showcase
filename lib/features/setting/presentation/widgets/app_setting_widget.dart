import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:saving_coop_showcase/core/bloc/locale/locale_bloc.dart';
import 'package:saving_coop_showcase/core/l10n/context_extension.dart';
import 'package:saving_coop_showcase/core/theme/colors.dart';
// import 'package:saving_coop_showcase/core/bloc/settings/settings_bloc.dart';

class AppSettingwidget extends StatelessWidget {
  const AppSettingwidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool biometric = false;
    // return BlocProvider.value(
    //   value: context.read<SettingsBloc>()..add(SettingsInitEvent()),
    //   child: BlocBuilder<SettingsBloc, SettingsState>(
    //     builder: (context, state) {
    //       FontSize fontSize = FontSize.NORMAL;

    //       if (state is SettingsLoadedState) {
    //         fontSize = state.fontSize ?? FontSize.NORMAL;
    //         biometric = state.biometric ?? false;
    //       }

    return Column(
      children: [
        /// ===== Header =====
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
          decoration: BoxDecoration(color: Colors.grey[200]),
          child: Text(
            context.t.applicationSetting,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),

        /// ===== Language =====
        BlocBuilder<LocaleBloc, LocaleState>(
          builder: (context, state) {
            Locale locale = const Locale('th');

            if (state is LocaleInitialState || state is LocaleChangedState) {
              locale = (state as dynamic).locale;
            }

            return AppItem(
              title: context.t.language,
              icon: LucideIcons.languages,
              trailing: TextButton(
                onPressed: () {
                  context.read<LocaleBloc>().add(
                        LocaleChangedEvent(locale.languageCode == 'th' ? 1 : 0),
                      );
                },
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.blueDark3,
                  side: const BorderSide(width: 1,color: AppColors.blueDark3),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                ),
                child: Text(
                  locale.languageCode == 'th'
                      ? 'Switch to English'
                      : 'เปลี่ยนเป็นภาษาไทย',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            );
          },
        ),

        /// ===== Font Size =====
        AppItem(
          title: context.t.changeFontsize,
          icon: LucideIcons.typeOutline,
          trailing: InkWell(
            onTap: () {
              // AppModal.showBottomSheet(
              //   context,
              //   (context) => FontSizeModal(fontSize: fontSize),
              // );
            },
            child: Text(
              'N/A',
              // getSizeFromValue(fontSize, t),
              style: const TextStyle(color: AppColors.blueDark3),
            ),
          ),
        ),

        /// ===== Biometric =====
        AppItem(
          title: context.t.enableAnd('Touch ID / Face ID'),
          icon: LucideIcons.fingerprintPattern,
          trailing: Switch(
            value: biometric,
            onChanged: (value) {
              // context.read<SettingsBloc>().add(
              //   SettingsChangeBiometricEvent(value),
              // );
            },
          ),
        ),
      ],
    );
  }
}

// String getSizeFromValue(FontSize e, AppLocalizations t) {
//   if (e == FontSize.SMALL) return context.t.small;
//   if (e == FontSize.NORMAL) return context.t.normal;
//   if (e == FontSize.LARGE) return context.t.large;
//   return context.t.normal;
// }

/// =======================================================
/// Reusable AppItem
/// =======================================================
class AppItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? ontap;
  final Widget? trailing;

  const AppItem({
    super.key,
    required this.title,
    required this.icon,
    this.ontap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: ontap,
          child: SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Icon(icon, size: 28, color: AppColors.blueDark3),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(title, style: const TextStyle(fontSize: 16)),
                    ),
                    if (trailing != null) trailing!,
                  ],
                ),
              )),
        ),
        Divider(
          height: 1,
          thickness: 0.5,
          color: Colors.grey[300],
          indent: 20,
          endIndent: 20,
        ),
      ],
    );
  }
}

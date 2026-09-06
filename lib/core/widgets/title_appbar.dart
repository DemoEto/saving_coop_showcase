import 'package:flutter/material.dart';

import '../l10n/context_extension.dart';
import '../theme/theme.dart';

class TitleAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? action;
  final Widget? leading;
  final VoidCallback? onBack;

  const TitleAppbar({
    super.key, 
    required this.title, 
    this.action,
    this.leading,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(color: AppColors.blueDark3),
                child: AppBar(
                  leading: title == context.t.setting
                      ? null
                      : leading ??
                            IconButton(
                              icon: const Icon(Icons.arrow_back),
                              onPressed: onBack ?? () => Navigator.of(context).pop(),
                            ),

                  automaticallyImplyLeading: title == context.t.transferSlip
                      ? false
                      : true,
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  iconTheme: const IconThemeData(color: Colors.white),
                  title: BuildText(
                    text: title,

                    color: AppColors.white,
                    size: AppFontSizes.h2,
                    weight: AppFontWeight.bold,
                  ),
                  actions: action == null ? null : [action!],
                ),
              ),
              Container(
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  color: AppColors.background,
                ),
              ),
            ],
          );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight+30);
}
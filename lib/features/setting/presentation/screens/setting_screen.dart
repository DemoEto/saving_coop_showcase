import 'package:flutter/material.dart';

import '../widgets/acc_setting_widget.dart';
import '../widgets/app_setting_widget.dart';
import '../widgets/other_setting_widget.dart';
import '../widgets/user_setting_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(        // ✅ เปลี่ยนจาก SingleChildScrollView
        slivers: [
          SliverToBoxAdapter(child: UserSettingwidget()),
          SliverToBoxAdapter(child: AccSettingwidget()),
          SliverToBoxAdapter(child: AppSettingwidget()),
          SliverToBoxAdapter(child: OtherSettingwidget()),
        ],
      ),
    );
  }
}
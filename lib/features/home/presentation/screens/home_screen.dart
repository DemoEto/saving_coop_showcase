import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:saving_coop_showcase/core/bloc/auth/auth_bloc.dart';
import 'package:saving_coop_showcase/core/theme/colors.dart';

import '../../bloc/home_bloc.dart';
import '../widgets/home_title_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

   @override
  void initState() {
    super.initState();
    // context.read<SettingViewBalanceBloc>().add(SettingViewBalanceInitEvent());
    // context.read<HomeBloc>().add(HomeFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: HomeTitleWidget(
        userName: 'Admin',
        onNotificationTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('ไม่มีการแจ้งเตือน')),
          );
        },
        onLogoutTap: () => _confirmLogout(context),
      ),
      body: 
      BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message ?? 'เกิดข้อผิดพลาด'),
                backgroundColor: AppColors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is HomeErrorState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline,
                      size: 64, color: AppColors.red),
                  const SizedBox(height: 16),
                  Text(state.message ?? 'เกิดข้อผิดพลาด'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () =>
                        context.read<HomeBloc>().add(HomeFetchEvent()),
                    child: const Text('ลองใหม่'),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async =>
                context.read<HomeBloc>().add(HomeFetchEvent()),
            child: const SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
                  // เพิ่มเส้นขอบบนบางๆ แทนการใช้เงา (Elevation) เพื่อความ Modern
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.grey.shade200, width: 1),
                    ),
                  ),
                  child: BottomNavigationBar(
                    currentIndex: _currentIndex,
                    onTap: (index) => setState(() => _currentIndex = index),
                    type: BottomNavigationBarType.fixed,
                    // backgroundColor: Colors.white,
                    selectedItemColor: Colors
                        .blue
                        .shade700, // ใช้สีส้มที่เข้มขึ้นนิดนึงให้อ่านง่าย
                    unselectedItemColor: Colors.grey.shade700,
                    elevation: 0, // ปิดเงาฟุ้งๆ ตาม Feedback "ลดแสงและเงา"
                    // กำหนดขนาด Font ให้คงที่และกระชับ
                    selectedFontSize: 12,
                    unselectedFontSize: 12,
                    selectedLabelStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                    unselectedLabelStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                    ),

                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(LucideIcons.house, size: 22),
                        // ใช้การเพิ่มความหนาเส้น (strokeWidth) แทน fontWeight ใน Icon
                        activeIcon: Icon(LucideIcons.house, size: 24),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(LucideIcons.layoutGrid, size: 22),
                        activeIcon: Icon(
                          LucideIcons.layoutGrid,
                          size: 24,
                        ),
                        label: 'General',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(LucideIcons.scanLine, size: 22),
                        activeIcon: Icon(LucideIcons.scanLine, size: 24),
                        label: 'Scan',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(LucideIcons.settings, size: 22),
                        activeIcon: Icon(LucideIcons.settings, size: 24),
                        label: 'Setting',
                      ),
                    ],
                  ),
    ));
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

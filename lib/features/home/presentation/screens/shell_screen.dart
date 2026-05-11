import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:saving_coop_showcase/core/bloc/auth/auth_bloc.dart';
import 'package:saving_coop_showcase/core/bloc/navigation/navigation_bloc.dart';
import 'package:saving_coop_showcase/core/routes/app_routes.dart';
import 'package:saving_coop_showcase/core/theme/colors.dart';

// Import แต่ละ Tab Screen
import '../widgets/home_title_widget.dart';

class MainShellScreen extends StatefulWidget {
  const MainShellScreen({super.key});

  @override
  State<MainShellScreen> createState() => _MainShellScreenState();
}

class _MainShellScreenState extends State<MainShellScreen> {
  // Navigator key แยกกันแต่ละ tab → nested navigation
  final List<GlobalKey<NavigatorState>> _navigatorKeys = List.generate(
    4,
    (_) => GlobalKey<NavigatorState>(),
  );

  late final List<Widget> _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = List.generate(
    4,
    (index) => Navigator(
      key: _navigatorKeys[index],
      onGenerateRoute: (_) => MaterialPageRoute(
        // ✅ ดึง widget จาก AppRoutes.tabScreen แทน
        builder: (ctx) => AppRoutes.tabScreen(ctx, index),
      ),
    ),
  );
  }


  /// กด Back → pop ใน tab นั้นก่อน, ถ้า stack หมดแล้วค่อย minimize app
  Future<bool> _onWillPop(int currentIndex) async {
    final nav = _navigatorKeys[currentIndex].currentState;
    if (nav != null && nav.canPop()) {
      nav.pop();
      return false; // ไม่ออกจาก app
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, navState) {
        final currentIndex = navState.currentIndex;

        return WillPopScope(
          onWillPop: () => _onWillPop(currentIndex),
          child: Scaffold(
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

            // ✅ IndexedStack รักษา state ของทุก tab ไว้ตลอด
            body: IndexedStack(
              index: currentIndex,
              children: _tabs,
            ),

            bottomNavigationBar: _BottomNavBar(currentIndex: currentIndex),
          ),
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

// ──────────────────────────────────────────────
// แยก BottomNav เป็น Widget ย่อย (Single Responsibility)
// ──────────────────────────────────────────────
class _BottomNavBar extends StatelessWidget {
  final int currentIndex;
  const _BottomNavBar({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey.shade200, width: 1)),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) =>
            context.read<NavigationBloc>().add(NavigationTabChanged(index)),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue.shade700,
        unselectedItemColor: Colors.grey.shade700,
        elevation: 0,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.house, size: 22),
            activeIcon: Icon(LucideIcons.house, size: 24),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.layoutGrid, size: 22),
            activeIcon: Icon(LucideIcons.layoutGrid, size: 24),
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
    );
  }
}
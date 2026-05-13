import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:saving_coop_showcase/core/theme/colors.dart';

import '../../domain/entities/menu_item.dart';
import '../widgets/menu_title_widget.dart';

/// General page — presentation layer only.
/// Business data (menus) is built via [GeneralMenuFactory] to keep
/// the widget tree free of construction logic.
class GeneralScreen extends StatelessWidget {
  const GeneralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tmenus = TransactionMenuFactory.build(context);
    final gmenus = GeneralMenuFactory.build(context);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
 
            // ── Transaction section ──────────────────────────────────────
            const SliverToBoxAdapter(
              child: MenuTitleWidget(text: 'ธุรกรรม', color: AppColors.blueDark3),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            _MenuGrid(menus: tmenus),
 
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
 
            // ── General section ──────────────────────────────────────────
            const SliverToBoxAdapter(
              child: MenuTitleWidget(text: 'ทั่วไป', color: AppColors.green),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            _MenuGrid(menus: gmenus),
 
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Responsive grid — sliver-based so it participates in the outer scroll view.
// ─────────────────────────────────────────────────────────────────────────────

class _MenuGrid extends StatelessWidget {
  const _MenuGrid({required this.menus});
 
  final List<MenuItem> menus;
 
  int _crossAxisCount(double width) {
    if (width >= 840) return 6;
    if (width >= 600) return 5;
    return 4;
  }
 
  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(
      builder: (context, constraints) {
        final columns = _crossAxisCount(constraints.crossAxisExtent);
        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _MenuTile(item: menus[index]),
              childCount: menus.length,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              mainAxisSpacing: 0,
              crossAxisSpacing: 12,
              childAspectRatio: 0.82,
            ),
          ),
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Single menu tile — self-contained, independently testable widget.
// ─────────────────────────────────────────────────────────────────────────────

class _MenuTile extends StatelessWidget {
  const _MenuTile({required this.item});
 
  final MenuItem item;
 
  @override
  Widget build(BuildContext context) {
    final labelColor = Theme.of(context).colorScheme.onSurface;
 
    return Semantics(
      label: item.label,
      button: true,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(item.icon, size: 32, color: AppColors.black),
              const SizedBox(height: 8),
              _MenuLabel(label: item.label, color: labelColor),
            ],
          ),
        ),
      ),
    );
  }

 
  // void _navigate(BuildContext context) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute<void>(builder: (_) => item.page),
  //   );
  // }
}

// ─────────────────────────────────────────────────────────────────────────────
// Sub-widgets — each has a single responsibility.
// ─────────────────────────────────────────────────────────────────────────────

class _MenuLabel extends StatelessWidget {
  const _MenuLabel({required this.label, required this.color});
 
  final String label;
  final Color color;
 
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      child: Text(
        label,
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: color.withOpacity(0.87),
              height: 1.3,
              fontSize: 12
            ),
      ),
    );
  }
}

// class _IconBadge extends StatelessWidget {
//   const _IconBadge({required this.icon,required this.color});

//   final IconData icon;
//   final Color color;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 52,
//       height: 52,
//       decoration: BoxDecoration(
//         color: color.withOpacity(0.10),
//         borderRadius: BorderRadius.circular(14),
//       ),
//       child: Icon(icon, color: color, size: 26),
//     );
//   }
// }

// ─────────────────────────────────────────────────────────────────────────────
// Factory — keeps menu construction out of the widget tree.
// Move to domain/use_case layer if menus become dynamic (from API/BLoC).
// ─────────────────────────────────────────────────────────────────────────────
abstract final class TransactionMenuFactory {
  static List<MenuItem> build(BuildContext context) => const [
        MenuItem(icon: LucideIcons.fileText,    label: 'ใบคำขอกู้ออนไลน์'),
        MenuItem(icon: LucideIcons.settings,    label: 'จัดการบัญชี'),
        MenuItem(icon: LucideIcons.shieldCheck, label: 'ภาระค้ำประกัน'),
        MenuItem(icon: LucideIcons.creditCard,  label: 'ชำระหนี้'),
        MenuItem(icon: LucideIcons.arrowUpFromLine, label: 'ถอนเงินฝาก'),
        MenuItem(icon: LucideIcons.arrowDownToLine, label: 'ฝากเงินเข้าบัญชี'),
        MenuItem(icon: LucideIcons.arrowLeftRight,  label: 'โอนภายในบัญชีตัวเอง'),
        MenuItem(icon: LucideIcons.calendarClock,   label: 'รายการตั้งล่วงหน้า'),
      ];
}

abstract final class GeneralMenuFactory {
  static List<MenuItem> build(BuildContext context) => const [
        MenuItem(icon: LucideIcons.fileClock,      label: 'ติดตามใบคำขอกู้'),
        MenuItem(icon: LucideIcons.trendingUp,     label: 'หุ้น'),
        MenuItem(icon: LucideIcons.shieldCheck,    label: 'ภาระค้ำประกัน'),
        MenuItem(icon: LucideIcons.receipt,        label: 'ใบเสร็จรายเดือน'),
        MenuItem(icon: LucideIcons.tableProperties,label: 'ตารางประมาณการชำระ'),
        MenuItem(icon: LucideIcons.newspaper,      label: 'ข่าวสาร'),
        MenuItem(icon: LucideIcons.coins,          label: 'ปันผล'),
        MenuItem(icon: LucideIcons.calendarClock,  label: 'เรียกเก็บประจำเดือน'),
        MenuItem(icon: LucideIcons.calculator,     label: 'ประมาณการสิทธิกู้'),
        MenuItem(icon: LucideIcons.userPlus,       label: 'ผู้รับโอนผลประโยชน์'),
        MenuItem(icon: LucideIcons.gift,           label: 'สวัสดิการ'),
      ];
}
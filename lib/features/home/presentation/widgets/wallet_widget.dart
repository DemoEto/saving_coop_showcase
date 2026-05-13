import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:saving_coop_showcase/core/theme/colors.dart';
import 'package:saving_coop_showcase/core/theme/text_style.dart';

import '../../data/models/home_model.dart';

class WalletWidget extends StatefulWidget {
  const WalletWidget({super.key});

  @override
  State<WalletWidget> createState() => _WalletWidgetState();
}

class _WalletWidgetState extends State<WalletWidget> {
  final PageController _controller = PageController(viewportFraction: 0.92);
  int _currentPage = 0;

  static const List<WalletCardData> _cards = [
    WalletCardData(
      title: 'บัญชีเงินฝาก (รวม)',
      amount: '54,634,234 บาท',
      actions: [
        ActionItem(icon: LucideIcons.arrowUp, label: 'ฝากเงิน'),
        ActionItem(icon: LucideIcons.arrowDown, label: 'ถอนเงินฝาก'),
        ActionItem(icon: LucideIcons.wallet, label: 'บัญชีของฉัน'),
        ActionItem(icon: LucideIcons.clipboardClock, label: 'รายการเคลื่อนไหว'),
      ],
    ),
    WalletCardData(
      title: 'หนี้คงเหลือรวม',
      amount: '1,200,000 บาท',
      actions: [
        ActionItem(icon: LucideIcons.handCoins, label: 'ชำระหนี้'),
        ActionItem(icon: LucideIcons.fileText, label: 'ดูสัญญาเงินกู้'),
        ActionItem(icon: LucideIcons.clipboardClock, label: 'รายการเคลื่อนไหว'),
      ],
    ),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
       mainAxisSize: MainAxisSize.min,
      children: [
        AspectRatio(
          aspectRatio: 2.4, // ปรับได้: กว้าง:สูง
          child: PageView.builder(
            controller: _controller,
            clipBehavior: Clip.none,
            itemCount: _cards.length,
            onPageChanged: (i) => setState(() => _currentPage = i),
            itemBuilder: (context, index) {
              return _WalletCard(
                data: _cards[index],
                index: index,           // ✅ ส่ง index ของการ์ดนั้น
                totalCards: _cards.length,
                currentPage: _currentPage,
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        _PageIndicator(count: _cards.length, current: _currentPage),
      ],
    );
  }
}

class _WalletCard extends StatelessWidget {
  final WalletCardData data;
  final int index;
  final int totalCards;
  final int currentPage;

  const _WalletCard({
    required this.data,
    required this.index,
    required this.totalCards,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    // ✅ margin ใช้ index ของการ์ดนั้น ไม่ใช่ currentPage
    final EdgeInsets margin = switch (index) {
      0 => const EdgeInsets.only(right: 8),
      _ when index == totalCards - 1 => const EdgeInsets.only(left: 8),
      _ => const EdgeInsets.symmetric(horizontal: 8),
    };

    return Container(
      margin: margin,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            offset: const Offset(0, 2),
            blurRadius: 8,
          ),
        ],
      ),
      // ✅ Column ไม่ fix height → ขยายตาม AspectRatio ของ parent
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.title,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(4),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  child: Row(
                    children: [
                      BuildText(text: 'ดูยอดเงิน', color: AppColors.blue),
                      SizedBox(width: 4),
                      Icon(LucideIcons.eye, size: 14, color: AppColors.blue),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            data.amount,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(), // ✅ ดัน actions ลงล่างเสมอโดยไม่ต้อง fix SizedBox
          // Actions row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: data.actions
                .map((action) => _ActionButton(item: action))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final ActionItem item;
  const _ActionButton({required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (item.routeName != null) {
          Navigator.pushNamed(context, item.routeName!);
        }
      },
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(item.icon, color: Colors.white, size: 18),
            ),
            const SizedBox(height: 4),
            // ✅ ไม่ fix width/height → ใช้ConstrainedBox + flexible แทน
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 64),
              child: Text(
                item.label,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 10, height: 1.3),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PageIndicator extends StatelessWidget {
  final int count;
  final int current;
  const _PageIndicator({required this.count, required this.current});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final isActive = current == index;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          width: isActive ? 16 : 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isActive ? AppColors.blueDark3 : Colors.grey.shade300,
          ),
        );
      }),
    );
  }
}
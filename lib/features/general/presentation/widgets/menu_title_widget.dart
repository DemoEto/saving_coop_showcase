import 'package:flutter/material.dart';
import 'package:saving_coop_showcase/core/theme/colors.dart';
import 'package:saving_coop_showcase/core/theme/text_style.dart';

class MenuTitleWidget extends StatelessWidget {
  final String text;
  final Color color;

  const MenuTitleWidget({
    super.key,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    // ลบ width และ height ที่เป็นค่าคงที่ออก เพื่อให้มันยืดหยุ่นตามเนื้อหา
    final width = MediaQuery.of(context).size.width;

    return UnconstrainedBox(
      // ใช้เพื่อให้ Container ไม่ถูกบังคับให้กว้างเต็มพื้นที่จาก Parent (Sliver)
      alignment: Alignment.centerLeft,
      child: Container(
        // ลบ width: width * 0.29 ออก
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        // เพิ่ม Padding ซ้ายขวาตามต้องการ เพื่อให้ยาวกว่าข้อความนิดเดียว
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        alignment: Alignment.centerLeft,
        child: BuildText(
          text: text,
          weight: FontWeight.w700,
          size: 18,
          color: AppColors.white,
        ),
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   final height = MediaQuery.of(context).size.height;
  //   final width = MediaQuery.of(context).size.width;

  //   return Container(
  //     width: width * 0.29,
  //     height: height * 0.045,
  //     decoration: BoxDecoration(
  //       color: color,
  //       borderRadius: const BorderRadius.only(
  //         bottomRight: Radius.circular(10),
  //         topRight: Radius.circular(10),
  //       ),
  //     ),
  //     padding: const EdgeInsets.symmetric(horizontal: 13),
  //     alignment: Alignment.centerLeft,
  //     child: BuildText(
  //       text: text,
  //       weight: FontWeight.w700,
  //       size: width * 0.042,
  //       color: AppColors.white,
  //     ),
  //   );
  // }
}

import 'package:flutter/material.dart';

class BuildText extends StatelessWidget {
  final String text;
  final FontWeight weight;
  final double? size;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow textOverflow;
  final int? maxLine;
  final List<Shadow>? shadows;
  final String? fontstyle;

  const BuildText({
    super.key,
    required this.text,
    this.weight = FontWeight.w400,
    this.size,
    this.color,
    this.textAlign,
    this.textOverflow = TextOverflow.ellipsis,
    this.maxLine,
    this.shadows,
    this.fontstyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontWeight: weight,
        fontSize: size,
        color: color,
        // fontFamily: fontstyle ?? AppFontFamilies.bodysection,
        // fontFamily: AppFontFamilies.primary,
        shadows: shadows,
      ),
      overflow: textOverflow,
      maxLines: maxLine,
    );
  }
}

import 'package:college_project/components/text/AppText.dart';
import 'package:college_project/components/text/textTypes.dart';
import 'package:flutter/material.dart';

class CaptionText extends StatelessWidget {
  final String text;
  final Color? color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextOverflow? overflow;
  final TextColorVariant colorVariant;
  final AppFontFamily fontFamily;
  const CaptionText(
      {super.key,
      required this.text,
      this.fontFamily = AppFontFamily.secondary,
      this.color,
      this.fontSize = 8,
      this.fontWeight = FontWeight.w400,
      this.overflow,
      this.colorVariant = TextColorVariant.disabled});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return AppText(
      text: text,
      color: getTextColor(theme, colorVariant, color: color),
      fontSize: fontSize,
      fontWeight: fontWeight,
      overflow: overflow,
      fontFamily: fontFamily,
    );
  }
}

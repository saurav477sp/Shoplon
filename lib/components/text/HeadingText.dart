import 'package:college_project/components/text/AppText.dart';
import 'package:college_project/components/text/textTypes.dart';
import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  final String text;
  final Color? color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextOverflow? overflow;
  final TextColorVariant colorVariant;
  final TextAlign? textAlign;
  final AppFontFamily fontFamily;
  const HeadingText(
      {super.key,
      required this.text,
      this.color,
      this.fontFamily = AppFontFamily.primary,
      this.fontSize = 30,
      this.fontWeight = FontWeight.w700,
      this.overflow,
      this.colorVariant = TextColorVariant.onPrimary,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return AppText(
      text: text,
      color: getTextColor(theme, colorVariant, color: color),
      fontSize: fontSize,
      fontWeight: fontWeight,
      overflow: overflow,
      textAlign: textAlign,
      fontFamily: fontFamily,
    );
  }
}

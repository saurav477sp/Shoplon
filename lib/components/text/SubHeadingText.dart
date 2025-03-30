import 'package:college_project/components/text/AppText.dart';
import 'package:college_project/components/text/textTypes.dart';
import 'package:flutter/material.dart';

class SubHeadingText extends StatelessWidget {
  final String text;
  final Color? color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextOverflow? overflow;
  final TextColorVariant colorVariant;
  final TextAlign? textAlign;
  final AppFontFamily fontFamily;

  const SubHeadingText(
      {super.key,
      required this.text,
      this.color,
      this.fontSize = 16,
      this.fontFamily = AppFontFamily.secondary,
      this.fontWeight = FontWeight.w500,
      this.overflow,
      this.colorVariant = TextColorVariant.primary,
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

import 'package:college_project/components/text/AppText.dart';
import 'package:college_project/components/text/textTypes.dart';
import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  final String text;
  final Color? color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextOverflow? overflow;
  final TextColorVariant colorVariant;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final AppFontFamily fontFamily;
  final int? maxLines;
  const LabelText(
      {super.key,
      required this.text,
      this.fontFamily = AppFontFamily.primary,
      this.color,
      this.textDecoration,
      this.fontSize = 18,
      this.fontWeight = FontWeight.w700,
      this.overflow,
      this.maxLines,
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
      textDecoration: textDecoration,
      maxLines: maxLines,
    );
  }
}

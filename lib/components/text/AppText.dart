import 'package:college_project/components/text/textTypes.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final AppFontFamily fontFamily;
  final TextDecoration? textDecoration;
  final int? maxLines;
  const AppText(
      {super.key,
      required this.text,
      required this.color,
      required this.fontSize,
      required this.fontWeight,
      this.fontFamily = AppFontFamily.primary,
      this.overflow,
      this.maxLines,
      this.textDecoration,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: fontFamily.toValues(),
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        overflow: overflow,
        decoration: textDecoration,
        decorationColor: color,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}

Color getTextColor(ThemeData theme, TextColorVariant colorVariant,
    {Color? color}) {
  if (color != null) {
    return color;
  }
  switch (colorVariant) {
    case TextColorVariant.primary:
      return theme.colorScheme.onBackground;
    case TextColorVariant.onPrimary:
      return theme.colorScheme.onPrimary;
    case TextColorVariant.disabled:
      return theme.disabledColor.withOpacity(0.7);
    case TextColorVariant.accent:
      return theme.colorScheme.primary;
    default:
      return theme.colorScheme.onBackground;
  }
}

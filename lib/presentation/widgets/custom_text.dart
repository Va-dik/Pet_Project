import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
    this.text, {
    super.key,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.textAlign = TextAlign.start,
    this.letterSpacing,
    this.height,
  });
  final String text;
  final double? fontSize;
  final Color? color;
  final double? height;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final double? letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          fontFamily: 'SF Pro Display',
          fontSize: fontSize ?? 14,
          color: color,
          height: height,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing),
    );
  }
}

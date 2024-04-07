import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../gen/colors.gen.dart';
import '../gen/fonts.gen.dart';

class AppText extends Text {
  final Color? color;
  final FontWeight? fontWeight;
  final double? height;
  final double? letterSpacing;
  final double fontSize;

  AppText.small(String data,
      {Key? key,
      this.color = ColorName.primaryColor,
      this.fontWeight = FontWeight.normal,
      TextAlign? textAlign = TextAlign.left,
      int? maxLine,
      TextOverflow? textOverflow,
      this.height,
      this.letterSpacing,
      this.fontSize = 12})
      : super(
          data,
          key: key,
          textAlign: textAlign,
          maxLines: maxLine,
          style: TextStyle(
            fontFamily: FontFamily.workSans,
            fontSize: fontSize,
            color: color,
            height: height,
            fontWeight: fontWeight,
            overflow: textOverflow,
            letterSpacing: letterSpacing,
          ),
        );

  AppText.medium(
    String data, {
    Key? key,
    this.color = ColorName.primaryColor,
    this.fontWeight = FontWeight.w600,
    TextAlign textAlign = TextAlign.left,
    int? maxLine,
    TextOverflow? textOverflow,
    this.height,
    this.letterSpacing,
    this.fontSize = 14,
    TextDecoration textDecoration = TextDecoration.none,
  }) : super(
          data,
          key: key,
          textAlign: textAlign,
          maxLines: maxLine,
          style: TextStyle(
            fontFamily: FontFamily.workSans,
            fontSize: fontSize,
            color: color,
            height: height,
            fontWeight: fontWeight,
            overflow: textOverflow,
            decoration: textDecoration,
            letterSpacing: letterSpacing,
          ),
        );

  AppText.large(String data,
      {Key? key,
      this.color = ColorName.primaryColor,
      this.fontWeight = FontWeight.bold,
      TextAlign? textAlign = TextAlign.center,
      int? maxLine,
      TextOverflow? textOverflow,
      this.height,
      this.letterSpacing,
      this.fontSize = 24})
      : super(
          data,
          key: key,
          textAlign: textAlign,
          maxLines: maxLine,
          style: TextStyle(
            fontFamily: FontFamily.workSans,
            fontSize: fontSize,
            color: color,
            height: height,
            fontWeight: fontWeight,
            overflow: textOverflow,
            letterSpacing: letterSpacing,
          ),
        );
}

class AppTextSpan extends TextSpan {
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final double? height;
  final double fontSize;
  final double? letterSpacing;

  AppTextSpan.large(String data,
      {this.color = ColorName.primaryColor,
      this.fontWeight = FontWeight.bold,
      this.textAlign,
      this.height,
      this.fontSize = 24,
      this.letterSpacing,
      GestureRecognizer? recognizer})
      : super(
          text: data,
          recognizer: recognizer,
          style: TextStyle(
            fontFamily: FontFamily.workSans,
            fontSize: fontSize,
            color: color,
            height: height,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight,
          ),
        );

  AppTextSpan.medium(String data,
      {this.color = ColorName.primaryColor,
      this.fontWeight = FontWeight.w600,
      this.textAlign,
      this.height,
      this.fontSize = 14,
      this.letterSpacing,
      TextDecoration textDecoration = TextDecoration.none,
      GestureRecognizer? recognizer})
      : super(
          text: data,
          recognizer: recognizer,
          style: TextStyle(
            fontFamily: FontFamily.workSans,
            fontSize: fontSize,
            color: color,
            height: height,
            letterSpacing: letterSpacing,
            decoration: textDecoration,
            fontWeight: fontWeight,
          ),
        );

  AppTextSpan.small(String data,
      {this.color = ColorName.primaryColor,
      this.fontWeight,
      this.textAlign,
      this.height,
      this.fontSize = 12,
      this.letterSpacing = 1,
      GestureRecognizer? recognizer})
      : super(
          text: data,
          recognizer: recognizer,
          style: TextStyle(
            fontFamily: FontFamily.workSans,
            fontSize: fontSize,
            color: color,
            height: height,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight,
          ),
        );
}

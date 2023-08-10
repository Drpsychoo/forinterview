import 'package:flutter/material.dart';

class CustomeSmallText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? textcolor;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  const CustomeSmallText({
    Key? key,
    required this.text,
    this.fontSize = 12,
    this.textcolor,
    this.fontWeight = FontWeight.w400,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: textcolor,
      ),
    );
  }
}

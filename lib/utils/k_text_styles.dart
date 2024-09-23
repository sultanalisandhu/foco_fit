

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Gradient gradient;
  final Function()? onTap;
  const GradientText({
    super.key,
    required this.text,
    this.style,
    required this.gradient,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (bounds) => gradient.createShader(
          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
        ),
        child: Text(text, style: style),
      ),
    );
  }
}

TextStyle primaryTextStyle({double? fontSize, FontWeight? fontWeight,Color? color,TextDecoration? textDecoration}){
  return GoogleFonts.inter(
      textStyle: TextStyle(
        decoration:textDecoration?? TextDecoration.none,
        fontSize: fontSize?? 20,
        fontWeight: fontWeight??FontWeight.w300,
        color: color??Colors.black,
      )
  );
}
import 'package:flutter/material.dart';
import 'package:focofit/components/k_svg_icon.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';

Widget kTextButton( {
  Color? color,
  Function()? onPressed,
  required String btnText,
  Widget? widget,
  Color? textColor,
  Color? borderColor,
  double? height,
  double ? width,
  double ? borderRadius,
  double ? fontSize,
  double? padding,
  bool useGradient = false,
  Gradient? gradient,
}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      alignment: Alignment.center,
      height: height??50,
      width: width,
      padding:  EdgeInsets.symmetric(horizontal: padding??15),
      decoration: BoxDecoration(
        gradient: useGradient
            ? gradient ?? AppColor.primaryGradient
            : null,
        color: useGradient ? null : (color ?? AppColor.primaryColor),
        border: Border.all(width: 1, color: borderColor??Colors.transparent),
        borderRadius: BorderRadius.circular(borderRadius??26),
      ),
      child: widget?? Text(
        btnText,
        textAlign: TextAlign.center,
        style: primaryTextStyle(fontSize: fontSize??16,
          fontWeight: FontWeight.w600,
          color: textColor??AppColor.whiteColor),),
    ),
  );
}
Widget kSocialButton({
  final Function()? onTap,
  final String? btnText,
}){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.only(left: 40),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          border: Border.all(color: AppColor.greyColor)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          showSvgIconWidget(iconPath: AppIcons.emailIcon),
          const Spacer(),
          Text(btnText!,style: primaryTextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
          const Spacer(),
        ],
      ),
    ),
  );
}


class KOutlineButton extends StatelessWidget {
  final _GradientPainter _painter;
  final Function() onTap;
  final String btnText;
  final double? height;
  final double? width;
  Gradient? textGradient;


  KOutlineButton({
    super.key,
    required this.onTap,
    required this.btnText,
    required Gradient gradient,
    this.textGradient,
    this.height,
    this.width,
  })
      : _painter = _GradientPainter(strokeWidth: 1, radius: 26, gradient: gradient);


  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _painter,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: height??50,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          width: width,
          child:
              GradientText(text: btnText, gradient: textGradient?? AppColor.primaryGradient,style: primaryTextStyle(fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColor.blackColor),),
        ),
      ),
    );
  }
}

class _GradientPainter extends CustomPainter {
  final Paint _paint = Paint();
  final double radius;
  final double strokeWidth;
  final Gradient gradient;

  _GradientPainter({required double strokeWidth, required double radius, required Gradient gradient})
      : this.strokeWidth = strokeWidth,
        this.radius = radius,
        this.gradient = gradient;

  @override
  void paint(Canvas canvas, Size size) {
    // create outer rectangle equals size
    Rect outerRect = Offset.zero & size;
    var outerRRect = RRect.fromRectAndRadius(outerRect, Radius.circular(radius));

    // create inner rectangle smaller by strokeWidth
    Rect innerRect = Rect.fromLTWH(strokeWidth, strokeWidth, size.width - strokeWidth * 2, size.height - strokeWidth * 2);
    var innerRRect = RRect.fromRectAndRadius(innerRect, Radius.circular(radius - strokeWidth));

    // apply gradient shader
    _paint.shader = gradient.createShader(outerRect);

    // create difference between outer and inner paths and draw it
    Path path1 = Path()..addRRect(outerRRect);
    Path path2 = Path()..addRRect(innerRRect);
    var path = Path.combine(PathOperation.difference, path1, path2);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}
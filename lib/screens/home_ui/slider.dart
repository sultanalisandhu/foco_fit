import 'package:flutter/material.dart';
import 'package:focofit/components/k_svg_icon.dart';
import 'package:focofit/utils/app_colors.dart';
import 'package:focofit/utils/asset_utils.dart';
import 'package:focofit/utils/k_text_styles.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({Key? key}) : super(key: key);

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double _thumbPosition = 0; // Initial thumb position at the center
  bool _isSliding = false; // Flag to check if the thumb is being dragged
  String _currentIcon = AppIcons.arrowIcons; // Default icon

  @override
  Widget build(BuildContext context) {
    double sliderWidth = MediaQuery.of(context).size.width; // Slider bar width
    double thumbWidth = 60; // Width of the thumb widget
    double maxThumbMovement = (sliderWidth - thumbWidth) / 2; // Max movement of thumb to left and right

    // Define three fixed positions for the thumb
    double leftPosition = -maxThumbMovement; // -500 kcal
    double centerPositionOffset = 0; // 0 kcal (initial position)
    double rightPosition = maxThumbMovement; // +500 kcal

    // Calculate kcal value based on the current thumb position
    double kcalValue = (_thumbPosition / maxThumbMovement) * 500;

    // Determine opacity based on thumb position and kcal value
    double iconOpacity = (kcalValue.abs() < 500) ? 1.0 : 0.0;

    return Container(
      height: 140, // Increased height to fit the kcal value display
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Slider background container bar
          Container(
            height: 15,
            width: sliderWidth,
            decoration: BoxDecoration(
              color: AppColor.lightGreyColor,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          // Display kcal value above the thumb slider
          if (_isSliding)
            Positioned(
              top: 0, // Position at the top
              left: (sliderWidth / 2) + _thumbPosition - (thumbWidth / 2), // Align kcal display above the thumb
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColor.lightGreyColor,
                      blurRadius: 4,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Text(
                  '${kcalValue.toStringAsFixed(0)}\n kcal',
                  style: primaryTextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          // Thumb slider
          Positioned(
            // Ensure thumb does not exceed slider boundaries
            left: (sliderWidth / 2) + _thumbPosition - (thumbWidth / 2),
            top: 40, // Slightly above the bottom edge
            child: GestureDetector(
              onHorizontalDragStart: (_) {
                setState(() {
                  _isSliding = true; // Set sliding flag to true when drag starts
                });
              },
              onHorizontalDragUpdate: (details) {
                if (_isSliding) {
                  setState(() {
                    // Update thumb position within bounds
                    _thumbPosition += details.delta.dx;

                    // Update the icon based on thumb position relative to the center
                    if (_thumbPosition < 0) {
                      // Thumb is moving to the left
                      _currentIcon = details.delta.dx < 0 ? AppIcons.burnIcon : AppIcons.arrowIcons;
                    } else if (_thumbPosition > 0) {
                      // Thumb is moving to the right
                      _currentIcon = details.delta.dx > 0 ? AppIcons.knifeIcon : AppIcons.arrowIcons;
                    } else {
                      // Thumb is at center
                      _currentIcon = AppIcons.arrowIcons;
                    }

                    // Clamp thumb position to stay within left and right bounds
                    _thumbPosition = _thumbPosition.clamp(leftPosition, rightPosition);
                  });
                }
              },
              onHorizontalDragEnd: (_) {
                setState(() {
                  _isSliding = false; // Set sliding flag to false when drag ends
                  // Reset icon to default (center)
                  _currentIcon = AppIcons.arrowIcons;
                  // Snap to the closest position (left, center, or right)
                  if ((_thumbPosition - leftPosition).abs() < (_thumbPosition - centerPositionOffset).abs() &&
                      (_thumbPosition - leftPosition).abs() < (_thumbPosition - rightPosition).abs()) {
                    _thumbPosition = leftPosition; // Snap to -500 kcal
                  } else if ((_thumbPosition - centerPositionOffset).abs() < (_thumbPosition - rightPosition).abs()) {
                    _thumbPosition = centerPositionOffset; // Snap to 0 kcal
                  } else {
                    _thumbPosition = rightPosition; // Snap to +500 kcal
                  }
                });
              },
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 200),
                transitionBuilder: (child, animation) => FadeTransition(opacity: animation, child: child),
                child: Container(

                  key: ValueKey(_currentIcon), // Key to trigger animation when the icon changes
                  height: thumbWidth,
                  width: thumbWidth,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: AppColor.primaryGradient,
                  ),
                  child: showSvgIconWidget(
                    iconPath: _currentIcon,
                    color: Colors.white, // Set the icon color to white
                  ),
                ),
              ),
            ),
          ),
          // Left icon with fade-in/out transition
          Positioned(
            left: 5,
            top: 35,
            child: AnimatedOpacity(
              opacity: iconOpacity,
              duration: Duration(milliseconds: 300),
              child: showSvgIconWidget(iconPath: AppIcons.burnIcon),
            ),
          ),
          // Right icon with fade-in/out transition
          Positioned(
            right: 5,
            top: 35,
            child: AnimatedOpacity(
              opacity: iconOpacity,
              duration: Duration(milliseconds: 300),
              child: showSvgIconWidget(iconPath: AppIcons.knifeIcon),
            ),
          ),
        ],
      ),
    );
  }
}

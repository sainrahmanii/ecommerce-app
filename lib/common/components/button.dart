import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/components/spaces.dart';

import '../constants/colors.dart';

enum ButtonStyle { filled, outlined }

class Button extends StatelessWidget {
  const Button.filled({
    super.key,
    required this.onPressed,
    required this.label,
    this.style = ButtonStyle.filled,
    this.color = ColorName.primary,
    this.textColor = ColorName.white,
    this.width = double.infinity,
    this.height = 50,
    this.borderRadius = 16,
    this.icon,
    this.disabled = false,
    this.fontSize = 16,
  });

  const Button.outlined({
    super.key,
    required this.onPressed,
    required this.label,
    this.style = ButtonStyle.outlined,
    this.color = ColorName.white,
    this.textColor = ColorName.black,
    this.width = double.infinity,
    this.height = 50,
    this.borderRadius = 6,
    this.icon,
    this.disabled = false,
    this.fontSize = 16,
  });

  final Function() onPressed;
  final String label;
  final ButtonStyle style;
  final Color color;
  final Color textColor;
  final double width;
  final double height;
  final double borderRadius;
  final Widget? icon;
  final bool disabled;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: style == ButtonStyle.filled
          ? ElevatedButton(
              onPressed: disabled ? null : onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon ?? const SizedBox.shrink(),
                  if (icon != null) const SpaceWidth(width: 10),
                  Text(
                    label,
                    style: TextStyle(
                      color: textColor,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          : OutlinedButton(
              onPressed: disabled ? null : onPressed,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon ?? const SizedBox.shrink(),
                  if (icon != null) const SpaceWidth(width: 10),
                  Text(
                    label,
                    style: TextStyle(
                      color: textColor,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
    );
  }
}

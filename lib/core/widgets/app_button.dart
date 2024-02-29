import 'package:flutter/material.dart';
import 'package:taskmaster/core/widgets/enum/button_type_enum.dart';

import '../../../../config/resources/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.buttonType = ButtonType.filled,
    this.icon,
  });

  final String title;
  final ButtonType? buttonType;
  final IconData? icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: buttonType == ButtonType.filled
          ? ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(horizontal: 3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            )
          : ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              side: const BorderSide(color: AppColors.primary),
              padding: const EdgeInsets.symmetric(horizontal: 3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)
                Icon(
                  icon,
                  color: buttonType == ButtonType.filled
                      ? AppColors.lightWhite100
                      : AppColors.primary,
                ),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: buttonType == ButtonType.filled
                      ? AppColors.lightWhite100
                      : AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

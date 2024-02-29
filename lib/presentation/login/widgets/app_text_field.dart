import 'package:flutter/material.dart';

import '../../../config/resources/app_colors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.icon,
    required this.hint,
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
  });

  final String hint;
  final String icon;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 232,
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.lightWhite100,
        border: Border.all(color: AppColors.hint, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: TextField(
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        focusNode: focusNode,
        decoration: InputDecoration(
          hintText: hint,
          iconColor: AppColors.hint,
          icon: Image.asset(icon),
          contentPadding: EdgeInsets.zero,
          hintStyle: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.hint),
          enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
          border: const OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}

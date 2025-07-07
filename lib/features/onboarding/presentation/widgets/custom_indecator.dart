import 'package:arrive_alive/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class CustomIndecator extends StatelessWidget {
  const CustomIndecator({super.key, required this.active});
  final bool active;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        color: active ? AppColors.primary : Colors.grey,
        borderRadius: BorderRadius.circular(100),
      ),
      height: 10,
      width: active ? 30 : 10,
    );
  }
}

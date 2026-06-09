import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manzil/core/themes/app_colors.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3.h,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.cGoldLight, AppColors.cGold, AppColors.cGoldLight],
        ),
      ),
    );
  }
}

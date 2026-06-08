import 'package:flutter/material.dart';
import 'package:manzil/core/themes/app_colors.dart';
import 'package:manzil/core/themes/app_text_styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "بِسْمِ ٱللهِ ٱلرَّحْمٰنِ ٱلرَّحِيمِ",
          style: AppTextStyles.bismillah(color: AppColors.cGold),
        ),
      ),
    );
  }
}

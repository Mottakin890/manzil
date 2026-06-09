import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manzil/core/dimentions/spacings.dart';
import 'package:manzil/core/resources/app_assets.dart';
import 'package:manzil/core/themes/app_colors.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 56.h,
      title: Text(
        'منزل تلاوة',
        style: Theme.of(context).textTheme.headlineLarge!.copyWith(
          color: AppColors.cTextOnPrimary,
          fontSize: 28.sp,
        ),
      ),
      leading: RPadding(
        padding: EdgeInsets.only(left: 8),
        child: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            AppAssets.menu,
            height: 22.h,
            colorFilter: const ColorFilter.mode(
              AppColors.cTextOnPrimary,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
      actions: [
        RPadding(
          padding: EdgeInsets.only(right: 8),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppAssets.settings,
              height: 22.h,
              colorFilter: const ColorFilter.mode(
                AppColors.cTextOnPrimary,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        Spacing.horizontal(4),
      ],
    );
  }
}

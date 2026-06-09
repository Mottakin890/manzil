import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manzil/core/themes/app_colors.dart';
import 'package:manzil/core/themes/app_text_styles.dart';
import 'package:manzil/features/home/presentation/bloc/home_bloc.dart';

class DivisionDropDown extends StatelessWidget {
  const DivisionDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final currentDivision = state.division;
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          height: 32.h,
          decoration: BoxDecoration(
            color: AppColors.cPrimary.withValues(alpha: 0.05),
            border: Border.all(color: AppColors.cDivider, width: 0.8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: currentDivision,
              icon: Icon(
                Icons.location_on_rounded,
                color: AppColors.cPrimary,
                size: 12.sp,
              ),
              onChanged: (newDivision) {
                if (newDivision != null) {
                  context.read<HomeBloc>().add(HomeDivisionChanged(newDivision));
                }
              },
              items: kDivisions.map((division) {
                return DropdownMenuItem<String>(
                  value: division,
                  child: Text(
                    division,
                    style: AppTextStyles.labelMedium(
                      color: AppColors.cPrimary,
                    ).copyWith(fontSize: 11.sp),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
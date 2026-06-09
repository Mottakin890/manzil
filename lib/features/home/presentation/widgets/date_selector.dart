import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manzil/core/dimentions/spacings.dart';
import 'package:manzil/core/themes/app_colors.dart';
import 'package:manzil/core/themes/app_text_styles.dart';
import 'package:manzil/core/utils/date_converter.dart';
import 'package:manzil/features/home/presentation/bloc/home_bloc.dart';

class DateSelector extends StatelessWidget {
  const DateSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final currentDate = state.currentDate;
        final shortEnglish = DateConverter.formatEnglish(currentDate);
        final hijriDate = DateConverter.formatHijri(currentDate);
        final bengaliDate = DateConverter.formatBengali(currentDate);

        return InkWell(
          onTap: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: currentDate,
              firstDate: DateTime(2020),
              lastDate: DateTime(2035),
              builder: (context, child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: const ColorScheme.light(
                      primary: AppColors.cPrimary,
                      onPrimary: Colors.white,
                      onSurface: AppColors.cTextPrimary,
                    ),
                  ),
                  child: child!,
                );
              },
            );
            if (picked != null) {
              if (context.mounted) {
                context.read<HomeBloc>().add(HomeDateChanged(picked));
              }
            }
          },
          child: Container(
            padding: REdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.cPrimary.withValues(alpha: 0.03),
              border: Border.all(
                color: AppColors.cDivider.withValues(alpha: 0.5),
                width: 0.8.w,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today_rounded,
                  color: AppColors.cGold,
                  size: 13.sp,
                ),
                Spacing.horizontal(8),
                // English date on the left
                Text(
                  shortEnglish,
                  style: AppTextStyles.labelMedium(
                    color: AppColors.cPrimary,
                  ).copyWith(fontWeight: FontWeight.bold, fontSize: 12.sp),
                ),
                const Spacer(),
                // Hijri and Bengali dates stacked vertically on the right to prevent overflow
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      hijriDate,
                      style: AppTextStyles.caption(
                        color: AppColors.cTextSecondary,
                      ).copyWith(fontSize: 9.sp, height: 1.1.h),
                    ),
                    Text(
                      bengaliDate,
                      style: AppTextStyles.caption(
                        color: AppColors.cTextSecondary,
                      ).copyWith(fontSize: 9.sp, height: 1.1.h),
                    ),
                  ],
                ),
                Spacing.horizontal(4),
                Icon(
                  Icons.arrow_drop_down_rounded,
                  color: AppColors.cGold,
                  size: 16.sp,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
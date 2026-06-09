import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manzil/core/dimentions/spacings.dart';
import 'package:manzil/core/resources/app_assets.dart';
import 'package:manzil/core/themes/app_colors.dart';
import 'package:manzil/core/themes/app_text_styles.dart';
import 'package:manzil/features/home/data/models/prohibited_times.dart';
import 'package:manzil/features/home/presentation/bloc/home_bloc.dart';
import 'package:manzil/features/home/presentation/widgets/date_selector.dart';
import 'package:manzil/features/home/presentation/widgets/division_drop_down.dart';
import 'package:manzil/features/home/presentation/widgets/prayer_column.dart';
import 'package:manzil/features/home/presentation/widgets/prohibited_time_column.dart';

class PrayerScheduleCard extends StatelessWidget {
  const PrayerScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final currentDate = state.currentDate;
        final currentDivision = state.division;
        final prayerTimes = state.prayerTimes;
        final prohibited = ProhibitedTimes.calculate(currentDate, currentDivision);

        return Container(
          width: double.infinity,
          height: 300.h,
          decoration: BoxDecoration(
            color: AppColors.cCardBg,
            border: Border.all(color: AppColors.cDivider, width: 0.8.w),
            boxShadow: [
              BoxShadow(
                color: AppColors.cShadow.withValues(alpha: 0.08),
                blurRadius: 16.r,
                offset: const Offset(0, 4),
              ),
            ],
            image: const DecorationImage(
              image: AssetImage(AppAssets.bgHomeCard),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            color: AppColors.cCardBg.withValues(alpha: 0.88),
            padding: REdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.schedule_rounded,
                          color: AppColors.cPrimary,
                          size: 16.sp,
                        ),
                        Spacing.horizontal(6),
                        Text(
                          'DAILY PRAYER SCHEDULE',
                          style:
                              AppTextStyles.sectionLabel(
                                color: AppColors.cPrimary,
                              ).copyWith(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                    const DivisionDropDown(),
                  ],
                ),

                const DateSelector(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: prayerTimes
                      .map((prayer) => PrayerColumn(prayer: prayer))
                      .toList(),
                ),

                // ── Prohibited Times Horizontal Section ──
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(color: AppColors.cDivider, height: 1),
                    SizedBox(height: 6.h),
                    Row(
                      children: [
                        Icon(
                          Icons.warning_amber_rounded,
                          color: AppColors.cWarning,
                          size: 14.sp,
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          'PROHIBITED PRAYER TIMES',
                          style: AppTextStyles.sectionLabel(
                            color: AppColors.cWarning,
                          ).copyWith(fontSize: 10.sp),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.h),
                    Row(
                      children: [
                        ProhibitedTimeColumn(
                          label: 'Sunrise',
                          startTime: prohibited.sunriseStart,
                          endTime: prohibited.sunriseEnd,
                        ),
                        ProhibitedTimeColumn(
                          label: 'Midday (Zawal)',
                          startTime: prohibited.zawalStart,
                          endTime: prohibited.zawalEnd,
                        ),
                        ProhibitedTimeColumn(
                          label: 'Sunset',
                          startTime: prohibited.sunsetStart,
                          endTime: prohibited.sunsetEnd,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manzil/core/themes/app_colors.dart';
import 'package:manzil/core/themes/app_text_styles.dart';

/// A widget to display a single column of prohibited prayer times.
/// Extracted from PrayerScheduleCard for better separation of concerns (SRP).
class ProhibitedTimeColumn extends StatelessWidget {
  final String label;
  final String startTime;
  final String endTime;

  const ProhibitedTimeColumn({
    required this.label,
    required this.startTime,
    required this.endTime,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            label.toUpperCase(),
            style: AppTextStyles.labelSmall(
              color: AppColors.cTextHint,
            ).copyWith(fontSize: 9.sp, letterSpacing: 0.4),
          ),
          SizedBox(height: 2.h),
          Text(
            '$startTime - $endTime',
            style: AppTextStyles.bodySmall(
              color: AppColors.cError,
            ).copyWith(fontWeight: FontWeight.bold, fontSize: 9.sp),
          ),
        ],
      ),
    );
  }
}

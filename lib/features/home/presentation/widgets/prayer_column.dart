import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manzil/core/dimentions/spacings.dart';
import 'package:manzil/core/themes/app_colors.dart';
import 'package:manzil/core/themes/app_text_styles.dart';
import 'package:manzil/features/home/domain/entities/prayer_time.dart';

class PrayerColumn extends StatelessWidget {
  final PrayerTime prayer;

  const PrayerColumn({
    required this.prayer,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isNext = prayer.isNext;
    final startTimeParts = prayer.startTime.split(' ');
    final startStr = startTimeParts.isNotEmpty ? startTimeParts[0] : '';
    final startPeriod = startTimeParts.length > 1 ? startTimeParts[1] : '';
    final endStr = prayer.endTime;

    return Expanded(
      child: Container(
        margin: REdgeInsets.symmetric(horizontal: 2),
        padding: REdgeInsets.symmetric(vertical: 6, horizontal: 2),
        decoration: BoxDecoration(
          color: isNext ? AppColors.cPrimary : Colors.transparent,
          border: isNext
              ? Border.all(color: AppColors.cGold, width: 1.2.w)
              : Border.all(
                  color: AppColors.cDivider.withValues(alpha: 0.3),
                  width: 0.5.w,
                ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isNext) ...[
              FittedBox(
                child: Text(
                  'NEXT PRAYER',
                  style: AppTextStyles.labelSmall(color: AppColors.cGold)
                      .copyWith(
                        fontSize: 7.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                ),
              ),
              Spacing.vertical(2),
            ],
            FittedBox(
              child: Text(
                prayer.name.toUpperCase(),
                style:
                    AppTextStyles.labelMedium(
                      color: isNext ? Colors.white : AppColors.cTextPrimary,
                    ).copyWith(
                      fontWeight: isNext ? FontWeight.bold : FontWeight.w600,
                      fontSize: 10.sp,
                    ),
              ),
            ),
            Spacing.vertical(4),
            FittedBox(
              child: Text(
                '$startStr $startPeriod',
                style: AppTextStyles.titleMedium(
                  color: isNext ? AppColors.cGoldLight : AppColors.cPrimary,
                ).copyWith(fontSize: 12.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Spacing.vertical(2),
            FittedBox(
              child: Text(
                'End: $endStr',
                style: AppTextStyles.caption(
                  color: isNext ? Colors.white70 : AppColors.cTextSecondary,
                ).copyWith(fontSize: 8.5.sp, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manzil/core/themes/app_colors.dart';
import 'package:manzil/core/themes/app_text_styles.dart';
import 'package:manzil/features/home/presentation/bloc/home_bloc.dart';

/// Row of reading stats: streak, pages read, current juz.
/// Uses BlocSelector — only rebuilds when streak/page fields change.
class ReadingStatsRow extends StatelessWidget {
  const ReadingStatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: BlocSelector<HomeBloc, HomeState, _StatsData>(
        selector: (state) => _StatsData(
          streakDays: state.streakDays,
          currentPage: state.currentPage,
          pagesReadToday: state.pagesReadToday,
        ),
        builder: (context, data) {
          // Calculate current Juz (approximately 20 pages per Juz)
          final currentJuz = ((data.currentPage - 1) ~/ 20) + 1;

          return Row(
            children: [
              _StatTile(
                icon: Icons.local_fire_department_rounded,
                iconColor: AppColors.cSecondary600,
                label: 'Streak',
                value: '${data.streakDays}',
                unit: 'days',
              ),
              SizedBox(width: 12.w),
              _StatTile(
                icon: Icons.auto_stories_rounded,
                iconColor: AppColors.cPrimary,
                label: 'Read Today',
                value: '${data.pagesReadToday}',
                unit: 'pages',
              ),
              SizedBox(width: 12.w),
              _StatTile(
                icon: Icons.bookmark_rounded,
                iconColor: AppColors.cLapis,
                label: 'Current Juz',
                value: '$currentJuz',
                unit: 'of 30',
              ),
            ],
          );
        },
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;
  final String unit;

  const _StatTile({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
        decoration: BoxDecoration(
          color: AppColors.cCardBg,
          borderRadius: BorderRadius.zero,
          border: Border.all(color: AppColors.cDivider, width: 0.8),
        ),
        child: Column(
          children: [
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.zero,
              ),
              child: Icon(icon, size: 20.sp, color: iconColor),
            ),
            SizedBox(height: 10.h),
            Text(
              value,
              style: AppTextStyles.numberDisplay(
                color: AppColors.cTextPrimary,
                fontSize: 28,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              unit,
              style: AppTextStyles.caption(color: AppColors.cTextHint),
            ),
            SizedBox(height: 4.h),
            Text(
              label,
              style: AppTextStyles.labelSmall(color: AppColors.cTextSecondary),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _StatsData {
  final int streakDays;
  final int currentPage;
  final int pagesReadToday;

  const _StatsData({
    required this.streakDays,
    required this.currentPage,
    required this.pagesReadToday,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _StatsData &&
          streakDays == other.streakDays &&
          currentPage == other.currentPage &&
          pagesReadToday == other.pagesReadToday;

  @override
  int get hashCode => Object.hash(streakDays, currentPage, pagesReadToday);
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manzil/core/themes/app_colors.dart';
import 'package:manzil/core/themes/app_text_styles.dart';

/// Quick action grid — static UI, no BLoC dependency needed.
/// Does not use BlocSelector because it doesn't depend on any state.
class QuickActionGrid extends StatelessWidget {
  const QuickActionGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'QUICK ACTIONS',
            style: AppTextStyles.sectionLabel(color: AppColors.cTextHint),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              _ActionCard(
                icon: Icons.menu_book_rounded,
                label: 'Read Quran',
                color: AppColors.cPrimary,
                onTap: () {},
              ),
              SizedBox(width: 12.w),
              _ActionCard(
                icon: Icons.bookmarks_rounded,
                label: 'Bookmarks',
                color: AppColors.cGold,
                onTap: () {},
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              _ActionCard(
                icon: Icons.history_rounded,
                label: 'History',
                color: AppColors.cTeal,
                onTap: () {},
              ),
              SizedBox(width: 12.w),
              _ActionCard(
                icon: Icons.search_rounded,
                label: 'Search',
                color: AppColors.cLapis,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _ActionCard({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: AppColors.cCardBg,
        borderRadius: BorderRadius.zero,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.zero,
          splashColor: color.withValues(alpha: 0.1),
          highlightColor: color.withValues(alpha: 0.05),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.zero,
              border: Border.all(color: AppColors.cDivider, width: 0.8),
            ),
            child: Row(
              children: [
                Container(
                  width: 44.w,
                  height: 44.w,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.zero,
                  ),
                  child: Icon(icon, size: 22.sp, color: color),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    label,
                    style: AppTextStyles.titleSmall(
                      color: AppColors.cTextPrimary,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  size: 20.sp,
                  color: AppColors.cTextHint,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

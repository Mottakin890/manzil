import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:manzil/core/dimentions/spacings.dart';
import 'package:manzil/core/resources/app_assets.dart';
import 'package:manzil/core/themes/app_colors.dart';
import 'package:manzil/core/themes/app_text_styles.dart';
import 'package:manzil/features/home/presentation/bloc/home_bloc.dart';

class HeroCard extends StatelessWidget {
  const HeroCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, _HeroData>(
      selector: (state) => _HeroData(
        lastReadSurah: state.lastReadSurah,
        lastReadAyah: state.lastReadAyah,
        currentPage: state.currentPage,
        totalPages: state.totalPages,
        progress: state.progress,
      ),
      builder: (context, data) {
        return Container(
          width: double.infinity,
          padding: REdgeInsets.symmetric(horizontal: 20, vertical: 24),
          decoration: const BoxDecoration(
            color: AppColors.cPrimary,
            borderRadius: BorderRadius.zero,
          ),
          child: Stack(
            children: [
              // ── Background pattern ──
              Positioned.fill(
                child: Opacity(
                  opacity: 0.08,
                  child: SvgPicture.asset(
                    AppAssets.bgHomeCardSVG,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              // ── Content ──
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // ── Left side: text info ──
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'اخر قراءة',
                              style: AppTextStyles.labelMedium(
                                color: AppColors.cGoldLight,
                              ),
                            ),
                            Spacing.vertical(4),
                            Text(
                              data.lastReadSurah,
                              style: AppTextStyles.headlineMedium(
                                color: AppColors.cTextOnPrimary,
                              ),
                            ),
                            Spacing.vertical(2),
                            Text(
                              'Ayah ${data.lastReadAyah}',
                              style: AppTextStyles.bodyMedium(
                                color: AppColors.cPrimary200,
                              ),
                            ),
                            Spacing.vertical(16),
                            // ── Continue reading button ──
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                                vertical: 10.h,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.cSecondary,
                                borderRadius: BorderRadius.zero,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.cSecondary.withValues(
                                      alpha: 0.3,
                                    ),
                                    blurRadius: 12,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.menu_book_rounded,
                                    size: 18.sp,
                                    color: AppColors.cPrimary800,
                                  ),
                                  Spacing.horizontal(8),
                                  Text(
                                    'Continue Reading',
                                    style: AppTextStyles.labelLarge(
                                      color: AppColors.cPrimary800,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacing.horizontal(16),
                      // ── Right side: progress ring ──
                      SizedBox(
                        width: 110.w,
                        height: 110.w,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 110.w,
                              height: 110.w,
                              child: CircularProgressIndicator(
                                value: data.progress,
                                strokeWidth: 8.w,
                                backgroundColor: AppColors.cPrimary700,
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  AppColors.cGoldLight,
                                ),
                                strokeCap: StrokeCap.round,
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '${(data.progress * 100).toStringAsFixed(1)}%',
                                  style: AppTextStyles.titleLarge(
                                    color: AppColors.cTextOnPrimary,
                                  ),
                                ),
                                Text(
                                  '${data.currentPage}/${data.totalPages}',
                                  style: AppTextStyles.caption(
                                    color: AppColors.cPrimary200,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Data class to limit rebuilds to only these fields.
class _HeroData {
  final String lastReadSurah;
  final int lastReadAyah;
  final int currentPage;
  final int totalPages;
  final double progress;

  const _HeroData({
    required this.lastReadSurah,
    required this.lastReadAyah,
    required this.currentPage,
    required this.totalPages,
    required this.progress,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _HeroData &&
          lastReadSurah == other.lastReadSurah &&
          lastReadAyah == other.lastReadAyah &&
          currentPage == other.currentPage &&
          totalPages == other.totalPages &&
          progress == other.progress;

  @override
  int get hashCode => Object.hash(
    lastReadSurah,
    lastReadAyah,
    currentPage,
    totalPages,
    progress,
  );
}

import 'package:flutter/material.dart';
import 'package:manzil/core/dimentions/spacings.dart';
import 'package:manzil/core/utils/widgets/app_divider.dart';
import 'package:manzil/features/home/presentation/widgets/appbar.dart';
import 'package:manzil/features/home/presentation/widgets/hero_card.dart';
import 'package:manzil/features/home/presentation/widgets/prayer_schedule_card.dart';
import 'package:manzil/features/home/presentation/widgets/quick_action_grid.dart';
import 'package:manzil/features/home/presentation/widgets/reading_stats_row.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Appbar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacing.vertical(0.3),
            const HeroCard(),
            const AppDivider(),
            const PrayerScheduleCard(),
            const AppDivider(),
            Spacing.vertical(24),
            const ReadingStatsRow(),
            Spacing.vertical(24),
            const QuickActionGrid(),
            Spacing.vertical(32),
          ],
        ),
      ),
    );
  }
}

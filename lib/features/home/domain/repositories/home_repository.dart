import 'package:manzil/features/home/domain/entities/prayer_time.dart';
import 'package:manzil/features/home/domain/entities/reading_progress.dart';

abstract interface class HomeRepository {
  Future<ReadingProgress> getReadingProgress();

  Future<void> saveReadingProgress(ReadingProgress progress);

  Future<String> getSelectedDivision();

  Future<void> saveSelectedDivision(String division);

  Future<List<PrayerTime>> getPrayerTimes(DateTime date, String division);
}

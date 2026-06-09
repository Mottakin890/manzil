import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:manzil/features/home/data/models/reading_progress_model.dart';

abstract interface class HomeLocalDataSource {
  Future<ReadingProgressModel> getReadingProgress();
  Future<void> saveReadingProgress(ReadingProgressModel progress);
  Future<String> getSelectedDivision();
  Future<void> saveSelectedDivision(String division);
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  final SharedPreferences sharedPreferences;

  const HomeLocalDataSourceImpl({required this.sharedPreferences});

  static const _readingProgressKey = 'quran_reading_progress';
  static const _selectedDivisionKey = 'selected_division';

  @override
  Future<ReadingProgressModel> getReadingProgress() async {
    final jsonString = sharedPreferences.getString(_readingProgressKey);
    if (jsonString != null) {
      try {
        final Map<String, dynamic> jsonMap =
            json.decode(jsonString) as Map<String, dynamic>;
        return ReadingProgressModel.fromJson(jsonMap);
      } catch (_) {
      }
    }
    return const ReadingProgressModel(
      currentPage: 1,
      totalPages: 604,
      lastReadSurah: 'Al-Fatiha',
      lastReadAyah: 1,
      streakDays: 0,
      dailyGoalPages: 5,
      pagesReadToday: 0,
    );
  }

  @override
  Future<void> saveReadingProgress(ReadingProgressModel progress) async {
    final jsonString = json.encode(progress.toJson());
    await sharedPreferences.setString(_readingProgressKey, jsonString);
  }

  @override
  Future<String> getSelectedDivision() async {
    return sharedPreferences.getString(_selectedDivisionKey) ?? 'Dhaka';
  }

  @override
  Future<void> saveSelectedDivision(String division) async {
    await sharedPreferences.setString(_selectedDivisionKey, division);
  }
}

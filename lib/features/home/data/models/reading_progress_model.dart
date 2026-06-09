import 'package:manzil/features/home/domain/entities/reading_progress.dart';

class ReadingProgressModel extends ReadingProgress {
  const ReadingProgressModel({
    required super.currentPage,
    required super.totalPages,
    required super.lastReadSurah,
    required super.lastReadAyah,
    required super.streakDays,
    required super.dailyGoalPages,
    required super.pagesReadToday,
  });

  factory ReadingProgressModel.fromJson(Map<String, dynamic> json) {
    return ReadingProgressModel(
      currentPage: json['currentPage'] as int? ?? 1,
      totalPages: json['totalPages'] as int? ?? 604,
      lastReadSurah: json['lastReadSurah'] as String? ?? 'Al-Fatiha',
      lastReadAyah: json['lastReadAyah'] as int? ?? 1,
      streakDays: json['streakDays'] as int? ?? 0,
      dailyGoalPages: json['dailyGoalPages'] as int? ?? 5,
      pagesReadToday: json['pagesReadToday'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currentPage': currentPage,
      'totalPages': totalPages,
      'lastReadSurah': lastReadSurah,
      'lastReadAyah': lastReadAyah,
      'streakDays': streakDays,
      'dailyGoalPages': dailyGoalPages,
      'pagesReadToday': pagesReadToday,
    };
  }

  factory ReadingProgressModel.fromEntity(ReadingProgress progress) {
    return ReadingProgressModel(
      currentPage: progress.currentPage,
      totalPages: progress.totalPages,
      lastReadSurah: progress.lastReadSurah,
      lastReadAyah: progress.lastReadAyah,
      streakDays: progress.streakDays,
      dailyGoalPages: progress.dailyGoalPages,
      pagesReadToday: progress.pagesReadToday,
    );
  }
}

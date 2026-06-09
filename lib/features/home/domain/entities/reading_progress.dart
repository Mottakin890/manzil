class ReadingProgress {
  final int currentPage;
  final int totalPages;
  final String lastReadSurah;
  final int lastReadAyah;
  final int streakDays;
  final int dailyGoalPages;
  final int pagesReadToday;

  const ReadingProgress({
    required this.currentPage,
    required this.totalPages,
    required this.lastReadSurah,
    required this.lastReadAyah,
    required this.streakDays,
    required this.dailyGoalPages,
    required this.pagesReadToday,
  });

  ReadingProgress copyWith({
    int? currentPage,
    int? totalPages,
    String? lastReadSurah,
    int? lastReadAyah,
    int? streakDays,
    int? dailyGoalPages,
    int? pagesReadToday,
  }) {
    return ReadingProgress(
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      lastReadSurah: lastReadSurah ?? this.lastReadSurah,
      lastReadAyah: lastReadAyah ?? this.lastReadAyah,
      streakDays: streakDays ?? this.streakDays,
      dailyGoalPages: dailyGoalPages ?? this.dailyGoalPages,
      pagesReadToday: pagesReadToday ?? this.pagesReadToday,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReadingProgress &&
        other.currentPage == currentPage &&
        other.totalPages == totalPages &&
        other.lastReadSurah == lastReadSurah &&
        other.lastReadAyah == lastReadAyah &&
        other.streakDays == streakDays &&
        other.dailyGoalPages == dailyGoalPages &&
        other.pagesReadToday == pagesReadToday;
  }

  @override
  int get hashCode {
    return Object.hash(
      currentPage,
      totalPages,
      lastReadSurah,
      lastReadAyah,
      streakDays,
      dailyGoalPages,
      pagesReadToday,
    );
  }
}

part of 'home_bloc.dart';

enum HomeStatus { initial, loading, loaded, error }

const List<String> kDivisions = [
  'Barishal',
  'Chattogram',
  'Dhaka',
  'Khulna',
  'Mymensingh',
  'Rajshahi',
  'Rangpur',
  'Sylhet',
];

final class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.division = 'Dhaka',
    this.currentPage = 1,
    this.totalPages = 604,
    this.lastReadSurah = 'Al-Fatiha',
    this.lastReadAyah = 1,
    this.streakDays = 0,
    this.dailyGoalPages = 5,
    this.pagesReadToday = 0,
    this.prayerTimes = const [
      PrayerTime(
        name: 'Fajr',
        time: '3:45 AM',
        startTime: '3:45 AM',
        endTime: '5:10 AM',
        isNext: true,
      ),
      PrayerTime(
        name: 'Dhuhr',
        time: '12:05 PM',
        startTime: '12:05 PM',
        endTime: '4:35 PM',
        isNext: false,
      ),
      PrayerTime(
        name: 'Asr',
        time: '4:35 PM',
        startTime: '4:35 PM',
        endTime: '6:45 PM',
        isNext: false,
      ),
      PrayerTime(
        name: 'Maghrib',
        time: '6:45 PM',
        startTime: '6:45 PM',
        endTime: '8:15 PM',
        isNext: false,
      ),
      PrayerTime(
        name: 'Isha',
        time: '8:15 PM',
        startTime: '8:15 PM',
        endTime: '3:45 AM',
        isNext: false,
      ),
    ],
    this.selectedDate,
    this.errorMessage,
  });

  final HomeStatus status;

  final String division;

  final int currentPage;

  final int totalPages;

  final String lastReadSurah;

  final int lastReadAyah;

  final int streakDays;

  final int dailyGoalPages;

  final int pagesReadToday;

  final List<PrayerTime> prayerTimes;

  final DateTime? selectedDate;

  final String? errorMessage;

  DateTime get currentDate => selectedDate ?? DateTime.now();

  double get progress => currentPage / totalPages;

  bool get isDailyGoalMet => pagesReadToday >= dailyGoalPages;

  HomeState copyWith({
    HomeStatus? status,
    String? division,
    int? currentPage,
    int? totalPages,
    String? lastReadSurah,
    int? lastReadAyah,
    int? streakDays,
    int? dailyGoalPages,
    int? pagesReadToday,
    List<PrayerTime>? prayerTimes,
    DateTime? selectedDate,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      division: division ?? this.division,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      lastReadSurah: lastReadSurah ?? this.lastReadSurah,
      lastReadAyah: lastReadAyah ?? this.lastReadAyah,
      streakDays: streakDays ?? this.streakDays,
      dailyGoalPages: dailyGoalPages ?? this.dailyGoalPages,
      pagesReadToday: pagesReadToday ?? this.pagesReadToday,
      prayerTimes: prayerTimes ?? this.prayerTimes,
      selectedDate: selectedDate ?? this.selectedDate,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    division,
    currentPage,
    totalPages,
    lastReadSurah,
    lastReadAyah,
    streakDays,
    dailyGoalPages,
    pagesReadToday,
    prayerTimes,
    selectedDate,
    errorMessage,
  ];
}

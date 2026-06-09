import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzil/features/home/domain/entities/prayer_time.dart';
import 'package:manzil/features/home/domain/entities/reading_progress.dart';
import 'package:manzil/features/home/domain/usecases/get_prayer_times_usecase.dart';
import 'package:manzil/features/home/domain/usecases/get_reading_progress_usecase.dart';
import 'package:manzil/features/home/domain/usecases/get_selected_division_usecase.dart';
import 'package:manzil/features/home/domain/usecases/save_reading_progress_usecase.dart';
import 'package:manzil/features/home/domain/usecases/save_selected_division_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetReadingProgressUseCase getReadingProgressUseCase;
  final SaveReadingProgressUseCase saveReadingProgressUseCase;
  final GetSelectedDivisionUseCase getSelectedDivisionUseCase;
  final SaveSelectedDivisionUseCase saveSelectedDivisionUseCase;
  final GetPrayerTimesUseCase getPrayerTimesUseCase;

  Timer? _prayerTimer;

  HomeBloc({
    required this.getReadingProgressUseCase,
    required this.saveReadingProgressUseCase,
    required this.getSelectedDivisionUseCase,
    required this.saveSelectedDivisionUseCase,
    required this.getPrayerTimesUseCase,
  }) : super(const HomeState()) {
    on<HomeInitialized>(_onHomeInitialized);
    on<HomeDivisionChanged>(_onDivisionChanged);
    on<HomePageUpdated>(_onPageUpdated);
    on<HomeDailyGoalSet>(_onDailyGoalSet);
    on<HomeStreakUpdated>(_onStreakUpdated);
    on<HomeDateChanged>(_onDateChanged);
    on<HomePrayerTimesRefreshed>(_onPrayerTimesRefreshed);

    _prayerTimer = Timer.periodic(const Duration(minutes: 1), (timer) {
      add(const HomePrayerTimesRefreshed());
    });
  }

  @override
  Future<void> close() {
    _prayerTimer?.cancel();
    return super.close();
  }

  Future<void> _onHomeInitialized(
    HomeInitialized event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));

    try {
      final progress = await getReadingProgressUseCase();
      final division = await getSelectedDivisionUseCase();
      final prayerTimes = await getPrayerTimesUseCase(state.currentDate, division);

      emit(state.copyWith(
        division: division,
        currentPage: progress.currentPage,
        totalPages: progress.totalPages,
        lastReadSurah: progress.lastReadSurah,
        lastReadAyah: progress.lastReadAyah,
        streakDays: progress.streakDays,
        dailyGoalPages: progress.dailyGoalPages,
        pagesReadToday: progress.pagesReadToday,
        prayerTimes: prayerTimes,
        status: HomeStatus.loaded,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: HomeStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onDivisionChanged(
    HomeDivisionChanged event,
    Emitter<HomeState> emit,
  ) async {
    if (!kDivisions.contains(event.division)) return;

    try {
      await saveSelectedDivisionUseCase(event.division);
      final prayerTimes = await getPrayerTimesUseCase(state.currentDate, event.division);
      emit(state.copyWith(
        division: event.division,
        prayerTimes: prayerTimes,
        status: HomeStatus.loaded,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: HomeStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onPageUpdated(
    HomePageUpdated event,
    Emitter<HomeState> emit,
  ) async {
    final page = event.page.clamp(1, state.totalPages);
    final pagesReadToday = state.pagesReadToday + (page - state.currentPage).abs();

    try {
      final updatedProgress = ReadingProgress(
        currentPage: page,
        totalPages: state.totalPages,
        lastReadSurah: state.lastReadSurah,
        lastReadAyah: state.lastReadAyah,
        streakDays: state.streakDays,
        dailyGoalPages: state.dailyGoalPages,
        pagesReadToday: pagesReadToday,
      );
      await saveReadingProgressUseCase(updatedProgress);

      emit(state.copyWith(
        currentPage: page,
        pagesReadToday: pagesReadToday,
        status: HomeStatus.loaded,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: HomeStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onDailyGoalSet(
    HomeDailyGoalSet event,
    Emitter<HomeState> emit,
  ) async {
    if (event.pages <= 0) return;

    try {
      final updatedProgress = ReadingProgress(
        currentPage: state.currentPage,
        totalPages: state.totalPages,
        lastReadSurah: state.lastReadSurah,
        lastReadAyah: state.lastReadAyah,
        streakDays: state.streakDays,
        dailyGoalPages: event.pages,
        pagesReadToday: state.pagesReadToday,
      );
      await saveReadingProgressUseCase(updatedProgress);

      emit(state.copyWith(
        dailyGoalPages: event.pages,
        status: HomeStatus.loaded,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: HomeStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onStreakUpdated(
    HomeStreakUpdated event,
    Emitter<HomeState> emit,
  ) async {
    try {
      final updatedStreak =
          state.isDailyGoalMet ? state.streakDays + 1 : state.streakDays;

      final updatedProgress = ReadingProgress(
        currentPage: state.currentPage,
        totalPages: state.totalPages,
        lastReadSurah: state.lastReadSurah,
        lastReadAyah: state.lastReadAyah,
        streakDays: updatedStreak,
        dailyGoalPages: state.dailyGoalPages,
        pagesReadToday: state.pagesReadToday,
      );
      await saveReadingProgressUseCase(updatedProgress);

      emit(state.copyWith(
        streakDays: updatedStreak,
        status: HomeStatus.loaded,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: HomeStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  /// Handles date changes for the prayer schedule.
  Future<void> _onDateChanged(
    HomeDateChanged event,
    Emitter<HomeState> emit,
  ) async {
    try {
      final prayerTimes = await getPrayerTimesUseCase(event.date, state.division);
      emit(state.copyWith(
        selectedDate: event.date,
        prayerTimes: prayerTimes,
        status: HomeStatus.loaded,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: HomeStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  /// Periodically refreshes prayer times to update the next prayer indicator.
  Future<void> _onPrayerTimesRefreshed(
    HomePrayerTimesRefreshed event,
    Emitter<HomeState> emit,
  ) async {
    final now = DateTime.now();
    final isToday = state.currentDate.year == now.year &&
        state.currentDate.month == now.month &&
        state.currentDate.day == now.day;
    if (!isToday) return;

    try {
      final prayerTimes = await getPrayerTimesUseCase(state.currentDate, state.division);
      if (state.prayerTimes != prayerTimes) {
        emit(state.copyWith(prayerTimes: prayerTimes));
      }
    } catch (_) {
      // Silently ignore refresh errors; stale times remain visible.
    }
  }

}

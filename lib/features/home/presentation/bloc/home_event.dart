part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

final class HomeInitialized extends HomeEvent {
  const HomeInitialized();
}

final class HomeDivisionChanged extends HomeEvent {
  const HomeDivisionChanged(this.division);

  final String division;

  @override
  List<Object?> get props => [division];
}

final class HomePageUpdated extends HomeEvent {
  const HomePageUpdated(this.page);

  final int page;

  @override
  List<Object?> get props => [page];
}

final class HomeDailyGoalSet extends HomeEvent {
  const HomeDailyGoalSet(this.pages);

  final int pages;

  @override
  List<Object?> get props => [pages];
}

final class HomeStreakUpdated extends HomeEvent {
  const HomeStreakUpdated();
}

final class HomeDateChanged extends HomeEvent {
  const HomeDateChanged(this.date);

  final DateTime date;

  @override
  List<Object?> get props => [date];
}

final class HomePrayerTimesRefreshed extends HomeEvent {
  const HomePrayerTimesRefreshed();
}

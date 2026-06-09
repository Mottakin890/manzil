import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:manzil/core/themes/bloc/theme_bloc.dart';
import 'package:manzil/features/home/data/datasources/home_local_data_source.dart';
import 'package:manzil/features/home/data/repositories/home_repository_impl.dart';
import 'package:manzil/features/home/domain/repositories/home_repository.dart';
import 'package:manzil/features/home/domain/usecases/get_prayer_times_usecase.dart';
import 'package:manzil/features/home/domain/usecases/get_reading_progress_usecase.dart';
import 'package:manzil/features/home/domain/usecases/get_selected_division_usecase.dart';
import 'package:manzil/features/home/domain/usecases/save_reading_progress_usecase.dart';
import 'package:manzil/features/home/domain/usecases/save_selected_division_usecase.dart';
import 'package:manzil/features/home/presentation/bloc/home_bloc.dart';

final GetIt sl = GetIt.instance;

class DependencyInjection {
  const DependencyInjection._();

  static Future<void> init() async {
    // ── External ──────────────────────────────
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerSingleton<SharedPreferences>(sharedPreferences);

    // ── Data Sources ──────────────────────────
    sl.registerLazySingleton<HomeLocalDataSource>(
      () => HomeLocalDataSourceImpl(sharedPreferences: sl()),
    );

    // ── Repositories ──────────────────────────
    sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(localDataSource: sl()),
    );

    // ── Use Cases ─────────────────────────────
    sl.registerLazySingleton<GetReadingProgressUseCase>(
      () => GetReadingProgressUseCase(sl()),
    );
    sl.registerLazySingleton<SaveReadingProgressUseCase>(
      () => SaveReadingProgressUseCase(sl()),
    );
    sl.registerLazySingleton<GetSelectedDivisionUseCase>(
      () => GetSelectedDivisionUseCase(sl()),
    );
    sl.registerLazySingleton<SaveSelectedDivisionUseCase>(
      () => SaveSelectedDivisionUseCase(sl()),
    );

    sl.registerLazySingleton<GetPrayerTimesUseCase>(
      () => GetPrayerTimesUseCase(sl()),
    );

    // ── BLoCs ─────────────────────────────────
    sl.registerFactory<ThemeBloc>(() => ThemeBloc());
    sl.registerFactory<HomeBloc>(
      () => HomeBloc(
        getReadingProgressUseCase: sl(),
        saveReadingProgressUseCase: sl(),
        getSelectedDivisionUseCase: sl(),
        saveSelectedDivisionUseCase: sl(),
        getPrayerTimesUseCase: sl(),
      ),
    );
  }
}

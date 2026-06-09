import 'package:adhan/adhan.dart';
import 'package:manzil/features/home/data/datasources/home_local_data_source.dart';
import 'package:manzil/features/home/data/models/reading_progress_model.dart';
import 'package:manzil/features/home/domain/entities/prayer_time.dart';
import 'package:manzil/features/home/domain/entities/reading_progress.dart';
import 'package:manzil/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeLocalDataSource localDataSource;

  const HomeRepositoryImpl({required this.localDataSource});

  static const Map<String, ({double lat, double lng})> _divisionCoordinates = {
    'Barishal': (lat: 22.7010, lng: 90.3535),
    'Chattogram': (lat: 22.3569, lng: 91.7832),
    'Dhaka': (lat: 23.8103, lng: 90.4125),
    'Khulna': (lat: 22.8456, lng: 89.5403),
    'Mymensingh': (lat: 24.7471, lng: 90.4203),
    'Rajshahi': (lat: 24.3745, lng: 88.6042),
    'Rangpur': (lat: 25.7439, lng: 89.2752),
    'Sylhet': (lat: 24.8949, lng: 91.8687),
  };

  static const _defaultCoord = (lat: 23.8103, lng: 90.4125);

  @override
  Future<ReadingProgress> getReadingProgress() {
    return localDataSource.getReadingProgress();
  }

  @override
  Future<void> saveReadingProgress(ReadingProgress progress) {
    final model = ReadingProgressModel.fromEntity(progress);
    return localDataSource.saveReadingProgress(model);
  }

  @override
  Future<String> getSelectedDivision() {
    return localDataSource.getSelectedDivision();
  }

  @override
  Future<void> saveSelectedDivision(String division) {
    return localDataSource.saveSelectedDivision(division);
  }

  @override
  Future<List<PrayerTime>> getPrayerTimes(
    DateTime date,
    String division,
  ) async {
    final coord = _divisionCoordinates[division] ?? _defaultCoord;

    final coordinates = Coordinates(coord.lat, coord.lng);

    final params = CalculationMethod.karachi.getParameters()
      ..madhab = Madhab.hanafi;

    final dateComponents = DateComponents(date.year, date.month, date.day);
    final prayerTimes = PrayerTimes(coordinates, dateComponents, params);
    final sunriseTime = prayerTimes.sunrise;

    // ── Format helper ───────────────────────────────────────────────────────
    String fmt(DateTime? dt) {
      if (dt == null) return '--:--';
      final h = dt.hour;
      final m = dt.minute;
      final period = h >= 12 ? 'PM' : 'AM';
      final h12 = h == 0 ? 12 : (h > 12 ? h - 12 : h);
      final mm = m.toString().padLeft(2, '0');
      return '$h12:$mm $period';
    }

    // ── Determine next prayer for today ────────────────────────────────────
    final now = DateTime.now();
    final isToday =
        date.year == now.year && date.month == now.month && date.day == now.day;

    Prayer nextPrayer = Prayer.none;
    if (isToday) {
      nextPrayer = prayerTimes.nextPrayer();
    }

    return [
      PrayerTime(
        name: 'Fajr',
        time: fmt(prayerTimes.fajr),
        startTime: fmt(prayerTimes.fajr),
        endTime: fmt(sunriseTime),
        isNext: isToday && nextPrayer == Prayer.fajr,
      ),
      PrayerTime(
        name: 'Dhuhr',
        time: fmt(prayerTimes.dhuhr),
        startTime: fmt(prayerTimes.dhuhr),
        endTime: fmt(prayerTimes.asr),
        isNext: isToday && nextPrayer == Prayer.dhuhr,
      ),
      PrayerTime(
        name: 'Asr',
        time: fmt(prayerTimes.asr),
        startTime: fmt(prayerTimes.asr),
        endTime: fmt(prayerTimes.maghrib),
        isNext: isToday && nextPrayer == Prayer.asr,
      ),
      PrayerTime(
        name: 'Maghrib',
        time: fmt(prayerTimes.maghrib),
        startTime: fmt(prayerTimes.maghrib),
        endTime: fmt(prayerTimes.isha),
        isNext: isToday && nextPrayer == Prayer.maghrib,
      ),
      PrayerTime(
        name: 'Isha',
        time: fmt(prayerTimes.isha),
        startTime: fmt(prayerTimes.isha),
        endTime: fmt(prayerTimes.fajr),
        isNext: isToday && nextPrayer == Prayer.isha,
      ),
    ];
  }
}

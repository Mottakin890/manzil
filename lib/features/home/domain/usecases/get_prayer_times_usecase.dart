import 'package:manzil/features/home/domain/entities/prayer_time.dart';
import 'package:manzil/features/home/domain/repositories/home_repository.dart';

class GetPrayerTimesUseCase {
  final HomeRepository repository;

  const GetPrayerTimesUseCase(this.repository);

  Future<List<PrayerTime>> call(DateTime date, String division) {
    return repository.getPrayerTimes(date, division);
  }
}

import 'package:manzil/features/home/domain/entities/reading_progress.dart';
import 'package:manzil/features/home/domain/repositories/home_repository.dart';

class GetReadingProgressUseCase {
  final HomeRepository repository;

  const GetReadingProgressUseCase(this.repository);

  Future<ReadingProgress> call() {
    return repository.getReadingProgress();
  }
}

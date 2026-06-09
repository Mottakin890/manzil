import 'package:manzil/features/home/domain/entities/reading_progress.dart';
import 'package:manzil/features/home/domain/repositories/home_repository.dart';

class SaveReadingProgressUseCase {
  final HomeRepository repository;

  const SaveReadingProgressUseCase(this.repository);

  Future<void> call(ReadingProgress progress) {
    return repository.saveReadingProgress(progress);
  }
}

import 'package:manzil/features/home/domain/repositories/home_repository.dart';

class SaveSelectedDivisionUseCase {
  final HomeRepository repository;

  const SaveSelectedDivisionUseCase(this.repository);

  Future<void> call(String division) {
    return repository.saveSelectedDivision(division);
  }
}

import 'package:manzil/features/home/domain/repositories/home_repository.dart';

class GetSelectedDivisionUseCase {
  final HomeRepository repository;

  const GetSelectedDivisionUseCase(this.repository);

  Future<String> call() {
    return repository.getSelectedDivision();
  }
}

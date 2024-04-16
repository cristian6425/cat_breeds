import 'package:catbreeds/src/domain/repositories/i_cat_repository.dart';

class CatUseCase {
  final ICatRepository _catRepository;

  CatUseCase({required ICatRepository catRepository}) : _catRepository = catRepository;

  Future<String> get() async {
    return _catRepository.get();
  }
}

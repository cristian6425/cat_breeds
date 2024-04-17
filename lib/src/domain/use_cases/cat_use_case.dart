import 'package:catbreeds/src/data/models/breed_model.dart';
import 'package:catbreeds/src/domain/repositories/i_cat_repository.dart';

class CatUseCase {
  final ICatRepository _catRepository;

  CatUseCase({required ICatRepository catRepository}) : _catRepository = catRepository;

  Future<List<BreedModel>> getBreeds(String search) async {
    final breends = await  _catRepository.getBreeds(search);
    final listImage =  await _catRepository.getImages(breends);
    return listImage;
  }

}

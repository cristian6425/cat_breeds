import 'package:catbreeds/src/data/data_sources/remote_data_source.dart';
import 'package:catbreeds/src/domain/repositories/i_cat_repository.dart';

class CatRepository implements ICatRepository {
  final RemoteDataSource _dataSource = RemoteDataSource();

  @override
  Future<String> get() async {
    return await _dataSource.get();
  }
}

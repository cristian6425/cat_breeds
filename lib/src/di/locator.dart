import 'package:catbreeds/src/data/repositories/cat_repository.dart';
import 'package:catbreeds/src/domain/use_cases/cat_use_case.dart';
import 'package:catbreeds/src/presentation/cubits/cat_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocatorDi {
  static get instance => [
        BlocProvider(create: (_) => CatCubit(catUseCase: CatUseCase(catRepository: CatRepository()))),
      ];
}

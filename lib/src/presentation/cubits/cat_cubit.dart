import 'package:bloc/bloc.dart';
import 'package:catbreeds/src/domain/use_cases/cat_use_case.dart';
import 'package:equatable/equatable.dart';

part 'cat_state.dart';

class CatCubit extends Cubit<CatState> {
  final CatUseCase _catUseCase;

  CatCubit({required CatUseCase catUseCase})
      : _catUseCase = catUseCase,
        super(const CatState());

  void get() async {
    await _catUseCase.get();
  }
}

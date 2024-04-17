import 'package:bloc/bloc.dart';
import 'package:catbreeds/src/data/models/breed_model.dart';
import 'package:catbreeds/src/domain/use_cases/cat_use_case.dart';
import 'package:equatable/equatable.dart';

part 'cat_state.dart';

class CatCubit extends Cubit<CatState> {
  final CatUseCase _catUseCase;

  CatCubit({required CatUseCase catUseCase})
      : _catUseCase = catUseCase,
        super(const CatState());

  void getBreeds({ String search = "" }) async {
    emit(state.copyWith(state: StateEnum.loading));
    try{
      final breeds = await _catUseCase.getBreeds(search);
      emit(state.copyWith(state: StateEnum.success, breeds: breeds));
    }catch(e){
      emit(state.copyWith(state: StateEnum.error));
    }
  }
}

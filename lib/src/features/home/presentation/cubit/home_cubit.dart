import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_compressor_app/src/features/home/data/repositority/api_call.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  List l1 = [];
  HomeCubit() : super(HomeInitial());

  Future<void> apiCallData() async {
    try {
      l1 = await apiCall();
      emit(HomeLoadingState());

      emit(HomeSuccessState(
        dataList: l1,
      ));
    } catch (e) {
      emit(HomeErrorState(
        error: '$e',
      ));
    }
  }
}

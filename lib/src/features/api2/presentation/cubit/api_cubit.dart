import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:image_compressor_app/src/features/api2/data/model/api_model.dart';

part 'api_state.dart';

class ApiCubit extends Cubit<ApiState> {
  List<dynamic> dataList = [];
  ApiCubit() : super(ApiInitial());

  Future<List> secondApiCall() async {
    var response = await get(
      Uri.parse("https://fakestoreapi.com/products"),
    );

    var json = jsonDecode(response.body);

    List l1 = json.map((e) => ApiModel.fromJson(e)).toList();

    return l1;
  }

  Future<void> fatchData() async {
    dataList = await secondApiCall();

    try {
      emit(ApiLoadingState());
      emit(ApiSuccessState(
        random: Random().nextDouble(),
        dataList: dataList,
      ));
    } catch (e) {
      emit(ApiErrorState(
        error: "$e",
      ));
    }
  }

  Future<void> filterAToZData() async {
    try {
      dataList.sort(
        (a, b) => a.title.toUpperCase().compareTo(b.title.toUpperCase()),
      );
      emit(ApiSuccessState(
        random: Random().nextDouble(),
        dataList: dataList,
      ));
    } catch (e) {
      emit(ApiErrorState(
        error: "$e",
      ));
    }
  }

  Future<void> filterZToAData() async {
    try {
      dataList.sort(
        (a, b) => b.title.toUpperCase().compareTo(a.title.toUpperCase()),
      );
      emit(ApiSuccessState(
        random: Random().nextDouble(),
        dataList: dataList,
      ));
    } catch (e) {
      emit(ApiErrorState(
        error: "$e",
      ));
    }
  }

  Future<void> filterPriceMinToHighData() async {
    try {
      dataList.sort(
        (a, b) => a.price.compareTo(b.price),
      );
      emit(ApiSuccessState(
        random: Random().nextDouble(),
        dataList: dataList,
      ));
    } catch (e) {
      emit(ApiErrorState(
        error: "$e",
      ));
    }
  }

  Future<void> filterPriceHighToLowData() async {
    try {
      dataList.sort(
        (a, b) => b.price.compareTo(a.price),
      );
      emit(ApiSuccessState(
        random: Random().nextDouble(),
        dataList: dataList,
      ));
    } catch (e) {
      emit(ApiErrorState(
        error: "$e",
      ));
    }
  }
}

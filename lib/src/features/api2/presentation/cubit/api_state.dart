part of 'api_cubit.dart';

sealed class ApiState extends Equatable {
  const ApiState();

  @override
  List<Object> get props => [];
}

final class ApiInitial extends ApiState {
  @override
  List<Object> get props => [];
}

class ApiLoadingState extends ApiState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class ApiSuccessState extends ApiState {
  List dataList = [];
  final double random;

  ApiSuccessState({
    required this.random,
    required this.dataList,
  });

  @override
  List<Object> get props => [dataList, random];
}

class ApiErrorState extends ApiState {
  final error;

  ApiErrorState({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}

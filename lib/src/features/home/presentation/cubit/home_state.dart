part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeSuccessState extends HomeState {
  final List dataList;

  const HomeSuccessState({
    required this.dataList,
  });

  @override
  List<Object> get props => [dataList];
}

class HomeErrorState extends HomeState {
  final String error;

  const HomeErrorState({
    required this.error,
  });
  @override
  List<Object> get props => [error];
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_compressor_app/src/features/home/presentation/cubit/home_cubit.dart';
import 'package:image_compressor_app/src/features/home/presentation/widget/home_screen_compantant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends HomeScreenCom {
  @override
  void initState() {
    super.initState();

    homeCubit.apiCallData();
  }

  HomeCubit homeCubit = HomeCubit();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<HomeCubit, HomeState>(
          bloc: homeCubit,
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return homeLoadingProcess();
            } else if (state is HomeSuccessState) {
              return homeSuccessProcess(state: state);
            } else if (state is HomeErrorState) {
              return homeErrorProcess(state);
            } else {
              return Text(
                "$state",
              );
            }
          },
        ),
      ),
    );
  }
}

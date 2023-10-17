import 'package:flutter/material.dart';
import 'package:image_compressor_app/src/features/home/presentation/cubit/home_cubit.dart';
import 'package:image_compressor_app/src/features/home/presentation/view/home_screen.dart';

abstract class HomeScreenCom extends State<HomeScreen> {
  HomeCubit homeCubit = HomeCubit();

  @override
  void initState() {
    super.initState();

    homeCubit.apiCallData();
  }

  Widget homeErrorProcess(HomeErrorState state) {
    return Text(
      state.error,
    );
  }

  @override
  void dispose() {
    super.dispose();

    homeCubit.close();
  }

  Widget homeSuccessProcess({
    required HomeSuccessState state,
  }) {
    return ListView.builder(
      itemCount: state.dataList.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text("${state.dataList[index].id} ${state.dataList[index].userId}"),
          title: Text(
            "${state.dataList[index].title}",
          ),
          subtitle: Text("${state.dataList[index].body}"),
        );
      },
    );
  }

  Widget homeLoadingProcess() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_compressor_app/src/features/api2/presentation/cubit/api_cubit.dart';
import 'package:image_compressor_app/src/features/api2/presentation/widget/api_call_widget.dart';

class SecondApiCall extends StatefulWidget {
  const SecondApiCall({super.key});

  @override
  State<SecondApiCall> createState() => _SecondApiCallState();
}

class _SecondApiCallState extends ApiCallWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: [
            popUpMenu(),
          ],
        ),
        body: BlocConsumer<ApiCubit, ApiState>(
          bloc: apiCubit,
          builder: (context, state) {
            if (state is ApiSuccessState) {
              return apiSuccessLoaded(
                state: state,
              );
            } else if (state is ApiLoadingState) {
              return apiLoadingProcess();
            } else if (state is ApiErrorState) {
              return apiErrorProcess(state);
            }
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          },
          listener: (BuildContext context, ApiState state) {},
        ),
      ),
    );
  }
}

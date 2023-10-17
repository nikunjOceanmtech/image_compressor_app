import 'package:flutter/material.dart';
import 'package:image_compressor_app/src/features/api2/presentation/cubit/api_cubit.dart';
import 'package:image_compressor_app/src/features/api2/presentation/view/second_api_call.dart';

abstract class ApiCallWidget extends State<SecondApiCall> {
  ApiCubit apiCubit = ApiCubit();
  @override
  void initState() {
    super.initState();

    apiCubit.fatchData();
  }

  Widget apiErrorProcess(ApiErrorState state) {
    return Text("${state.error}");
  }

  Widget apiLoadingProcess() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget popUpMenu() {
    return PopupMenuButton(
      icon: const Icon(
        Icons.filter_alt,
      ),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            child: const Text(
              "A To Z",
            ),
            onTap: () {
              apiCubit.filterAToZData();
            },
          ),
          PopupMenuItem(
            child: const Text(
              "Z To A",
            ),
            onTap: () {
              apiCubit.filterZToAData();
            },
          ),
          PopupMenuItem(
            child: const Text(
              "Min To High",
            ),
            onTap: () {
              apiCubit.filterPriceMinToHighData();
            },
          ),
          PopupMenuItem(
            child: const Text(
              "High To Low",
            ),
            onTap: () {
              apiCubit.filterPriceHighToLowData();
            },
          ),
          PopupMenuItem(
            child: const Text(
              "Refresh",
            ),
            onTap: () {
              apiCubit.fatchData();
            },
          ),
        ];
      },
    );
  }

  Widget apiSuccessLoaded({
    required ApiSuccessState state,
  }) {
    return ListView.builder(
      itemCount: state.dataList.length,
      itemBuilder: (context, index) {
        return Container(
          height: 150,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                blurRadius: 5,
                spreadRadius: 5,
                offset: Offset(0, 0),
                color: Color.fromARGB(49, 0, 0, 0),
              )
            ],
            color: Colors.white,
          ),
          child: Row(
            children: [
              const SizedBox(width: 10),
              Container(
                height: 120,
                width: 120,
                child: Image.network(
                  "${state.dataList[index].image}",
                ),
              ),
              const SizedBox(width: 10),
              detailShow(
                state: state,
                index: index,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget detailShow({
    required ApiSuccessState state,
    required int index,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 250,
          child: Text(
            overflow: TextOverflow.ellipsis,
            "${state.dataList[index].title}",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Container(
          width: 250,
          height: 25,
          child: Text(
            "Price :- ${state.dataList[index].price}",
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade800,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          width: 250,
          height: 25,
          child: Text(
            "Category :- ${state.dataList[index].category.toString().substring(9)}",
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          width: 250,
          height: 55,
          child: Text(
            "${state.dataList[index].description}",
            style: const TextStyle(
              fontSize: 15,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

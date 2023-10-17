import 'dart:convert';

import 'package:http/http.dart';
import 'package:image_compressor_app/src/features/home/data/model/home_model.dart';

Future<List> apiCall() async {
  var response = await get(
    Uri.parse("https://jsonplaceholder.typicode.com/posts"),
  );

  var json = jsonDecode(response.body);

  List l1 = json.map((e) => HomeModel.fromJson(e)).toList();

  return l1;
}

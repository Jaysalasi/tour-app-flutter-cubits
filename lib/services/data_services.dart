import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:tourism/models/data_model.dart';

class DataServices {
  String baseUrl = "http://mark.bslmeiyu.com/api";
  Future<List<DataModel>> getInfo() async {
    var apiUrl = '/getplaces';

    http.Response res = await http.get(Uri.parse(baseUrl + apiUrl));
    log(res.statusCode.toString());
    try {
      if (res.statusCode == 200) {
        log(res.statusCode.toString());
        List<dynamic> list = json.decode(res.body);
        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      return <DataModel>[];
    }
  }
}

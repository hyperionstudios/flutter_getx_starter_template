import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'api.dart';

class ApiRouter extends GetxService {
  String get fileName => 'api.json';
  Map<String, dynamic> routes = {};
  late Api api;

  Future<ApiRouter> init() async {
    try {
      String data = await rootBundle.loadString('assets/config/$fileName');
      var loaded = Map<String, dynamic>.from(jsonDecode(data));
      api = Api(
        information: loaded['info'],
        apiBase: loaded['base'],
        apiAuth: loaded['auth'],
        apiModels: loaded['models'],
      );
    } catch (e) {
      throw Exception(
          'No file could be loaded, or the data is not formatted as required');
    }
    return this;
  }
}

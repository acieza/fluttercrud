//import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:fluttercrud/models/cases.dart';
import 'package:http/http.dart';

class ApiService {
  final String apiUrl = "http://82.158.231.181:3000/api";
//************** Convertir datos a Json *********************//
  Future<List<Cases>> getCases() async {
    Response res = await get(apiUrl);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Cases> cases =
          body.map((dynamic item) => Cases.fromJson(item)).toList();
      return cases;
    } else {
      throw "Error en la lista de Casos";
    }
  }
  //*************************************************************//

  Future<Cases> getCasesById(String id) async {
    Response res = await get('$apiUrl/$id');

    if (res.statusCode == 200) {
      return Cases.fromJson(json.decode(res.body));
    } else {
      throw "Error en el Caso";
    }
  }
}

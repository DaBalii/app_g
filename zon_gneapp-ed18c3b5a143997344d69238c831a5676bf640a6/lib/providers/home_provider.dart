import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Globals/GloblsVars.dart';
import '../model/maison.dart';




class HomesPrivders extends ChangeNotifier {
List<Maison>?_listMaisons=[];
List<Maison>? get listMaisons  => _listMaisons;

Future<void> getAllHomes() async {
  var route = "api/Admin/houses";
  var url = Uri.parse(baseUrl + route);
  var response = await http.get(url);
  if (response.statusCode == 200) {
    List jsonResponse = jsonDecode(response.body);

    for (var home in jsonResponse) {
      _listMaisons!.add(Maison.fromMap(home, baseUrl));
    }
    notifyListeners();
    print(jsonResponse);

  }
}
}
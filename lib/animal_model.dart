import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider_example/animal.dart';
import 'package:http/http.dart' as http;

const API_URL = 'https://zoo-animal-api.herokuapp.com/animals/rand/10/';

class AnimalModel extends ChangeNotifier {

  List<Animal>? animals;

  Future<void> fetchData() async {
    var url = Uri.parse(API_URL);
    var response = await http.get(url);

    final _fetchedAnimals = <Animal>[];

    var _jsonResponse = jsonDecode(response.body);

    for (final _item in _jsonResponse) {
      final animal = Animal.fromJson(_item);
      _fetchedAnimals.add(animal);
    }

    animals = _fetchedAnimals;
    notifyListeners();
  }

}
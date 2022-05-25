import 'package:dogs_demo_provider/features/dog_list/models/dog.dart';
import 'package:dogs_demo_provider/services/dog_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class DogListProvider extends ChangeNotifier {
  List<Dog>? _dogList;

  List<Dog>? get dogList => _dogList;

  final _dogService = GetIt.I<DogService>();

  Future<void> getDogList() async {
    _dogService.getDogs().then((value) {
      _dogList = value;

      notifyListeners();
    });
  }
}

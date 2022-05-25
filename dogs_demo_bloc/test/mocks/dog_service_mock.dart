import 'dart:math';

import 'package:dogs_demo_bloc/features/dog_list/models/dog.dart';
import 'package:dogs_demo_bloc/services/dog_service.dart';
import 'package:mockito/mockito.dart';

class DogServiceMock extends Mock implements DogService {
  @override
  Future<List<Dog>> getDogs() {
    List<Dog> list = [];
    for (int i = 0; i < 10; i++) {
      list.add(Dog(breed: getRandomString(5), subBreeds: [getRandomString(3)]));
    }

    return Future.value(list);
  }

  final _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();

  String getRandomString(int length) =>
      String.fromCharCodes(Iterable.generate(length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}

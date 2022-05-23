import 'package:dio/dio.dart';
import 'package:dogs_demo_bloc/models/dog.dart';

class DogService {
  final dio = Dio();

  Future<List<Dog>> getDogs() {
    const uri = 'https://dog.ceo/api/breeds/list/all';
    try {
      return dio.get(uri).then((response) {
        if (response.statusCode == 200) {
          return setDogList(response.data['message']);
        } else {
          throw ('Cannot get dog list');
        }
      });
    } on DioError catch (e) {
      throw ('Error occurred: $e');
    }
  }

  Future<List<Dog>> setDogList(var data) async {
    List<Dog> list = [];
    var breeds = data.keys;
    for (var breed in breeds) {
      var img = await getImage(breed);
      list.add(Dog(breed: breed, subBreeds: data[breed], imageUrl: img));
    }
    return list;
  }

  Future<String> getImage(String breed) {
    final uri = 'https://dog.ceo/api/breed/$breed/images/random';
    try {
      return dio.get(uri).then((response) {
        if (response.statusCode == 200) {
          return response.data["message"];
        } else {
          throw ('Error occurred');
        }
      });
    } on DioError catch (e) {
      throw ('Error occurred: $e');
    }
  }
}

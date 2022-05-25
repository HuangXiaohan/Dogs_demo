import 'package:dogs_demo_bloc/features/dog_list/models/dog.dart';
import 'package:dogs_demo_bloc/services/dog_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Dog service test', () {
    late DogService dogService;

    setUp(() {
      dogService = DogService();
    });

    test('Get dog list test', () async {
      final list = await dogService.getDogs();
      expect(list.isNotEmpty, true);
      expect(list.first.runtimeType, Dog);
    });

    test('Get breed image test', () async {
      final img = await dogService.getImage('akita');
      expect(img, isNotNull);
    });
  });
}

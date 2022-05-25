import 'package:dogs_demo_provider/services/dog_service.dart';
import 'package:dogs_demo_provider/services/login_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class ServicesContext {
  static void initContext() {
    getIt.registerLazySingleton(() => LoginService());
    getIt.registerLazySingleton(() => DogService());
  }
}

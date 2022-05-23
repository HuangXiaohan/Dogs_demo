import 'package:dogs_demo_bloc/services/dog_service.dart';
import 'package:dogs_demo_bloc/services/login_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class ServicesContext {
  static void initContext() {
    getIt.registerLazySingleton(() => LoginService());
    getIt.registerLazySingleton(() => DogService());
  }
}

import 'package:dogs_demo_bloc/features/dog_list/models/dog.dart';
import 'package:dogs_demo_bloc/services/dog_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'dog_list_event.dart';
part 'dog_list_state.dart';

class DogListBloc extends Bloc<DogListEvent, DogListState> {
  final _dogService = GetIt.I<DogService>();

  DogListBloc() : super(const DogListState()) {
    on<DogListInitEvent>(_initList);
  }

  Future<void> _initList(DogListInitEvent _, Emitter emitter) async {
    var dogList = await _dogService.getDogs();
    emitter(state.copyWith(dogList: dogList));
  }
}

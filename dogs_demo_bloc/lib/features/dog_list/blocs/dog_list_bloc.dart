import 'package:dogs_demo_bloc/models/dog.dart';
import 'package:dogs_demo_bloc/services/dog_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'dog_list_event.dart';
part 'dog_list_state.dart';

class DogListBloc extends Bloc<DogListEvent, DogListState> {
  final _dogService = GetIt.I<DogService>();

  DogListBloc() : super(const DogListState()) {
    on<DogListInitEvent>(_initList);
    on<DogListLoadingEvent>(_loadingData);
  }

  Future<void> _initList(DogListInitEvent _, Emitter emitter) async {
    add(DogListLoadingEvent());
    var dogList = await _dogService.getDogs();
    emitter(state.copyWith(dogList: dogList, isLoading: false));
  }

  Future<void> _loadingData(DogListLoadingEvent _, Emitter emitter) async {
    emitter(state.copyWith(isLoading: true));
  }
}

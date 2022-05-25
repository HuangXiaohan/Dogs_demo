part of 'dog_list_bloc.dart';

class DogListState {
  final List<Dog>? dogList;

  const DogListState({this.dogList});

  DogListState copyWith({List<Dog>? dogList}) {
    return DogListState(dogList: dogList ?? this.dogList);
  }
}

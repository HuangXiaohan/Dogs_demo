part of 'dog_list_bloc.dart';

class DogListState {
  final List<Dog>? dogList;
  final bool isLoading;

  const DogListState({this.dogList, this.isLoading = false});

  DogListState copyWith({List<Dog>? dogList, bool? isLoading}) {
    return DogListState(dogList: dogList ?? this.dogList, isLoading: isLoading ?? this.isLoading);
  }
}

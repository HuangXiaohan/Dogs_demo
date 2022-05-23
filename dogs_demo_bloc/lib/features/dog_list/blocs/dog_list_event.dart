part of 'dog_list_bloc.dart';

abstract class DogListEvent {}

class DogListInitEvent extends DogListEvent {}

class DogListLoadingEvent extends DogListEvent {}

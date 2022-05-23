import 'package:dogs_demo_bloc/features/dog_list/blocs/dog_list_bloc.dart';
import 'package:dogs_demo_bloc/features/dog_list/widgets/dog_card.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogListPage extends StatelessWidget {
  const DogListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DogListBloc, DogListState>(
        buildWhen: (previous, current) =>
            previous.isLoading != current.isLoading || previous.dogList != current.dogList,
        builder: (localContext, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.dogList != null) {
            return ListView.builder(
                itemBuilder: (context, index) => DogCard(dog: state.dogList![index]), itemCount: state.dogList!.length);
          } else {
            return const Center(child: Text('No list'));
          }
        });
  }
}

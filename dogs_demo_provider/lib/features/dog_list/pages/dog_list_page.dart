import 'package:dogs_demo_provider/features/dog_list/providers/dog_list_provider.dart';
import 'package:dogs_demo_provider/features/dog_list/widgets/dog_card.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DogListPage extends StatelessWidget {
  const DogListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (context.watch<DogListProvider>().dogList == null) {
      return const Center(child: CircularProgressIndicator());
    } else if (context.watch<DogListProvider>().dogList!.isNotEmpty) {
      return ListView.builder(
          itemBuilder: (context, index) => DogCard(dog: context.watch<DogListProvider>().dogList![index]),
          itemCount: context.watch<DogListProvider>().dogList!.length);
    } else {
      return const SizedBox.shrink();
    }
  }
}

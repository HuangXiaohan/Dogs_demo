import 'package:dogs_demo_bloc/models/dog.dart';
import 'package:flutter/material.dart';

import 'dog_detail.widget.dart';

class DogCard extends StatelessWidget {
  final Dog dog;

  const DogCard({required this.dog, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showDetail(context),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (dog.imageUrl != null)
                ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(dog.imageUrl!, height: 100, width: 100, fit: BoxFit.cover)),
              const SizedBox(
                width: 20,
              ),
              Text(dog.breed, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500))
            ],
          ),
        ),
      ),
    );
  }

  void _showDetail(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        isScrollControlled: true,
        builder: (BuildContext context) => DogDetail(dog: dog));
  }
}

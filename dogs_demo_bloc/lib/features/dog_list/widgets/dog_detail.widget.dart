import 'package:dogs_demo_bloc/models/dog.dart';
import 'package:flutter/material.dart';

class DogDetail extends StatelessWidget {
  final Dog dog;

  const DogDetail({required this.dog, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (dog.imageUrl != null)
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(dog.imageUrl!,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover)),
            const SizedBox(
              height: 20,
            ),
            Text(dog.breed, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
            if (dog.subBreeds.isNotEmpty) ...{
              const SizedBox(height: 10),
              RichText(
                  text: TextSpan(style: const TextStyle(fontSize: 18, color: Colors.grey), children: [
                const TextSpan(text: 'Subbreeds: '),
                ...dog.subBreeds.map((e) => TextSpan(text: '$e ')).toList()
              ]))
            }
          ],
        ),
      ),
    );
  }
}

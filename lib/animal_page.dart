import 'package:flutter/material.dart';
import 'package:provider_example/animal.dart';

class AnimalPage extends StatelessWidget {
  const AnimalPage({
    Key? key,
    required this.animal,
  }) : super(key: key);

  final Animal animal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          animal.name ?? '-',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              animal.imageLink!,
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              'Habitat: ${animal.habitat ?? '-'}',
              style: const TextStyle(fontSize: 18.0,),
            ),
            const SizedBox(
              height: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}

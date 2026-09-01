import 'package:flutter/material.dart';

class MyStoryWidget extends StatelessWidget {
  const MyStoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
                image: const DecorationImage(
                  image: NetworkImage('https://via.placeholder.com/150'), // Replace with actual user image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              right: 8,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: const Icon(Icons.add, color: Colors.white, size: 20),
              ),
            ),
          ],
        ),
        const Text('Your Story', style: TextStyle(fontSize: 12)),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../models/story_model.dart';

class StoryItemWidget extends StatelessWidget {
  final StoryModel story;

  const StoryItemWidget({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          margin: const EdgeInsets.all(8),
          width: 82,
          height: 82,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: story.isViewed
                ? const LinearGradient(colors: [Colors.grey, Colors.grey])
                : const LinearGradient(
                    colors: [
                      Colors.purple,
                      Colors.red,
                      Colors.orange,
                      Colors.yellow,
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
          ),
          child: Container(
            height: 75,
            width: 75,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 3),
              shape: BoxShape.circle,
              color: Colors.grey[300],
              image: DecorationImage(
                image: NetworkImage(story.userProfileImageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Text(
          story.username,
          style: const TextStyle(fontSize: 12),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../models/story_model.dart';

class StoryItemWidget extends StatelessWidget {
  final StoryModel story;

  const StoryItemWidget({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Gradient ring or grey ring if viewed
          Container(
            padding: const EdgeInsets.all(2.5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: story.isViewed
                  ? const LinearGradient(colors: [Colors.grey, Colors.grey])
                  : const LinearGradient(
                      colors: [
                        Color(0xFFD300C4), // Instagram purple
                        Color(0xFFFF7A00), // orange
                        Color(0xFFFFD600), // yellow
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
            ),
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey[850],
                backgroundImage: NetworkImage(story.userProfileImageUrl),
              ),
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: 72,
            child: Text(
              story.username,
              style: const TextStyle(fontSize: 11, color: Colors.white),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../models/story_model.dart';
import 'my_story_widget.dart';
import 'story_item_widget.dart';

class StoryListWidget extends StatelessWidget {
  final List<StoryModel> stories;

  const StoryListWidget({super.key, required this.stories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 108,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: stories.length + 1, // +1 for "My Story"
        itemBuilder: (context, index) {
          if (index == 0) {
            return const MyStoryWidget();
          }
          final story = stories[index - 1];
          return StoryItemWidget(story: story);
        },
      ),
    );
  }
}

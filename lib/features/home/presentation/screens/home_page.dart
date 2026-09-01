import 'package:flutter/material.dart';
import '../models/post_model.dart';
import '../models/story_model.dart';
import '../widgets/post_list_widget.dart';
import '../widgets/story_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy Data
    final List<StoryModel> dummyStories = [
      StoryModel(id: '1', username: 'john_doe', userProfileImageUrl: 'https://via.placeholder.com/150'),
      StoryModel(id: '2', username: 'jane_smith', userProfileImageUrl: 'https://via.placeholder.com/150'),
      StoryModel(id: '3', username: 'mike_ross', userProfileImageUrl: 'https://via.placeholder.com/150', isViewed: true),
      StoryModel(id: '4', username: 'sarah_p', userProfileImageUrl: 'https://via.placeholder.com/150'),
      StoryModel(id: '5', username: 'alex_k', userProfileImageUrl: 'https://via.placeholder.com/150', isViewed: true),
    ];

    final List<PostModel> dummyPosts = [
      PostModel(
        id: '1',
        username: 'john_doe',
        userProfileImageUrl: 'https://via.placeholder.com/150',
        postImageUrl: 'https://via.placeholder.com/600',
        caption: 'Enjoying the beautiful sunny day! ☀️ #sunshine #vibes',
        likesCount: 124,
        commentsCount: 15,
        timeAgo: '2 hours ago',
      ),
      PostModel(
        id: '2',
        username: 'jane_smith',
        userProfileImageUrl: 'https://via.placeholder.com/150',
        postImageUrl: 'https://via.placeholder.com/600',
        caption: 'Just launched my new app. Check it out guys 🚀',
        likesCount: 890,
        commentsCount: 104,
        timeAgo: '5 hours ago',
        isLiked: true,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Instagram', style: TextStyle(fontFamily: 'Billabong', fontSize: 32)), // Usually uses a custom font
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.chat_bubble_outline)),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                StoryListWidget(stories: dummyStories),
                const Divider(height: 1, color: Colors.grey),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: PostListWidget(posts: dummyPosts),
          ),
        ],
      ),
    );
  }
}

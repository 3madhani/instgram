import 'package:flutter/material.dart';
import '../models/post_model.dart';

class PostWidget extends StatelessWidget {
  final PostModel post;

  const PostWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(post.userProfileImageUrl),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  post.username,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const Icon(Icons.more_vert),
            ],
          ),
        ),
        // Image
        Image.network(
          post.postImageUrl,
          width: double.infinity,
          height: 300,
          fit: BoxFit.cover,
        ),
        // Actions
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          child: Row(
            children: [
              Icon(
                post.isLiked ? Icons.favorite : Icons.favorite_border,
                color: post.isLiked ? Colors.red : null,
                size: 28,
              ),
              const SizedBox(width: 16),
              const Icon(Icons.comment_outlined, size: 28),
              const SizedBox(width: 16),
              const Icon(Icons.send_outlined, size: 28),
              const Spacer(),
              Icon(
                post.isSaved ? Icons.bookmark : Icons.bookmark_border,
                size: 28,
              ),
            ],
          ),
        ),
        // Likes
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            '${post.likesCount} likes',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        // Caption
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: '${post.username} ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: post.caption),
              ],
            ),
          ),
        ),
        // Comments count
        if (post.commentsCount > 0)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
            child: Text(
              'View all ${post.commentsCount} comments',
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        // Time ago
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
          child: Text(
            post.timeAgo,
            style: const TextStyle(color: Colors.grey, fontSize: 10),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../models/post_model.dart';
import 'post_widget.dart';

class PostListWidget extends StatelessWidget {
  final List<PostModel> posts;

  const PostListWidget({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return PostWidget(post: posts[index]);
      },
    );
  }
}

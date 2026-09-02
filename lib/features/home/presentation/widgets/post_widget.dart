import 'package:flutter/material.dart';

import '../models/post_model.dart';

class PostWidget extends StatefulWidget {
  final PostModel post;

  const PostWidget({super.key, required this.post});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  late bool _isLiked;
  late bool _isSaved;
  late int _likesCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Header ──────────────────────────────────────────────
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Row(
            children: [
              // Avatar with gradient ring
              Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFD300C4),
                      Color(0xFFFF7A00),
                      Color(0xFFFFD600),
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
                    radius: 16,
                    backgroundImage: NetworkImage(
                      widget.post.userProfileImageUrl,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Username row with verified badge
                    Row(
                      children: [
                        Text(
                          widget.post.username,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 3),
                        const Icon(
                          Icons.verified,
                          color: Colors.white,
                          size: 14,
                        ),
                        if (widget.post.collabUsername != null) ...[
                          const Text(
                            ' and ',
                            style: TextStyle(fontSize: 13, color: Colors.white),
                          ),
                          Text(
                            widget.post.collabUsername!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 3),
                          const Icon(
                            Icons.verified,
                            color: Colors.white,
                            size: 14,
                          ),
                        ],
                      ],
                    ),
                    // Music/Audio line
                    if (widget.post.audioTitle != null)
                      Row(
                        children: [
                          const Icon(
                            Icons.music_note,
                            size: 12,
                            color: Colors.white70,
                          ),
                          const SizedBox(width: 3),
                          Expanded(
                            child: Text(
                              widget.post.audioTitle!,
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.white70,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              // Menu icon  "—"
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.remove, color: Colors.white, size: 22),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
        ),

        // ── Post Image ───────────────────────────────────────────
        GestureDetector(
          onDoubleTap: () {
            _toggleLike();
          },
          child: Image.network(
            widget.post.postImageUrl,
            width: double.infinity,
            height: 370,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, progress) {
              if (progress == null) return child;
              return Container(
                height: 370,
                color: Colors.grey[900],
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white24,
                    strokeWidth: 1.5,
                  ),
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) => Container(
              height: 370,
              color: Colors.grey[900],
              child: const Center(
                child: Icon(
                  Icons.broken_image_outlined,
                  color: Colors.white30,
                  size: 48,
                ),
              ),
            ),
          ),
        ),

        // ── Action Buttons ────────────────────────────────────────
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
          child: Row(
            children: [
              // Like
              IconButton(
                onPressed: _toggleLike,
                icon: Icon(
                  _isLiked ? Icons.favorite : Icons.favorite_border,
                  color: _isLiked ? Colors.red : Colors.white,
                  size: 26,
                ),
              ),
              // Comment
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.chat_bubble_outline,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              // Share / Send
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.send_outlined,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const Spacer(),
              // Save
              IconButton(
                onPressed: _toggleSave,
                icon: Icon(
                  _isSaved ? Icons.bookmark : Icons.bookmark_border,
                  color: Colors.white,
                  size: 26,
                ),
              ),
            ],
          ),
        ),

        // ── Likes count ───────────────────────────────────────────
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Text(
            '$_likesCount likes',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: Colors.white,
            ),
          ),
        ),

        // ── Caption ───────────────────────────────────────────────
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 4.0),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.white, fontSize: 13),
              children: [
                TextSpan(
                  text: '${widget.post.username} ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: widget.post.caption),
              ],
            ),
          ),
        ),

        // ── View comments ─────────────────────────────────────────
        if (widget.post.commentsCount > 0)
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 14.0,
              vertical: 2.0,
            ),
            child: Text(
              'View all ${widget.post.commentsCount} comments',
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ),

        // ── Time ago ──────────────────────────────────────────────
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 3.0),
          child: Text(
            widget.post.timeAgo,
            style: const TextStyle(color: Colors.grey, fontSize: 11),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _isLiked = widget.post.isLiked;
    _isSaved = widget.post.isSaved;
    _likesCount = widget.post.likesCount;
  }

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
      _likesCount += _isLiked ? 1 : -1;
    });
  }

  void _toggleSave() {
    setState(() {
      _isSaved = !_isSaved;
    });
  }
}

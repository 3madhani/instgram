class PostModel {
  final String id;
  final String username;
  final String userProfileImageUrl;
  final String postImageUrl;
  final String caption;
  final int likesCount;
  final int commentsCount;
  final String timeAgo;
  final bool isLiked;
  final bool isSaved;

  PostModel({
    required this.id,
    required this.username,
    required this.userProfileImageUrl,
    required this.postImageUrl,
    required this.caption,
    required this.likesCount,
    required this.commentsCount,
    required this.timeAgo,
    this.isLiked = false,
    this.isSaved = false,
  });
}

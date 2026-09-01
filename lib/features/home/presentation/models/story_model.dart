class StoryModel {
  final String id;
  final String username;
  final String userProfileImageUrl;
  final bool isViewed;

  StoryModel({
    required this.id,
    required this.username,
    required this.userProfileImageUrl,
    this.isViewed = false,
  });
}

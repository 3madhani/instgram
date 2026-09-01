import 'package:flutter/material.dart';
import '../models/post_model.dart';
import '../models/story_model.dart';
import '../widgets/post_list_widget.dart';
import '../widgets/story_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // ── Dummy data ──────────────────────────────────────────────────────────────
  final List<StoryModel> _stories = [
    StoryModel(id: '1', username: 'mina_m10z', userProfileImageUrl: 'https://picsum.photos/150?random=1'),
    StoryModel(id: '2', username: 'mena28428', userProfileImageUrl: 'https://picsum.photos/150?random=2'),
    StoryModel(id: '3', username: 'sriilhwa', userProfileImageUrl: 'https://picsum.photos/150?random=3', isViewed: true),
    StoryModel(id: '4', username: 'alex_k', userProfileImageUrl: 'https://picsum.photos/150?random=4'),
    StoryModel(id: '5', username: 'john_doe', userProfileImageUrl: 'https://picsum.photos/150?random=5', isViewed: true),
  ];

  final List<PostModel> _posts = [
    PostModel(
      id: '1',
      username: 'lamineyamal',
      collabUsername: 'raphinha',
      userProfileImageUrl: 'https://picsum.photos/150?random=10',
      postImageUrl: 'https://picsum.photos/600/700?random=20',
      caption: 'Brothers 🤝🔵🔴',
      likesCount: 1240500,
      commentsCount: 4830,
      timeAgo: '2 hours ago',
      audioTitle: "Chilllout, Soul Frequency, D'Michel leb · Ext...",
    ),
    PostModel(
      id: '2',
      username: 'john_doe',
      userProfileImageUrl: 'https://picsum.photos/150?random=1',
      postImageUrl: 'https://picsum.photos/600/700?random=21',
      caption: 'Enjoying the beautiful sunny day! ☀️ #sunshine #vibes',
      likesCount: 124,
      commentsCount: 15,
      timeAgo: '5 hours ago',
    ),
    PostModel(
      id: '3',
      username: 'jane_smith',
      userProfileImageUrl: 'https://picsum.photos/150?random=2',
      postImageUrl: 'https://picsum.photos/600/700?random=22',
      caption: 'Just launched my new app! Check it out guys 🚀',
      likesCount: 890,
      commentsCount: 104,
      timeAgo: '8 hours ago',
      isLiked: true,
    ),
  ];

  // ── Bottom nav items ────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add, color: Colors.white, size: 26),
        ),
        title: const Text(
          'Instagram',
          style: TextStyle(
            fontFamily: 'serif',
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: -0.5,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border, color: Colors.white, size: 26),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                StoryListWidget(stories: _stories),
                Divider(height: 1, color: Colors.grey[900]),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: PostListWidget(posts: _posts),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border(top: BorderSide(color: Colors.grey[900]!, width: 0.5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(
            icon: _selectedIndex == 0 ? Icons.home : Icons.home_outlined,
            isSelected: _selectedIndex == 0,
            onTap: () => setState(() => _selectedIndex = 0),
          ),
          _NavItem(
            icon: _selectedIndex == 1 ? Icons.play_circle_fill : Icons.play_circle_outline,
            isSelected: _selectedIndex == 1,
            onTap: () => setState(() => _selectedIndex = 1),
          ),
          // Send icon with red dot
          Stack(
            alignment: Alignment.center,
            children: [
              _NavItem(
                icon: Icons.send_outlined,
                isSelected: _selectedIndex == 2,
                onTap: () => setState(() => _selectedIndex = 2),
              ),
              const Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(radius: 4, backgroundColor: Colors.red),
              ),
            ],
          ),
          _NavItem(
            icon: _selectedIndex == 3 ? Icons.search : Icons.search,
            isSelected: _selectedIndex == 3,
            onTap: () => setState(() => _selectedIndex = 3),
          ),
          // Profile avatar
          GestureDetector(
            onTap: () => setState(() => _selectedIndex = 4),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: _selectedIndex == 4
                    ? Border.all(color: Colors.white, width: 2)
                    : null,
              ),
              child: const CircleAvatar(
                radius: 14,
                backgroundImage: NetworkImage('https://picsum.photos/150?random=8'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Icon(icon, color: Colors.white, size: 26),
      ),
    );
  }
}

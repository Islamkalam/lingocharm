import 'package:flutter/material.dart';
import 'package:lingocharm/global/app_globals.dart';
import 'package:lingocharm/screens/color_level_screen.dart';
import 'package:lingocharm/screens/comingsoonlevelscreen.dart';
import 'package:lingocharm/screens/levelgridscreen.dart';

class BeginnerCategoriesScreen extends StatelessWidget {
  final List<Map<String, String>> categories = [
    // {'title': 'Colors', 'image': 'assets/images/colors.jpg'},
    // {'title': 'Alphabets', 'image': 'assets/images/alphabets.jpg'},
    // {'title': 'Fruits', 'image': 'assets/images/fruits.jpg'},
    // {'title': 'Counting', 'image': 'assets/images/counting.jpg'},
    // {'title': 'Coming Soon', 'image': 'assets/images/comingsoon.jpg'},
    // {'title': 'Coming Soon', 'image': 'assets/images/comingsoon2.jpg'},
    {'title': 'Colors', 'image': 'assets/images/fruits.png'},
    {'title': 'Alphabets', 'image': 'assets/images/fruits.png'},
    {'title': 'Fruits', 'image': 'assets/images/fruits.png'},
    {'title': 'Counting', 'image': 'assets/images/fruits.png'},
    {'title': 'Coming Soon', 'image': 'assets/images/fruits.png'},
    {'title': 'Coming Soon', 'image': 'assets/images/fruits.png'},
  ];

  BeginnerCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppGlobals.backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Beginner Categories',
          style: TextStyle(
            color: AppGlobals.textColor,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: AppGlobals.primaryColor,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          final category = categories[index];
          return _AnimatedCategoryCard(
            title: category['title']!,
            imagePath: category['image']!,
            onTap: () {
              if (category['title'] == 'Coming Soon') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (_) => ComingSoonLevelScreen(title: category['title']!),
                  ),
                );
              } else if (category['title'] == 'Colors') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (_) => ColorLevelsScreen(),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (_) => LevelGridScreen(levelTitle: category['title']!),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}

class _AnimatedCategoryCard extends StatefulWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  const _AnimatedCategoryCard({
    required this.title,
    required this.imagePath,
    required this.onTap,
  });

  @override
  State<_AnimatedCategoryCard> createState() => _AnimatedCategoryCardState();
}

class _AnimatedCategoryCardState extends State<_AnimatedCategoryCard>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        _visible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 400),
      opacity: _visible ? 1 : 0,
      child: GestureDetector(
        onTapDown: (_) => setState(() => _scale = 0.95),
        onTapUp: (_) => setState(() => _scale = 1.0),
        onTapCancel: () => setState(() => _scale = 1.0),
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _scale,
          duration: Duration(milliseconds: 150),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.imagePath),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.35),
                  BlendMode.darken,
                ),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

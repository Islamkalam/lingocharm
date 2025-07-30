import 'package:flutter/material.dart';
import 'package:lingocharm/global/app_globals.dart';

class LevelGridScreen extends StatelessWidget {
  final String levelTitle;

  const LevelGridScreen({super.key, required this.levelTitle});

  @override
  Widget build(BuildContext context) {
    // Sample: You can change this based on real level logic later
    final levels = List.generate(12, (index) => "Level ${index + 1}");

    return Scaffold(
      backgroundColor: AppGlobals.backgroundColor,
      appBar: AppBar(
        title: Text('$levelTitle Levels',
        style: TextStyle(color: AppGlobals.textColor),),
        backgroundColor: AppGlobals.primaryColor,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: levels.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Later navigate to exercises
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppGlobals.primaryColor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  levels[index],
                  style: TextStyle(color: AppGlobals.textColor, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
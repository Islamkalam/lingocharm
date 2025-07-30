import 'package:flutter/material.dart';
import 'package:lingocharm/global/app_globals.dart';
import 'package:lingocharm/screens/beginnercategoriesscreen.dart';
import 'package:lingocharm/screens/comingsoonlevelscreen.dart';
import 'package:lingocharm/screens/levelgridscreen.dart';

class LevelSelectionScreen extends StatelessWidget {
  final List<Map<String, dynamic>> levels = [
    {'title': 'Beginner', 'unlocked': true},
    {'title': 'Intermediate', 'unlocked': true},
    {'title': 'Advanced', 'unlocked': false},
    {'title': 'Expert', 'unlocked': false},
  ];

  LevelSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppGlobals.backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Select Your Level',
          style: TextStyle(color: AppGlobals.textColor),
        ),
        backgroundColor: AppGlobals.primaryColor,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: levels.length,
        itemBuilder: (context, index) {
          final level = levels[index];
          return GestureDetector(
            onTap: () {
              if (level['title'] == 'Beginner') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BeginnerCategoriesScreen(),
                  ),
                );
              } else if (level['title'] == 'Intermediate') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            LevelGridScreen(levelTitle: level['title']),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            ComingSoonLevelScreen(title: level['title']),
                  ),
                );
              }
            },
            child: Card(
              color: AppGlobals.primaryColor,
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: Icon(
                  level['unlocked'] ? Icons.shield : Icons.lock,
                  color:
                      level['unlocked']
                          ? AppGlobals.accentColor
                          : AppGlobals.lockedColor,
                  size: 40,
                ),
                title: Text(
                  level['title'],
                  style: TextStyle(fontSize: 20, color: AppGlobals.textColor),
                ),
                subtitle: Text(
                  level['unlocked'] ? "Unlocked" : "Locked",
                  style: TextStyle(
                    color:
                        level['unlocked']
                            ? AppGlobals.accentColor
                            : AppGlobals.lockedColor,
                  ),
                ),
                trailing:
                    level['unlocked']
                        ? Icon(
                          Icons.arrow_forward_ios,
                          color: AppGlobals.successColor,
                        )
                        : null,
              ),
            ),
          );
        },
      ),
    );
  }
}

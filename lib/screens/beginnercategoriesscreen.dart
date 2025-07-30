import 'package:flutter/material.dart';
import 'package:lingocharm/global/app_globals.dart';

class BeginnerCategoriesScreen extends StatelessWidget {
  final List<String> categories = ['Colors', 'Alphabets', 'Fruits', 'Counting'];

  BeginnerCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppGlobals.backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Beginner Categories',
          style: TextStyle(color: AppGlobals.textColor),
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
          return GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: AppGlobals.primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  category,
                  style: TextStyle(fontSize: 18, color: AppGlobals.textColor),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

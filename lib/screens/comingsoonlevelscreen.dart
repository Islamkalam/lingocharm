import 'package:flutter/material.dart';
import 'package:lingocharm/global/app_globals.dart';

class ComingSoonLevelScreen extends StatelessWidget {
  final String title;

  const ComingSoonLevelScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppGlobals.backgroundColor,
      appBar: AppBar(
        title: Text(title, style: TextStyle(color: AppGlobals.textColor)),
        backgroundColor: AppGlobals.primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.construction, size: 80, color: AppGlobals.accentColor),
            const SizedBox(height: 20),
            Text(
              '$title Levels Coming Soon',
              style: TextStyle(fontSize: 22, color: AppGlobals.textColor),
            ),
          ],
        ),
      ),
    );
  }
}

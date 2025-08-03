import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:lingocharm/screens/color_task_screen.dart'; // <-- yeh screen har color ka task dikhayegi
import 'package:lingocharm/global/app_globals.dart';
import 'package:lingocharm/screens/color_task_screen.dart';

class ColorLevelGridScreen extends StatefulWidget {
  const ColorLevelGridScreen({Key? key}) : super(key: key);

  @override
  State<ColorLevelGridScreen> createState() => _ColorLevelGridScreenState();
}

class _ColorLevelGridScreenState extends State<ColorLevelGridScreen> {
  List<Map<String, dynamic>> colorLevels = [];

  @override
  void initState() {
    super.initState();
    loadColorLevels();
  }

  Future<void> loadColorLevels() async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/colors.json',
    );
    final List<dynamic> jsonData = json.decode(jsonString);
    setState(() {
      colorLevels = jsonData.cast<Map<String, dynamic>>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppGlobals.backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Color Levels',
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
        itemCount: colorLevels.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          final colorData = colorLevels[index];
          final colorName = colorData['name'] ?? 'Unknown';
          final hex = colorData['hex'] ?? '#000000';

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (_) =>
                          ColorTaskScreen(colorName: colorName, colorHex: hex),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: _hexToColor(hex),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  colorName,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Color _hexToColor(String hex) {
    hex = hex.replaceAll('#', '');
    if (hex.length == 6) hex = 'FF$hex';
    return Color(int.parse(hex, radix: 16));
  }
}

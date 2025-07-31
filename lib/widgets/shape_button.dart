import 'package:flutter/material.dart';

class ShapeButton extends StatelessWidget {
  final Color color;
  final String name;
  final VoidCallback onSpeak;
  final VoidCallback onMic;

  const ShapeButton({
    required this.color,
    required this.name,
    required this.onSpeak,
    required this.onMic,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onSpeak,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.mic, color: Colors.white),
          onPressed: onMic,
        )
      ],
    );
  }
}

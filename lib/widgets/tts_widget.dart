// lib/widgets/tts_widget.dart

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:lingocharm/global/app_globals.dart';

class TTSWidget extends StatelessWidget {
  final String text;
  final FlutterTts _tts = FlutterTts();

  TTSWidget({super.key, required this.text});

  Future<void> _speak() async {
    await _tts.setLanguage("en-US"); // Optional: Set your preferred language
    await _tts.setPitch(1.0); // Optional: Set pitch
    await _tts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppGlobals.primaryColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: AppGlobals.secondaryColor.withOpacity(0.4),
            blurRadius: 8,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: IconButton(
        icon: const Icon(Icons.volume_up),
        tooltip: "Speak",
        color: Colors.white,
        onPressed: _speak,
      ),
    );
  }
}

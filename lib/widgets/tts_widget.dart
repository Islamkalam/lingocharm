import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TTSWidget extends StatelessWidget {
  final String text;
  final FlutterTts _tts = FlutterTts();

  TTSWidget({super.key, required this.text});

  Future<void> _speak() async {
    await _tts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: _speak, child: Text("Speak"));
  }
}

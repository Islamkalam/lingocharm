// lib/widgets/stt_widget.dart
import 'package:flutter/material.dart';
import '../services/stt_service.dart';

class STTWidget extends StatefulWidget {
  const STTWidget({super.key});

  @override
  State<STTWidget> createState() => _STTWidgetState();
}

class _STTWidgetState extends State<STTWidget> {
  String _spokenText = "Say something...";
  bool _isListening = false;

  Future<void> _handleSTT() async {
    setState(() => _isListening = true);
    String result = await STTService.listen();
    setState(() {
      _spokenText = result;
      _isListening = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(_spokenText),
        ElevatedButton(
          onPressed: _isListening ? null : _handleSTT,
          child: Text(_isListening ? "Listening..." : "Start Listening"),
        ),
      ],
    );
  }
}

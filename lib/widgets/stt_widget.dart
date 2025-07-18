import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class STTWidget extends StatefulWidget {
  const STTWidget({super.key});

  @override
  _STTWidgetState createState() => _STTWidgetState();
}

class _STTWidgetState extends State<STTWidget> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _spokenText = "Say something...";

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize();
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (result) {
            setState(() {
              _spokenText = result.recognizedWords;
            });
          },
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(_spokenText),
        ElevatedButton(
          onPressed: _listen,
          child: Text(_isListening ? "Stop Listening" : "Start Listening"),
        ),
      ],
    );
  }
}

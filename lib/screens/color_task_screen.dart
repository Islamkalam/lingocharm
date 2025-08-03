import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class ColorTaskScreen extends StatefulWidget {
  final String colorName;
  final String colorHex;

  const ColorTaskScreen({
    super.key,
    required this.colorName,
    required this.colorHex,
  });

  @override
  State<ColorTaskScreen> createState() => _ColorTaskScreenState();
}

class _ColorTaskScreenState extends State<ColorTaskScreen> {
  final FlutterTts _flutterTts = FlutterTts();
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _recognizedText = '';
  String _expectedText = '';

  Color get _color => Color(int.parse("0xFF${widget.colorHex.substring(1)}"));

  @override
  void initState() {
    super.initState();
    _expectedText = widget.colorName;
  }

  Future<void> _speak(String text) async {
    await _flutterTts.speak(text);
  }

  Future<void> _listen(String expected) async {
    _expectedText = expected;
    bool available = await _speech.initialize();
    if (available) {
      setState(() {
        _recognizedText = '';
        _isListening = true;
      });

      _speech.listen(
        onResult: (result) {
          setState(() {
            _recognizedText = result.recognizedWords;
          });
        },
      );

      await Future.delayed(const Duration(seconds: 3));
      await _speech.stop();
      setState(() {
        _isListening = false;
      });

      if (_recognizedText.toLowerCase().trim() == expected.toLowerCase().trim()) {
        _showSuccessDialog();
      }
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Well Done!"),
        content: const Text("You said the correct color!"),
        actions: [
          TextButton(
            child: const Text("Next"),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.colorName),
        backgroundColor: _color,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Color Circle
            GestureDetector(
              onTap: () => _speak(widget.colorName),
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: _color,
                  shape: BoxShape.circle,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Mic Button
            IconButton(
              icon: Icon(
                _isListening ? Icons.mic_off : Icons.mic,
                size: 30,
              ),
              onPressed: _isListening ? null : () => _listen(widget.colorName),
            ),

            const SizedBox(height: 10),

            // Recognized Text
            Text(
              _recognizedText,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: _recognizedText.isEmpty
                    ? Colors.black
                    : (_recognizedText.toLowerCase().trim() ==
                            _expectedText.toLowerCase().trim()
                        ? Colors.green
                        : Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter/services.dart' show rootBundle;

class ColorLevelsScreen extends StatefulWidget {
  @override
  _ColorLevelsScreenState createState() => _ColorLevelsScreenState();
}

class _ColorLevelsScreenState extends State<ColorLevelsScreen> {
  List<Map<String, dynamic>> colorLevels = [];
  final FlutterTts _flutterTts = FlutterTts();
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _recognizedText = "";
  String _expectedText = "";

  @override
  void initState() {
    super.initState();
    loadColorsJson();
  }

  Future<void> loadColorsJson() async {
    final String response = await rootBundle.loadString(
      'assets/data/colors.json',
    );
    final data = json.decode(response);
    setState(() {
      colorLevels = List<Map<String, dynamic>>.from(data['colors']);
    });
  }

  Future<void> _speak(String text) async {
    await _flutterTts.speak(text);
  }

  Future<void> _listen(String expected) async {
    _expectedText = expected;
    bool available = await _speech.initialize();
    if (available) {
      setState(() {
        _recognizedText = "";
        _isListening = true;
      });

      _speech.listen(
        onResult: (result) {
          setState(() {
            _recognizedText = result.recognizedWords;
          });
        },
      );

      await Future.delayed(Duration(seconds: 3));
      await _speech.stop();
      setState(() {
        _isListening = false;
      });

      if (_recognizedText.toLowerCase().trim() ==
          expected.toLowerCase().trim()) {
        _showSuccessDialog();
      }
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("Well Done!"),
            content: Text("You said the correct color!"),
            actions: [
              TextButton(
                child: Text("Next"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
    );
  }

  Widget _buildShape(Color color, String colorName) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => _speak(colorName),
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
        ),
        SizedBox(height: 10),
        IconButton(
          icon: Icon(Icons.mic, color: Colors.black),
          onPressed: () => _listen(colorName),
        ),
        SizedBox(height: 10),
        Text(
          _recognizedText,
          style: TextStyle(
            color:
                _recognizedText.isEmpty
                    ? Colors.black
                    : (_recognizedText.toLowerCase().trim() ==
                            _expectedText.toLowerCase().trim()
                        ? Colors.green
                        : Colors.red),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Color Levels")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            colorLevels.isEmpty
                ? Center(child: CircularProgressIndicator())
                : GridView.builder(
                  itemCount: colorLevels.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    final level = colorLevels[index];
                    final colorName = level['name'];
                    final colorHex = level['hex'];
                    final color = Color(
                      int.parse("0xFF${colorHex.substring(1)}"),
                    );

                    return _buildShape(color, colorName);
                  },
                ),
      ),
    );
  }
}

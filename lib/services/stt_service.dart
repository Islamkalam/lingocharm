// lib/services/stt_service.dart
import 'package:speech_to_text/speech_to_text.dart' as stt;

class STTService {
  static final stt.SpeechToText _speech = stt.SpeechToText();
  static bool _isInitialized = false;

  /// Initializes and starts listening. Returns recognized text.
  static Future<String> listen() async {
    if (!_isInitialized) {
      _isInitialized = await _speech.initialize();
    }

    if (_isInitialized) {
      String resultText = "";

      await _speech.listen(
        onResult: (result) {
          resultText = result.recognizedWords;
        },
      );

      // Wait until speech ends
      await Future.delayed(const Duration(seconds: 3));
      await _speech.stop();

      return resultText;
    }

    return "Speech recognition not available.";
  }

  static Future<void> stop() async {
    await _speech.stop();
  }
}

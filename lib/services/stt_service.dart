// lib/services/stt_service.dart
import 'dart:async';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class STTService {
  static final stt.SpeechToText _speech = stt.SpeechToText();
  static bool _isInitialized = false;

  /// This method listens once and returns recognized text when done
  static Future<String> listenOnce() async {
    if (!_isInitialized) {
      _isInitialized = await _speech.initialize();
    }

    if (!_isInitialized) {
      return "Speech recognition not available.";
    }

    final completer = Completer<String>();

    _speech.listen(
      onResult: (result) {
        if (result.finalResult && !completer.isCompleted) {
          completer.complete(result.recognizedWords);
        }
      },
    );

    // Timeout after 5 seconds if user doesn't speak
    Future.delayed(Duration(seconds: 5), () async {
      if (!completer.isCompleted) {
        await _speech.stop();
        completer.complete("No speech detected.");
      }
    });

    final resultText = await completer.future;
    await _speech.stop();
    return resultText;
  }

  static Future<void> stop() async {
    await _speech.stop();
  }
}

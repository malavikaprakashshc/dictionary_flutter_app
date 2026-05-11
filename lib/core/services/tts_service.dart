import 'dart:ui';

import 'package:flutter_tts/flutter_tts.dart';

class TtsService {
  final FlutterTts _tts = FlutterTts();

  VoidCallback? onComplete;

  TtsService() {
    _init();
  }

  void _init() {
    _tts.setCompletionHandler(() {
      onComplete?.call(); // notify UI
    });
  }

  Future<void> speak(String text) async {
    await _tts.speak(text);
  }

  Future<void> stop() async {
    await _tts.stop();
  }
}
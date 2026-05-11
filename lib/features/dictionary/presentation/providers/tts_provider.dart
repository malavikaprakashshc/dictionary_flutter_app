import 'package:dictionary_app/core/services/tts_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ttsProvider = Provider<TtsService>((ref) {
  return TtsService();
});

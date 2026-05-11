import 'package:dictionary_app/features/dictionary/domain/entities/word.dart';

extension WordExtension on Word {
  Meaning? get firstMeaning =>
      meanings.isNotEmpty ? meanings.first : null;

  Definition? get firstDefinitionObj =>
      firstMeaning?.definitions.isNotEmpty == true
          ? firstMeaning!.definitions.first
          : null;

  String? get firstDefinition =>
      firstDefinitionObj?.definition;

  String? get firstPartOfSpeech =>
      firstMeaning?.partOfSpeech;
}
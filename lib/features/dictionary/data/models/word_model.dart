import 'package:dictionary_app/features/dictionary/domain/entities/word.dart';
import 'package:json_annotation/json_annotation.dart';

part 'word_model.g.dart';

@JsonSerializable()
class WordModel {
  final String word;
  final String? phonetic;
  final List<PhoneticModel>? phonetics;
  final List<MeaningModel>? meanings;

  WordModel({required this.word, this.phonetic, this.phonetics, this.meanings});

  factory WordModel.fromJson(Map<String, dynamic> json) => _$WordModelFromJson(json);

  Map<String, dynamic> toJson() => _$WordModelToJson(this);

Word toEntity() {
  return Word(
    word: word,
    phonetic: phonetic ?? '',
    meanings: meanings
            ?.where((m) => m.definitions != null && m.definitions!.isNotEmpty)
            .map((m) {
          return Meaning(
            partOfSpeech: m.partOfSpeech ?? '',
            definitions: m.definitions!.map((d) {
              return Definition(
                definition: d.definition ?? '',
                example: d.example ?? '',
                synonyms: d.synonyms ?? [],
              );
            }).toList(),
          );
        }).toList() ??
        [],
  );
}

}

@JsonSerializable()
class PhoneticModel {
  final String? text;
  final String? audio;

  PhoneticModel(this.text, this.audio);

  factory PhoneticModel.fromJson(Map<String, dynamic> json) =>
      _$PhoneticModelFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneticModelToJson(this);
}

@JsonSerializable()
class MeaningModel {
  final String? partOfSpeech;
  final List<DefinitionModel>? definitions;

  MeaningModel({this.partOfSpeech, this.definitions});

  factory MeaningModel.fromJson(Map<String, dynamic> json) =>
      _$MeaningModelFromJson(json);

  Map<String, dynamic> toJson() => _$MeaningModelToJson(this);
}

@JsonSerializable()
class DefinitionModel {
  final String? definition;
  final String? example;
  final List<String>? synonyms;

  DefinitionModel({this.definition, this.example, this.synonyms});

  factory DefinitionModel.fromJson(Map<String, dynamic> json) =>
      _$DefinitionModelFromJson(json);

  Map<String, dynamic> toJson() => _$DefinitionModelToJson(this);
}

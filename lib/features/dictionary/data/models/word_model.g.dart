// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WordModel _$WordModelFromJson(Map<String, dynamic> json) => WordModel(
  word: json['word'] as String,
  phonetic: json['phonetic'] as String?,
  phonetics: (json['phonetics'] as List<dynamic>?)
      ?.map((e) => PhoneticModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  meanings: (json['meanings'] as List<dynamic>?)
      ?.map((e) => MeaningModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$WordModelToJson(WordModel instance) => <String, dynamic>{
  'word': instance.word,
  'phonetic': instance.phonetic,
  'phonetics': instance.phonetics,
  'meanings': instance.meanings,
};

PhoneticModel _$PhoneticModelFromJson(Map<String, dynamic> json) =>
    PhoneticModel(json['text'] as String?, json['audio'] as String?);

Map<String, dynamic> _$PhoneticModelToJson(PhoneticModel instance) =>
    <String, dynamic>{'text': instance.text, 'audio': instance.audio};

MeaningModel _$MeaningModelFromJson(Map<String, dynamic> json) => MeaningModel(
  partOfSpeech: json['partOfSpeech'] as String?,
  definitions: (json['definitions'] as List<dynamic>?)
      ?.map((e) => DefinitionModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MeaningModelToJson(MeaningModel instance) =>
    <String, dynamic>{
      'partOfSpeech': instance.partOfSpeech,
      'definitions': instance.definitions,
    };

DefinitionModel _$DefinitionModelFromJson(Map<String, dynamic> json) =>
    DefinitionModel(
      definition: json['definition'] as String?,
      example: json['example'] as String?,
      synonyms: (json['synonyms'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$DefinitionModelToJson(DefinitionModel instance) =>
    <String, dynamic>{
      'definition': instance.definition,
      'example': instance.example,
      'synonyms': instance.synonyms,
    };

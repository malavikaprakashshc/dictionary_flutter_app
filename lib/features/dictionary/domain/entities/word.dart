class Word {
  final String word;
  final String phonetic;
  final List<Meaning> meanings;

  Word({required this.word, required this.phonetic, required this.meanings});
}

class Meaning {
  final String partOfSpeech;
  final List<Definition> definitions;

  Meaning({required this.partOfSpeech, required this.definitions});
}

class Definition {
  final String definition;
  final String example;
  final List<String> synonyms;

  Definition({
    required this.definition,
    required this.example,
    required this.synonyms,
  });
}

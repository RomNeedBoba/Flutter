import 'dart:convert';

class Kanji {
  final int id;
  final String kanji;
  final String onyomi;
  final String kunyomi;
  final String meaning;
  final String videoPath;
  final String? khmer;

  const Kanji({
    required this.id,
    required this.kanji,
    required this.onyomi,
    required this.kunyomi,
    required this.meaning,
    required this.videoPath,
    this.khmer,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'kanji': kanji,
      'onyomi': onyomi,
      'kunyomi': kunyomi,
      'meaning': meaning,
      'videoPath': videoPath,
      'khmer': khmer,
    };
  }

  factory Kanji.fromMap(Map<String, dynamic> map) {
    return Kanji(
      id: map['id'] as int,
      kanji: map['kanji'] as String,
      onyomi: map['onyomi'] as String,
      kunyomi: map['kunyomi'] as String,
      meaning: map['meaning'] as String,
      videoPath: map['videoPath'] as String,
      khmer: map['khmer'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory Kanji.fromJson(String source) => Kanji.fromMap(json.decode(source));
}

import 'package:flutter/material.dart';
import 'kanji_detail_page.dart';
import '../models/kanji_model.dart';

class KanjiPage extends StatelessWidget {
  final List<Kanji> kanjiList = [
    Kanji(
      id: 1,
      kanji: '抗',
      onyomi: 'コウ',
      kunyomi: 'あらがう',
      meaning: 'Confront; Resist',
      videoPath: 'assets/videos/Kanji12.MP4',
      khmer: 'ទប់ទល់',
    ),
    Kanji(
      id: 2,
      kanji: '踏',
      onyomi: 'トウ',
      kunyomi: 'ふむ、ふまえる',
      meaning: 'Step; Evade Payment',
      videoPath: 'assets/videos/Kanji12.MP4',
      khmer: 'ចាប់ផ្តើម',
    ),
    Kanji(
      id: 3,
      kanji: '避',
      onyomi: 'ヒ',
      kunyomi: 'さける、よける',
      meaning: 'Avoid; Evade',
      videoPath: 'assets/videos/Kanji12.MP4',
      khmer: 'ចៀសវាង',
    ),
    Kanji(
      id: 4,
      kanji: '聴',
      onyomi: 'チョウ',
      kunyomi: 'きく',
      meaning: 'Listen; Hear',
      videoPath: 'assets/videos/Kanji12.MP4',
      khmer: 'ស្ដាប់',
    ),
    Kanji(
      id: 5,
      kanji: '為',
      onyomi: 'イ',
      kunyomi: 'ため、なる、なす、する',
      meaning: 'For; Become; Do',
      videoPath: 'assets/videos/Kanji12.MP4',
      khmer: 'ដើម្បី',
    ),
    Kanji(
      id: 6,
      kanji: '抑',
      onyomi: 'ヨク',
      kunyomi: 'おさえる',
      meaning: 'Suppress; Restrain',
      videoPath: 'assets/videos/Kanji12.MP4',
      khmer: 'ចុច',
    ),
    Kanji(
      id: 7,
      kanji: '弾',
      onyomi: 'ダン',
      kunyomi: 'ひく、はずむ',
      meaning: 'Play (instrument); Bounce',
      videoPath: 'assets/videos/Kanji12.MP4',
      khmer: 'បាញ់',
    ),
    Kanji(
      id: 8,
      kanji: '伴',
      onyomi: 'ハン',
      kunyomi: 'ともなう',
      meaning: 'Accompany; Bring with',
      videoPath: 'assets/videos/Kanji12.MP4',
      khmer: 'អម',
    ),
    Kanji(
      id: 9,
      kanji: '掲',
      onyomi: 'ケイ',
      kunyomi: 'かかげる',
      meaning: 'Display; Raise',
      videoPath: 'assets/videos/Kanji12.MP4',
      khmer: 'លើក',
    ),
    Kanji(
      id: 10,
      kanji: '躍',
      onyomi: 'ヤク',
      kunyomi: 'おどる',
      meaning: 'Leap; Dance',
      videoPath: 'assets/videos/kKanji12.MP4',
      khmer: 'រាំ',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kanji'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: kanjiList.length,
        itemBuilder: (context, index) {
          final kanji = kanjiList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => KanjiDetailPage(kanji: kanji),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
              color: index % 2 == 0 ? Colors.white : Colors.grey[200],
              child: Row(
                children: [
                  Text(
                    '${kanji.id}.',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          kanji.kanji,
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          '${kanji.onyomi} (${kanji.kunyomi})',
                          style: TextStyle(fontSize: 16.0, color: Colors.grey),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          kanji.meaning,
                          style: TextStyle(fontSize: 16.0, color: Colors.grey),
                        ),
                        if (kanji.khmer != null)
                          Text(
                            kanji.khmer!,
                            style: TextStyle(fontSize: 16.0),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

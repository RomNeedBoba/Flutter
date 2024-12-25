import 'package:flutter/material.dart';
import 'vocabulary_detail_page.dart';

class VocabularyPage extends StatelessWidget {
  final List<Map<String, dynamic>> vocabularyList = [
    {
      'id': 1,
      'word': '人間関係 (ningen kankei)',
      'english': 'Human Relations',
      'khmer': 'ទំនាក់ទំនងសង្គម'
    },
    {
      'id': 2,
      'word': '付き合い (tsukiai)',
      'english': 'Relationship',
      'khmer': 'ទំនាក់ទំនង'
    },
    {
      'id': 3,
      'word': '食事 (shokuji)',
      'english': 'Meal, Food',
      'khmer': 'អាហារ'
    },
    {'id': 4, 'word': '飲物 (nomimono)', 'english': 'Drink', 'khmer': 'ភេសជ្ជៈ'},
    {
      'id': 5,
      'word': '医療 (iryo)',
      'english': 'Medical Care',
      'khmer': 'ការថែទាំសុខភាព'
    },
    {
      'id': 6,
      'word': '病院 (byouin)',
      'english': 'Hospital',
      'khmer': 'មន្ទីរពេទ្យ'
    },
    {'id': 7, 'word': '芸術 (geijutsu)', 'english': 'Arts', 'khmer': 'សិល្បៈ'},
    {'id': 8, 'word': 'スポーツ (supotsu)', 'english': 'Sports', 'khmer': 'កីឡា'},
    {
      'id': 9,
      'word': '教育 (kyouiku)',
      'english': 'Education',
      'khmer': 'ការអប់រំ'
    },
    {'id': 10, 'word': '学校 (gakkou)', 'english': 'School', 'khmer': 'សាលារៀន'},
    {
      'id': 11,
      'word': '経済 (keizai)',
      'english': 'Economy',
      'khmer': 'សេដ្ឋកិច្ច'
    },
    {'id': 12, 'word': '法律 (hourei)', 'english': 'Law', 'khmer': 'ច្បាប់'},
    {'id': 13, 'word': '自然 (shizen)', 'english': 'Nature', 'khmer': 'ធម្មជាតិ'},
    {
      'id': 14,
      'word': '環境 (kankyou)',
      'english': 'Environment',
      'khmer': 'បរិស្ថាន'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vocabulary'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: vocabularyList.length,
        itemBuilder: (context, index) {
          final vocabulary = vocabularyList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VocabularyDetailPage(
                    vocabularyId: vocabulary['id'],
                    japaneseWord: vocabulary['word'],
                    englishWord: vocabulary['english'],
                    khmerWord: vocabulary['khmer'],
                  ),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
              color: index % 2 == 0 ? Colors.white : Colors.grey[200],
              child: Row(
                children: [
                  Text(
                    '${vocabulary['id']}.',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${vocabulary['word']}',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          '${vocabulary['english']}',
                          style: TextStyle(fontSize: 16.0, color: Colors.grey),
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

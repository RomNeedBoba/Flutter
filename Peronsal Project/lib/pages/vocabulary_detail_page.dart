import 'package:flutter/material.dart';

class VocabularyDetailPage extends StatelessWidget {
  final int vocabularyId;
  final String japaneseWord;
  final String englishWord;
  final String khmerWord;

  const VocabularyDetailPage({
    Key? key,
    required this.vocabularyId,
    required this.japaneseWord,
    required this.englishWord,
    required this.khmerWord,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(japaneseWord),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              japaneseWord,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              englishWord,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              khmerWord, // Display Khmer translation
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}

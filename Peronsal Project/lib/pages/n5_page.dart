import 'package:flutter/material.dart';
import 'grammar_page.dart';
import 'vocabulary_page.dart';
import 'kanji_page.dart';
import 'quiz_screen.dart';

class N5Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level N5'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildN5Tile(context, 'Grammar', Icons.menu_book),
              SizedBox(height: 16.0),
              _buildN5Tile(context, 'Vocabulary', Icons.book),
              SizedBox(height: 16.0),
              _buildN5Tile(context, 'Kanji', Icons.text_fields),
              SizedBox(height: 16.0),
              _buildN5Tile(context, 'Quiz', Icons.quiz),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildN5Tile(BuildContext context, String title, IconData icon) {
    return GestureDetector(
      onTap: () {
        switch (title) {
          case 'Grammar':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GrammarPage()),
            );
            break;
          case 'Vocabulary':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VocabularyPage()),
            );
            break;
          case 'Kanji':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => KanjiPage()),
            );
            break;
          case 'Quiz':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QuizScreen()),
            );
            break;
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Icon(icon, size: 40.0),
            SizedBox(width: 16.0),
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

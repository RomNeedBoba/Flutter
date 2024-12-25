import 'package:flutter/material.dart';

class GrammarDetailPage extends StatelessWidget {
  final int grammarId;
  final String grammarText;
  final String explanation;
  final String khmerExplanation;
  final List<String> exampleSentences;

  const GrammarDetailPage({
    Key? key,
    required this.grammarId,
    required this.grammarText,
    required this.explanation,
    required this.khmerExplanation,
    required this.exampleSentences,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(grammarText),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                grammarText,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                explanation,
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              Text(
                khmerExplanation,
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 16.0),
              Text(
                'Example Sentences:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: exampleSentences.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      '- ${exampleSentences[index]}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

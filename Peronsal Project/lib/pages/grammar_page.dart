import 'package:flutter/material.dart';
import 'grammar_detail_page.dart';

class GrammarPage extends StatelessWidget {
  final List<Map<String, dynamic>> grammarList = [
    {
      'id': 1,
      'grammar': 'あえて (aete)',
      'explanation': 'Even though, despite',
      'khmer': 'ទោះបីជា...ក៏ដោយ',
      'exampleSentences': [
        '彼はあえて危険を冒して山に登った。 (Kare wa aete kiken o oboete yama ni nobotta.)',
        '彼はあえてその難しい問題に挑戦した。 (Kare wa aete sono muzukashii mondai ni chousen shita.)'
      ],
    },
    {
      'id': 2,
      'grammar': 'あくまでも (akumade mo)',
      'explanation': 'In any case, at any cost',
      'khmer': 'ទោះបីជាយ៉ាងណាក៏ដោយ',
      'exampleSentences': [
        '私はあくまでも自分の意見を貫くつもりだ。 (Watashi wa akumademo jibun no iken o tsura nukou tsumori da.)',
        '彼はあくまでも最後まで頑張るつもりだ。 (Kare wa akumademo saigo made ganbaru tsumori da.)'
      ],
    },
    {
      'id': 3,
      'grammar': '案の定 (an no jou)',
      'explanation': 'As expected, sure enough',
      'khmer': 'ដូចដែលបានរំពឹងទុក',
      'exampleSentences': [
        '案の定、雨が降り始めた。 (An no jou, ame ga furi hajimeta.)',
        '案の定、彼は遅刻してきた。 (An no jou, kare wa chikoku shite kita.)'
      ],
    },
    {
      'id': 4,
      'grammar': 'あらかじめ (arakajime)',
      'explanation': 'In advance, beforehand',
      'khmer': 'ជាមុន',
      'exampleSentences': [
        '私たちはあらかじめ予約をしてレストランに行った。 (Watashitachi wa arakajime yoyaku o shite resutoran ni itta.)',
        '彼はあらかじめ準備をして試験に臨んだ。 (Kare wa arakajime junbi o shite shiken ni nobonda.)'
      ],
    },
    {
      'id': 5,
      'grammar': 'あっての (atte no)',
      'explanation': 'Thanks to, because of',
      'khmer': 'ដោយសារតែ',
      'exampleSentences': [
        '彼の協力あっての成功だ。 (Kare no kyouryoku atte no seikou da.)',
        'あなたの支えがあっての私です。 (Anata no sasae ga atte no watashi desu.)'
      ],
    },
    {
      'id': 6,
      'grammar': '場合によっては (baai ni yotte wa)',
      'explanation': 'Depending on the circumstances',
      'khmer': 'អាស្រ័យលើស្ថានភាព',
      'exampleSentences': [
        '場合によっては、予定を変更するかもしれません。 (Baai ni yotte wa, yotei o henkou suru kamoshiremasen.)',
        '場合によっては、キャンセル料がかかることがあります。 (Baai ni yotte wa, kyanseru ryou ga kakaru koto ga arimasu.)'
      ],
    },
    {
      'id': 7,
      'grammar': 'ばこそ (ba koso)',
      'explanation': 'Only if, only when',
      'khmer': 'ប្រសិនបើ...តែប៉ុណ្ណោះ',
      'exampleSentences': [
        '本気で努力すればこそ成功できる。 (Honki de doryoku sureba koso seikou dekiru.)',
        '彼が来るばこそ、パーティーは盛り上がった。 (Kare ga kuru ba koso, paatii wa moriagatta.)'
      ],
    },
    {
      'id': 8,
      'grammar': 'ばそれまでだ (ba sore made da)',
      'explanation': 'If so, then that\'s the end of it',
      'khmer': 'ប្រសិនបើដូច្នេះ នោះជាចុងបញ្ចប់',
      'exampleSentences': [
        '彼が来なければそれまでだ。 (Kare ga kureba sore made da.)',
        '雨が降ればそれまでだ。 (Ame ga fureba sore made da.)'
      ],
    },
    {
      'id': 9,
      'grammar': 'べからず (bekarazu)',
      'explanation': 'Must not, should not',
      'khmer': 'មិនត្រូវ',
      'exampleSentences': [
        '公共の場で喫煙べからず。 (Koukyou no ba de kitsuen bekarazu.)',
        '公共の場では大声を出さべからず。 (Koukyou no ba de oogoe o dasa bekarazu.)'
      ],
    },
    {
      'id': 10,
      'grammar': 'べく (beku)',
      'explanation': 'Should, ought to',
      'khmer': 'គួរតែ',
      'exampleSentences': [
        '彼は留学するべく英語を勉強している。 (Kare wa ryuugaku suru beku eigo o benkyou shite iru.)',
        '私たちは環境を守るべく努力しなければならない。 (Watashitachi wa kankyou o mamoru beku doryoku shinakereba narimasen.)'
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grammar'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: grammarList.length,
          itemBuilder: (context, index) {
            final grammar = grammarList[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GrammarDetailPage(
                      grammarId: grammar['id'],
                      grammarText: grammar['grammar'],
                      explanation: grammar['explanation'],
                      khmerExplanation: grammar['khmer'],
                      exampleSentences:
                          List<String>.from(grammar['exampleSentences']),
                    ),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                margin: EdgeInsets.only(bottom: 10.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    // Removed the display of 'id'
                    Expanded(
                      child: Text(
                        '${grammar['grammar']}',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

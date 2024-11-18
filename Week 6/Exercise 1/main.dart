import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColorSelectionPage(),
    );
  }
}

class ColorSelectionPage extends StatelessWidget {
  final List<String> colorNames = ["red", "blue", "green"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Options'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ColorMethodSection(
              methodTitle: 'Using a For Loop Directly:',
              widgetList: generateColorTiles(colorNames),
            ),
            ColorMethodSection(
              methodTitle: 'Using map() Function:',
              widgetList: createTilesFromMap(colorNames),
            ),
            ColorMethodSection(
              methodTitle: 'Using Custom Function:',
              widgetList: generateCustomColorWidgets(),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> generateColorTiles(List<String> colors) {
    List<Widget> colorWidgets = [];
    for (var color in colors) {
      colorWidgets.add(ColorTile(color));
    }
    return colorWidgets;
  }

  List<Widget> createTilesFromMap(List<String> colors) {
    return colors.map((color) => ColorTile(color)).toList();
  }

  List<Widget> generateCustomColorWidgets() {
    return colorNames.map((color) {
      return ColorTile(color);
    }).toList();
  }
}

class ColorTile extends StatelessWidget {
  final String colorName;

  ColorTile(this.colorName);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(colorName),
    );
  }
}

class ColorMethodSection extends StatelessWidget {
  final String methodTitle;
  final List<Widget> widgetList;

  ColorMethodSection({
    required this.methodTitle,
    required this.widgetList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MethodTitle(methodTitle),
          ...widgetList,
        ],
      ),
    );
  }
}

class MethodTitle extends StatelessWidget {
  final String title;

  MethodTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
  }
}

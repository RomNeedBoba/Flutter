
import 'package:flutter/material.dart';

List<String> images = [
  "assets/bird.jpg",
  "assets/bird2.jpg",
  "assets/insect.jpg",
  "assets/girl.jpg",
  "assets/man.jpg",
];

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ?
      home: ImageGallary(),
    ));

class ImageGallary extends StatefulWidget {
  const ImageGallary({
    super.key,
  });

  @override
  State<ImageGallary> createState() => _ImageGallaryState();
}

class _ImageGallaryState extends State<ImageGallary> {
  int _index = 0;

  void _nextImage() {
    setState(() {
      _index = (_index + 1) % images.length;
    });
  }

  void _previousImage() {
    setState(() {
      _index = (_index - 1) % images.length;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: () => _previousImage(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: () => _nextImage(),
            ),
          ),
        ],
      ),
      body: Image.asset(images[_index]),
    );
  }
}

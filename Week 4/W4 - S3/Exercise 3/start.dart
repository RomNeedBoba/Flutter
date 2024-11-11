import 'package:flutter/material.dart';

void main() {
  runApp(const ImageViewerApp());
}

class ImageViewerApp extends StatelessWidget {
  const ImageViewerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.green[50],
      ),
      home: const ImageScreen(),
    );
  }
}

class ImageScreen extends StatefulWidget {
  const ImageScreen({Key? key}) : super(key: key);

  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  final List<String> _images = [
    "assets/bird.jpg",
    "assets/bird2.jpg",
    "assets/insect.jpg",
    "assets/girl.jpg",
    "assets/man.jpg",
  ];
  int _currentIndex = 0;

  void _showNextImage() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _images.length;
    });
  }

  void _showPreviousImage() {
    setState(() {
      _currentIndex = (_currentIndex - 1 + _images.length) % _images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Gallery'),
        actions: [
          IconButton(
            icon: const Icon(Icons.navigate_before),
            onPressed: _showPreviousImage,
            tooltip: 'Previous Image',
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            onPressed: _showNextImage,
            tooltip: 'Next Image',
          ),
        ],
      ),
      body: Center(
        child: Image.asset(_images[_currentIndex]),
      ),
    );
  }
}

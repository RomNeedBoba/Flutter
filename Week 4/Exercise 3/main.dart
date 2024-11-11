import 'package:flutter/material.dart';

void main() => runApp(const ImageGalleryApp());

class ImageGalleryApp extends StatelessWidget {
  const ImageGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ImageGallery(),
    );
  }
}

class ImageGallery extends StatefulWidget {
  const ImageGallery({super.key});

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  final List<String> images = [
    "assets/bird.jpg",
    "assets/bird2.jpg",
    "assets/insect.jpg",
    "assets/girl.jpg",
    "assets/man.jpg",
  ];
  int _index = 0;

  void _changeImage(int delta) {
    setState(() {
      _index = (_index + delta + images.length) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image Viewer'),
        actions: [
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Previous image',
            onPressed: () => _changeImage(-1),
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Next image',
            onPressed: () => _changeImage(1),
          ),
        ],
      ),
      body: Center(child: Image.asset(images[_index])),
    );
  }
}

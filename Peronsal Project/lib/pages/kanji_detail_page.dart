import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../models/kanji_model.dart';

class KanjiDetailPage extends StatefulWidget {
  final Kanji kanji;

  const KanjiDetailPage({
    Key? key,
    required this.kanji,
  }) : super(key: key);

  @override
  _KanjiDetailPageState createState() => _KanjiDetailPageState();
}

class _KanjiDetailPageState extends State<KanjiDetailPage> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.kanji.videoPath)
      ..initialize().then((_) {
        _controller.play();
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.kanji.kanji),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.replay),
                  onPressed: () {
                    setState(() {
                      _controller.seekTo(Duration.zero);
                      _controller.play();
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              '${widget.kanji.onyomi} (${widget.kanji.kunyomi})',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              widget.kanji.meaning,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            if (widget.kanji.khmer != null)
              Text(
                '${widget.kanji.khmer!}',
                style: TextStyle(fontSize: 16.0),
              ),
          ],
        ),
      ),
    );
  }
}

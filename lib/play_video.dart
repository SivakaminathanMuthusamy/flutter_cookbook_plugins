import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayVideo extends StatefulWidget {
  @override
  _PlayVideoState createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
  VideoPlayerController _videoPlayerController;
  Future<void> _controllerInitializer;
  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
    _controllerInitializer = _videoPlayerController.initialize();
    _videoPlayerController.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _controllerInitializer,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Align(
              alignment: Alignment.center,
              child: AspectRatio(
                aspectRatio: _videoPlayerController.value.aspectRatio,
                child: VideoPlayer(_videoPlayerController),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_videoPlayerController.value.isPlaying) {
            setState(() {
              _videoPlayerController.pause();
            });
          } else {
            setState(() {
              _videoPlayerController.play();
            });
          }
        },
        child: _videoPlayerController.value.isPlaying
            ? Icon(Icons.pause)
            : Icon(Icons.play_arrow),
      ),
    );
  }
}

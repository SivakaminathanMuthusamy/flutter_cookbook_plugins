import 'package:flutter/material.dart';
import 'package:flutter_cookbook_plugins/play_video.dart';
import 'package:camera/camera.dart';
import 'package:flutter_cookbook_plugins/take_picuture.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final camera = cameras.first;
  runApp(
    MyApp(
      mainCamera: camera,
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({this.mainCamera});
  final CameraDescription mainCamera;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: TakePicture(
        camera: mainCamera,
      ),
    );
  }
}

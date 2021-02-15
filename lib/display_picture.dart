import 'dart:io';

import 'package:flutter/material.dart';

class DisplayPicture extends StatelessWidget {
  DisplayPicture({this.imagePath});
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.file(
          File(imagePath),
        ),
      ),
    );
  }
}

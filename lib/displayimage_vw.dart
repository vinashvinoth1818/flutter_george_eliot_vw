import 'package:flutter/material.dart';

import 'appdata_image_vw.dart';

class DisplayImage extends StatelessWidget {
  final AppDataImage appData;

  DisplayImage({required this.appData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(appData.imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

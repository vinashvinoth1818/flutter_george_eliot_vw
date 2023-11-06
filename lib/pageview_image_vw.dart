import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import 'appdata_image_vw.dart';
import 'displayimage_vw.dart';
import 'indicator_vw.dart';
import 'navbar_vw.dart';

class PageViewImage extends StatefulWidget {
  const PageViewImage({Key? key}) : super(key: key);

  @override
  State<PageViewImage> createState() => _PageViewImageState();
}

class _PageViewImageState extends State<PageViewImage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        title: Text(
          'George Eliot Quotes',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          PopupMenuButton<int>(
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Text(
                  'Share',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
            onSelected: (value) {
              if (value == 1) {
                shareInfo();
              }
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 250,
              width: 350,
              child: PageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  itemCount: appDataList.length,
                  itemBuilder: (context, index) {
                    return DisplayImage(
                      appData: appDataList[index],
                    );
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  appDataList.length,
                  (index) => Indicator(
                      isActive: selectedIndex == index ? true : false),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  shareInfo() async {
    ByteData imagebyte =
        await rootBundle.load(appDataList[selectedIndex].imagePath);
    final temp = await getTemporaryDirectory();
    final path = '${temp.path}/download.jpg';
    File(path).writeAsBytesSync(imagebyte.buffer.asUint8List());
    await Share.shareFiles([path], text: 'Image Shared');
  }
}

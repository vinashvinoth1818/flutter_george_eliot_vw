import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import 'appdata_text_vw.dart';
import 'displaytext_vw.dart';
import 'navbar_vw.dart';

class PageViewText extends StatefulWidget {
  const PageViewText({Key? key}) : super(key: key);

  @override
  State<PageViewText> createState() => _PageViewTextState();
}

class _PageViewTextState extends State<PageViewText> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        title: Text(
          'George Eliot Quotes',
          style: TextStyle(fontSize: 20, color: Colors.black),
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
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                controller: PageController(viewportFraction: 0.7),
                itemCount: appDataText.length,
                itemBuilder: (context, index) {
                  var _quotes = appDataText[index];
                  var _scale = selectedIndex == index ? 1.0 : 0.8;

                  return TweenAnimationBuilder(
                      tween: Tween(begin: _scale, end: _scale),
                      duration: Duration(microseconds: 400),
                      child: DisplayText(appDataText: _quotes),
                      builder: (context, value, child) {
                        return Transform.scale(
                          scale: value as double,
                          child: child,
                        );
                      });
                }),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    child: new Text(
                  (selectedIndex + 1).toString() +
                      '/' +
                      appDataText.length.toString(),
                  style: TextStyle(
                    color: Colors.blue.shade400,
                    fontSize: 20,
                  ),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }

  shareInfo() {
    print('-------->Share');

    Share.share(appDataText[selectedIndex].text);
    print(appDataText[selectedIndex].text);
  }
}

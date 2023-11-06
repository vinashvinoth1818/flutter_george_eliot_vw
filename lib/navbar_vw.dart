import 'package:flutter/material.dart';
import 'package:flutter_george_eliot_quotes/pageview_image_vw.dart';
import 'package:flutter_george_eliot_quotes/pageview_text_vw.dart';
import 'company_profile_vw.dart';
import 'myprofile_vw.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text(
                'George Eliot',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            accountEmail: Text(
              'Version 1.0',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            currentAccountPicture: ClipOval(
              child: Image.asset(
                'images/george_eliot_image.jpg',
                height: 160,
                width: 180,
                fit: BoxFit.cover,
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/bg_2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Quotes Text',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => PageViewText()));
            },
          ),
          ListTile(
            title: Text(
              'Quotes Image',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => PageViewImage()));
            },
          ),
          ListTile(
            title: Text(
              'Personal Profile',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => MyProfile()));
            },
          ),
          ListTile(
            title: Text(
              'Company Profile',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => CompanyProfile()));
            },
          ),
        ],
      ),
    );
  }
}

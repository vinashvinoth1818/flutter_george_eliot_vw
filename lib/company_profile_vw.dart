import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'navbar_vw.dart';

class CompanyProfile extends StatelessWidget {
  const CompanyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text(
          'Company Profile',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.blue.shade400,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox.fromSize(
                  size: Size.fromRadius(80),
                  child: Image.asset('images/company_logo.png'),
                ),
              ),
              SizedBox(
                height: 10,
                width: 200,
                child: Divider(
                  color: Colors.blue.shade500,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.blue.shade400,
                  ),
                  title: Text(
                    '+91 99655 13542',
                    style: TextStyle(
                      color: Colors.blue.shade400,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: ListTile(
                  leading: Icon(
                    Icons.mail,
                    color: Colors.blue.shade400,
                  ),
                  title: Text(
                    'info@subisoftware.com',
                    style: TextStyle(
                      color: Colors.blue.shade400,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: ListTile(
                  leading: Icon(
                    Icons.web,
                    color: Colors.blue.shade400,
                  ),
                  title: Text(
                    'www.subisoftware.com',
                    style: TextStyle(
                      color: Colors.blue.shade400,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: ListTile(
                  leading: Icon(
                    Icons.location_city,
                    color: Colors.blue.shade400,
                  ),
                  title: Text(
                    ' 4358, 5th Main Rd, Rajammal nagar,'
                    ' TNHB Colony, Annanur,'
                    ' Ayappakkam, Chennai, '
                    'Tamil Nadu 600077.',
                    style: TextStyle(
                      color: Colors.blue.shade400,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

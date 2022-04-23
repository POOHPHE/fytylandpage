import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fyty/Navbar/navbar.dart';
class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return DesktopNavbar();
        } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
          return DesktopNavbar();
        } else {
          return MobileNavbar();
        }
      },
    );
  }
}

class DesktopNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: Container(
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/fyty_logo.png",
                    height: 100,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Fy",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Ty",
                    style: TextStyle(
                        color: Color(0xFF3cd58c),
                        fontSize: 45,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                MaterialButton(
                  onPressed: _launchURLaboutUS,
                  child:
                      Text("About us", style: TextStyle(color: Colors.white, fontSize: 25)),
                ),
                SizedBox(
                  width: 30,
                ),
                MaterialButton(
                  onPressed: _launchURLfacebook,
                  child: Text("Contact", style: TextStyle(color: Colors.white, fontSize: 25)),
                ),
                SizedBox(
                  width: 30,
                ),
                MaterialButton(
                  color: Color(0xFF3cd58c),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  onPressed: _launchURL,
                  child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 5.0),
                    child: Text(
                    "Try Demo",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                    )
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MobileNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Container(
        child: Column(children: <Widget>[
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/fyty_logo.png",
                    height: 70,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Fy",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Ty",
                    style: TextStyle(
                        color: Color(0xFF3cd58c),
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  onPressed: _launchURLaboutUS,
                  child:
                      Text("About us", style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
                
                MaterialButton(
                  onPressed: _launchURLfacebook,
                  child: Text("Contact", style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
                SizedBox(width: 8,),
                MaterialButton(
                  color: Color(0xFF3cd58c),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  onPressed: _launchURL,
                  child: Text(
                    "Try Demo",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ],
            ),
          
        ]),
      ),
    );
  }
}

_launchURL() async {
  const url = 'https://comafyty.herokuapp.com/';
  if (await canLaunch(url)) {
    FirebaseFirestore.instance
                    .collection('click_demo')
                    .add({'click': 1});
    await launch(url);

  } else {
    throw 'Could not launch $url';
  }
}

_launchURLaboutUS() async {
  const url = 'https://apskhem.github.io/cpe361-coma/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURLfacebook() async {
  const url = 'https://apskhem.github.io/cpe361-coma/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fyty/Navbar/navbar.dart';

class DesktopLandingPage extends StatefulWidget {
  final double width;
  const DesktopLandingPage({Key? key, required this.width}) : super(key: key);

  @override
  State<DesktopLandingPage> createState() => _DesktopLandingPageState();
}

class _DesktopLandingPageState extends State<DesktopLandingPage> {
  final myController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          
          width: widget.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
              children: [
                Text(
              "Fy",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                  color: Colors.white),
            ),Text(
              "Ty",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                  color: Color(0xFF3cd58c)),
            ),
              ],
            ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(
                  "Find Party to Training.\n",
                  style: TextStyle(fontSize: 30.0, color: Colors.white),
                ),
                Text(
                  '''แอพลิเคชั่นสำหรับการซ้อมกีฬา ESPORT ต่างๆ เพื่อการหาห้องซ้อมทีมและการนัดหมายทีมคู่ซ้อม ใช้งานได้ทั้งบนเว็บไซต์และแอพลิเคชั่นบนมือถือ
หากท่านสนใจ ท่านสามารถลงทะเบียนอีเมลเพื่อติดตามข่าวสารของ FyTy ได้''',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                ],)
                
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: const UnderlineInputBorder(   ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                      ),
                      labelText: 'Enter your email for subscribing',
                      filled: true,
                      fillColor: Colors.white,
                      focusColor: Color(0xFF3cd58c)),
                  controller: myController,
                ),
              ),
              MaterialButton(
                minWidth: double.infinity,
                color: Color(0xFF3cd58c),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                onPressed: () {
                  //print(myController.text);
                  FirebaseFirestore.instance
                      .collection('user_email')
                      .add({'email': myController.text});

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ThanksDesktop()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  child: Text(
                    "Subscribe",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Image.asset(
            "assets/images/fyty_logo.png",
            width: widget.width,
           height: 250,
          ),
        ),
        
      ],
    );
  }
}

class ThanksDesktop extends StatelessWidget {
  const ThanksDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Navbar(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Thanks For Subscribing",
                style: TextStyle(color: Colors.white, fontSize: 50),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ],
      ),
    );
  }
}

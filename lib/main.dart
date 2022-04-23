import 'package:flutter/material.dart';
import 'LandingPage/landingpage.dart';
import 'Navbar/navbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'LandingPage/fytydata.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FyTy | Awesome App for Next-Gen Gamers',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "Montserrat",
          scaffoldBackgroundColor: const Color(0xFF191b27)),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Navbar(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: LandingPage(),
              ),
              SizedBox(height: 20,),
              Padding(padding: EdgeInsets.symmetric(horizontal: 40),
              child: 
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                      color: Colors.white,
                      child: LeftData(
                          heading: fyData[0].header,
                          subtitle: fyData[0].bullet)),
                  Container(
                    alignment: Alignment.centerRight,
                      color: Color(0xFF3cd58c),
                      child: RightData(
                          heading: fyData[1].header,
                          subtitle: fyData[1].bullet)),
                  Container(
                    alignment: Alignment.centerLeft,
                      color: Colors.white,
                      child: LeftData(
                          heading: fyData[2].header,
                          subtitle: fyData[2].bullet)),
                  Container(
                    alignment: Alignment.centerRight,
                      color: Color(0xFF3cd58c),
                      child: RightData(
                          heading: fyData[3].header,
                          subtitle: fyData[3].bullet)),
                          Container(
                    alignment: Alignment.centerLeft,
                      color: Colors.white,
                      child: LeftData(
                          heading: fyData[4].header,
                          subtitle: fyData[4].bullet)),
                          Container(
                    alignment: Alignment.centerRight,
                      color: Color(0xFF3cd58c),
                      child: Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
                        children: [
                          Text(fyData[5].header,style: TextStyle(color: Colors.black, fontSize:  20),),
                          Text(fyData[6].header,style: TextStyle(color: Colors.black, fontSize:  20),),
                          Text(fyData[7].header,style: TextStyle(color: Colors.black, fontSize:  20),),
                          Text(fyData[8].header,style: TextStyle(color: Colors.black, fontSize:  20),),
                          Text(fyData[9].header,style: TextStyle(color: Colors.black, fontSize:  20),),
                        ],
                      )),)
                ],
              )
              ,)
              
            ],
          ),
        ),
      ),
    );
  }
}

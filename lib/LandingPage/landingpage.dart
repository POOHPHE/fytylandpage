import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fyty/LandingPage/mobilepage.dart';
import 'deskpage.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
import 'fytydata.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DesktopLandingPage(width: constraints.biggest.width / 2),
             
            ],
          );
        } else {
          return Column(
            children: <Widget>[
              MobileLandingPage(width: constraints.biggest.width),
              
            ],
          );
        }
      },
    );
  }
}


class RightData extends StatelessWidget {
  const RightData({Key? key, required this.heading, required this.subtitle})
      : super(key: key);
  final String heading;
  final List<String> subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        Text(heading, style: TextStyle(color: Colors.black, fontSize:  28, fontWeight: FontWeight.bold),),
        Text(subtitle[0], style: TextStyle(color: Colors.black, fontSize:  20)),
        Text(subtitle[1], style: TextStyle(color: Colors.black, fontSize:  20)),
      ],
    )
    )
    ;
  }
}

class LeftData extends StatelessWidget {
  const LeftData({Key? key, required this.heading, required this.subtitle})
      : super(key: key);
  final String heading;
  final List<String> subtitle;
  @override
  Widget build(BuildContext context) {
    return 
    Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(heading, style: TextStyle(color: Colors.black, fontSize:  28, fontWeight: FontWeight.bold),),
        Text(subtitle[0], style: TextStyle(color: Colors.black, fontSize:  20)),
        Text(subtitle[1], style: TextStyle(color: Colors.black, fontSize:  20)),
        Text(subtitle[2], style: TextStyle(color: Colors.black, fontSize:  20))
      ],
    ),
    );
  }
}


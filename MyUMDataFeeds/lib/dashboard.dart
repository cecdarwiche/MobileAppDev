import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.all(10)),
        Image.network("https://www.miamiherald.com/latest-news/9j2s7z/picture290428274/alternates/LANDSCAPE_1140/IMG_3826.jpeg", width: 400),
        Padding(padding: EdgeInsets.all(10)),
        Text("Cecile, welcome to your          University of Miami portal", 
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.deepOrange,
          fontSize: 30,)),
        Padding(padding: EdgeInsets.all(15),
        child: 
        Text("Find all the things that you might need here, from all the latest university news, to grades and class schedules",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 23))
        ),
        
        
      ]
    );
  }
}
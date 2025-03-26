import 'package:flutter/material.dart';

class schedule extends StatefulWidget {
  const schedule({super.key});

  @override
  State<schedule> createState() => _scheduleState();
}

class _scheduleState extends State<schedule> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.all(10)),
        Text("Spring 2025 schedule", 
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.deepOrange,
          fontSize: 30,)),
        Padding(padding: EdgeInsets.all(10)),
        Image.network("https://www.buacademy.org/files/2024/09/Sample-Eleventh-Grade-Schedule-2024.png", width: 400),
        Padding(padding: EdgeInsets.all(10),
        child: 
        Text("January 16 2025 - May 6 2025",
        style: TextStyle(
          fontSize: 23))
        ),
        Text("FINALS WEEK: May 8 - 12 2025",
        style: TextStyle(
          fontSize: 23))
        
      ]
    );
  }
}
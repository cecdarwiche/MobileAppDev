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
        Image.network("https://news.miami.edu/_assets/images-stories/2025/03/fec-week-hero-940x529.jpg", width: 400),
        Text("University of Miami", style: TextStyle(
          color: Colors.deepOrange,
          fontSize: 30,)),
        Padding(padding: EdgeInsets.all(50),
        child: 
        Text("Set one foot on campus and you’ll feel it—a vibe that celebrates life, learning, and daily activities that are anything but routine.",
        style: TextStyle(
          fontSize: 23))
        ),
        
        
      ]
    );
  }
}
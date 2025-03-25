import 'package:flutter/material.dart';
import 'dashboard.dart'; 
import 'customCard.dart'; 

void main() {
  runApp(const MyUM());
}

class MyUM extends StatelessWidget {
  const MyUM({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyUMApp(),
    );
  }
}

class MyUMApp extends StatefulWidget {
  const MyUMApp({super.key});

  @override
  State<MyUMApp> createState() => _MyUMAppState();
}

class _MyUMAppState extends State<MyUMApp> {
  int currentIndex = 0; 


  var imgs = [  
    "https://news.miami.edu/_assets/images-stories/2025/03/fec-week-hero-790x527.jpg",
    "https://news.miami.edu/_assets/images-stories/2025/03/foods-that-prevent-cancer-and-heart-disease-hero-790x527.jpg",
    "https://news.miami.edu/_assets/images-stories/2025/03/field-hockey-video-hero-790x527.jpg",
    "https://news.miami.edu/_assets/images-stories/2025/03/greenu-office-program-video-hero-790x527.jpg",
    "https://news.miami.edu/_assets/images-stories/2025/03/st-patricks-day-hero-790x527.jpg",
    "https://news.miami.edu/_assets/images-stories/2025/03/online-trafficking-of-endangered-species-hero-790x527.jpg"
  ];

  var titles = [  
    "Week of Cuban Culture",
    "Foods to fortify ",
    "A winning formula",
    "Championing sustainability",
    "Born in the USA: St. Patrick’s Day",
    "Dangers that lurk beyond the wilds"
  ];

  var summaries = [  
    "The week’s events, organized by the Federación de Estudiantes Cubanos, includes a movie screening of “Hijos de la Diaspora” that explores the lives of the children of Cuban exiles.",
    "Experts in nutrition science from across the University of Miami offer their thoughts on some of the best foods to help us ward off chronic disease.",
    "More than just a team, the University of Miami's Field Hockey Club fosters camaraderie and teamwork through travel, competition, and a shared passion.",
    "The GreenU Office Program champions a commitment to sustainability in the office—reducing waste, conserving energy, and adopting eco-friendly practices. Join the movement.",
    "A University of Miami professor who specializes in Irish culture traces the roots of the popular holiday to Irish émigrés who fled the “Great Hunger” in their homeland to seek a new start in America.",
    "Using a new web crawler they developed, two University of Miami researchers and others conducted an extensive study on the scale and scope of the online trade of endangered species."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyUM"),
        backgroundColor: Colors.deepOrange),
      body: Center(
        child: <Widget>[
          Dashboard(),
          ListView(children: <Widget>[
            customCard(imgs[0], titles[0], summaries[0]),
            customCard(imgs[1], titles[1], summaries[1]),
            customCard(imgs[2], titles[2], summaries[2]),
            customCard(imgs[3], titles[3], summaries[3]),
            customCard(imgs[4], titles[4], summaries[4]),
            customCard(imgs[5], titles[5], summaries[5]),
            
          ]),
          Text("Page $currentIndex"),
          Text("Page $currentIndex"),
        ][currentIndex],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        
        indicatorColor: Colors.green,
        destinations: <Widget>[
        //1st nav 0
        NavigationDestination(
          icon: Icon(Icons.dashboard),
          label: "Dashboard"),
         NavigationDestination(
          icon: Icon(Icons.pages),
          label: "Page 1"),
         NavigationDestination(
          icon: Icon(Icons.alarm),
          label: "Schedule"),
         NavigationDestination(
          icon: Icon(Icons.person),
          label: "Profile"),
      ]),
    );
  }
}

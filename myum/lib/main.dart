import 'package:flutter/material.dart';
import 'dashboard.dart'; 
import 'customCard.dart'; 
import 'gradeCard.dart'; 
import 'schedule.dart'; 


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

  // GRADES PAGE

  var grade = [
    "https://media.istockphoto.com/id/1136966571/vector/grade-a-plus-result-vector-icon-school-red-mark-handwriting-a-plus-in-circle.jpg?s=612x612&w=0&k=20&c=Q3yabkL0MDjAb3LhPCCf1ACqTZhMhGqnYDv2b9Owh1M=",
    "https://media.istockphoto.com/id/1139897799/vector/grade-c-plus-result-vector-icon-school-red-mark-handwriting-c-plus-in-circle.jpg?s=612x612&w=0&k=20&c=2iM_LnNa3xi03NxgqY2Lhyg9A7POCq_dBBtJirpGymo=",
    "https://media.istockphoto.com/id/1138088930/vector/grade-d-plus-result-vector-icon-school-red-mark-handwriting-d-plus-in-circle.jpg?s=612x612&w=0&k=20&c=gskQ6XzoNyWfSAollO7b9APJWlA3_xahlVIlVoxspRM=",
    "https://media.istockphoto.com/id/1136966571/vector/grade-a-plus-result-vector-icon-school-red-mark-handwriting-a-plus-in-circle.jpg?s=612x612&w=0&k=20&c=Q3yabkL0MDjAb3LhPCCf1ACqTZhMhGqnYDv2b9Owh1M=",
    "https://media.istockphoto.com/id/1167956297/vector/vector-b-plus-red-grade-mark.jpg?s=612x612&w=0&k=20&c=fZpjasNpcsJ1QzmX2bkTtAAH480ymyzZkUhkl1DkfiM=",
    "https://media.istockphoto.com/id/1136966571/vector/grade-a-plus-result-vector-icon-school-red-mark-handwriting-a-plus-in-circle.jpg?s=612x612&w=0&k=20&c=Q3yabkL0MDjAb3LhPCCf1ACqTZhMhGqnYDv2b9Owh1M="
  ];

  var classCode = [
    "CIM 413",
    "MTH 162",
    "PHY 222",
    "ARH 131",
    "CSC 220",
    "ENG 106"
  ];

  var className = [
    "Mobile Application Development",
    "Calculus II",
    "University Physics II",
    "Survey of Western Art I",
    "Computer Programming II",
    "Writing About Literature and Culture"
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
            Text("News at the U!",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.deepOrange,
              fontSize: 30
            ) ),
            customCard(imgs[0], titles[0], summaries[0]),
            customCard(imgs[1], titles[1], summaries[1]),
            customCard(imgs[2], titles[2], summaries[2]),
            customCard(imgs[3], titles[3], summaries[3]),
            customCard(imgs[4], titles[4], summaries[4]),
            customCard(imgs[5], titles[5], summaries[5]),
            
          ]),
          ListView(children: <Widget>[
            Text("Your Grades",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.deepOrange,
              fontSize: 30
            ) ),
            gradeCard(grade[0], classCode[0], className[0]),
            gradeCard(grade[1], classCode[1], className[1]),
            gradeCard(grade[2], classCode[2], className[2]),
            gradeCard(grade[3], classCode[3], className[3]),
            gradeCard(grade[4], classCode[4], className[4]),
            gradeCard(grade[5], classCode[5], className[5]),
            
          ]),
          schedule(),
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
          icon: Icon(Icons.newspaper),
          label: "News"),
         NavigationDestination(
          icon: Icon(Icons.grade),
          label: "Grades"),
         NavigationDestination(
          icon: Icon(Icons.alarm),
          label: "Schedule"),
      ]),
    );
  }
}

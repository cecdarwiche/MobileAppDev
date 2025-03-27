import 'package:flutter/material.dart';
import 'dashboard.dart'; 
import 'customCard.dart'; 
import 'gradeCard.dart'; 
import 'schedule.dart'; 
//extrenal libraries
import 'package:http/http.dart' as http;  //performs network requests
import 'package:xml/xml.dart';

// Make a network request (function to fetch data)
Future<String> fetchXML(String url) async{
  final output = await http.get(Uri.parse(url));
  return (output.body); 
}
//https://news.miami.edu/feeds/latest-25.xml'




void main() {
  runApp(const MyUM());
  //print(fetchXML());
  
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


  // var imgs = [  
  //   "https://news.miami.edu/_assets/images-stories/2025/03/fec-week-hero-790x527.jpg",
  //   "https://news.miami.edu/_assets/images-stories/2025/03/foods-that-prevent-cancer-and-heart-disease-hero-790x527.jpg",
  //   "https://news.miami.edu/_assets/images-stories/2025/03/field-hockey-video-hero-790x527.jpg",
  //   "https://news.miami.edu/_assets/images-stories/2025/03/greenu-office-program-video-hero-790x527.jpg",
  //   "https://news.miami.edu/_assets/images-stories/2025/03/st-patricks-day-hero-790x527.jpg",
  //   "https://news.miami.edu/_assets/images-stories/2025/03/online-trafficking-of-endangered-species-hero-790x527.jpg"
  // ];

  // var titles = [  
  //   "Week of Cuban Culture",
  //   "Foods to fortify ",
  //   "A winning formula",
  //   "Championing sustainability",
  //   "Born in the USA: St. Patrick’s Day",
  //   "Dangers that lurk beyond the wilds"
  // ];

  // var summaries = [  
  //   "The week’s events, organized by the Federación de Estudiantes Cubanos, includes a movie screening of “Hijos de la Diaspora” that explores the lives of the children of Cuban exiles.",
  //   "Experts in nutrition science from across the University of Miami offer their thoughts on some of the best foods to help us ward off chronic disease.",
  //   "More than just a team, the University of Miami's Field Hockey Club fosters camaraderie and teamwork through travel, competition, and a shared passion.",
  //   "The GreenU Office Program champions a commitment to sustainability in the office—reducing waste, conserving energy, and adopting eco-friendly practices. Join the movement.",
  //   "A University of Miami professor who specializes in Irish culture traces the roots of the popular holiday to Irish émigrés who fled the “Great Hunger” in their homeland to seek a new start in America.",
  //   "Using a new web crawler they developed, two University of Miami researchers and others conducted an extensive study on the scale and scope of the online trade of endangered species."
  // ];

  // // GRADES PAGE

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

  List<Widget> myNews = [];
  List<Widget> myNews2 = [];
  List<Widget> myNews3 = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchXML('https://news.miami.edu/feeds/latest-25.xml').then((data){//what happens after you have received that output 
      final document = XmlDocument.parse(data); 
      final newsitems = document.findAllElements('newsitem'); 
      newsitems.forEach((newsitem){
        //we access newsitem
        var img = newsitem.getElement('imageSmall')?.innerText;
        print(img); 
        var title = newsitem.getElement('title')?.innerText;
        print(title); 
        var summary = newsitem.getElement('abstract')?.innerText;
        print(summary); 
        //to add items to a list or collection, we use the .add method 
        myNews.add(customCard(img!,title!,summary!)); 
      }); 
      //print(data); 
    }).catchError((error){
      print('error getting data: $error');
    }); 
  

// POPULATE NEWS 2
    fetchXML('https://news.miami.edu/sonhs/feeds/student-stories-feed.xml').then((data){//what happens after you have received that output 
      final document = XmlDocument.parse(data); 
      final newsitems = document.findAllElements('newsitem'); 
      newsitems.forEach((newsitem){
        //we access newsitem
        var img = newsitem.getElement('imageSmall')?.innerText;
        print(img); 
        var title = newsitem.getElement('title')?.innerText;
        print(title); 
        var summary = newsitem.getElement('abstract')?.innerText;
        print(summary); 
        //to add items to a list or collection, we use the .add method 
        myNews2.add(customCard(img!,title!,summary!)); 
      }); 
      //print(data); 
    }).catchError((error){
      print('error getting data: $error');
    }); 
  

  // POPULATE NEWS 3
      fetchXML('https://news.miami.edu/frost/feeds/all-news-15.xml').then((data){//what happens after you have received that output 
      final document = XmlDocument.parse(data); 
      final newsitems = document.findAllElements('newsitem'); 
      newsitems.forEach((newsitem){
        //we access newsitem
        var img = newsitem.getElement('imageSmall')?.innerText;
        print(img); 
        var title = newsitem.getElement('title')?.innerText;
        print(title); 
        var summary = newsitem.getElement('abstract')?.innerText;
        print(summary); 
        //to add items to a list or collection, we use the .add method 
        myNews3.add(customCard(img!,title!,summary!)); 
      }); 
      //print(data); 
    }).catchError((error){
      print('error getting data: $error');
    }); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyUM"),
        backgroundColor: Colors.deepOrange),
      body: Center(
        child: <Widget>[
          Dashboard(),
          ListView(children: myNews),
          ListView(children: myNews2),
          ListView(children: myNews3),
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

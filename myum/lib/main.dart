import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyUM"),
        backgroundColor: Colors.deepOrange),
      body: Center(
        child: <Widget>[
          Text("Dashboard"),
          Text("Page $currentIndex"),
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

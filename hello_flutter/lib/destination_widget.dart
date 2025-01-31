// shortcuts are stless and stful 


import 'package:flutter/material.dart';

class DestinationWidget extends StatelessWidget {
  DestinationWidget({required this.destinationName});
  final String destinationName; 

  @override //what's gonna happen when you run this 
  Widget build(BuildContext context) {
    return Row(children: [
      Image(image: NetworkImage(('https://picsum.photos/30/30'),)),
      Text(destinationName), 
    ]);
  }
}
import 'package:flutter/material.dart';

class gradeCard extends StatefulWidget {
  
  final String img;
  final String title;
  final String summary; 
  const gradeCard(this.img, this.title, this.summary, {super.key});

  @override
  State<gradeCard> createState() => _gradeCardState();
}

class _gradeCardState extends State<gradeCard> {
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Padding(padding: EdgeInsets.all(16),
      child: Image.network( widget.img , width: 80),),

      Expanded(child: 
      Column(children: <Widget>[
          Text(widget.title, 
          textAlign: TextAlign.left, 
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold )),
          Text(widget.summary)
      ] ) 
      ),
    ]);
  }
}
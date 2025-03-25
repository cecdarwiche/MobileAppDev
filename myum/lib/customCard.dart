import 'package:flutter/material.dart';

class customCard extends StatefulWidget {
  
  final String img;
  final String title;
  final String summary; 
  const customCard(this.img, this.title, this.summary, {super.key});

  @override
  State<customCard> createState() => _customCardState();
}

class _customCardState extends State<customCard> {
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Padding(padding: EdgeInsets.all(16),
      child: Image.network( widget.img , width: 100),),

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
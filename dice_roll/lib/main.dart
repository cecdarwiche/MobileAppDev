import 'package:flutter/material.dart';
import 'dart:math'; 

void main() {
  runApp(const DiceRollMain());
}

//MaterialApp Widget
class DiceRollMain extends StatelessWidget {
  const DiceRollMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DiceRoll(), //our scaffold 
    );
  }
}
// End MaterialApp

class DiceRoll extends StatefulWidget {
  const DiceRoll({super.key});

  @override
  State<DiceRoll> createState() => _DiceRollState();
}

class _DiceRollState extends State<DiceRoll> {
  int diceNumber = 1; //default number is one
  int diceNumber2 = 1;
  int totalRolled = 2; 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dice Roll",
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
         )),
        backgroundColor: const Color.fromRGBO(219, 177, 246, 1),
      ), 
      
      body: Center(

        child: Column(children: <Widget>[
          TextButton(
            onPressed: () => setState(() {
              //Random.nextInt(n) returns a random value between 0 and n-1
              diceNumber = Random().nextInt(6) + 1 ;
              totalRolled = diceNumber + diceNumber2; 
              //print(diceNumber); 
            }), 
            child: Image.asset("images/dice-$diceNumber.png", width: 200),
              //Text(“You rolled a: $diceNumber”)
          ),
          TextButton(
            onPressed: () => setState(() {
              //Random.nextInt(n) returns a random value between 0 and n-1
              diceNumber2 = Random().nextInt(6) + 1 ;
              totalRolled = diceNumber + diceNumber2; 
              //print(diceNumber); 
            }), 
            child: Image.asset("images/dice-$diceNumber2.png", width: 200),
              //Text(“You rolled a: $diceNumber”)
          ),
          Text('You rolled a $totalRolled', style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
         )) , 
      ],)
          
  

      
          
         
        )
    );

  }
}
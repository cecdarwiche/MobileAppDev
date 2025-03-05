import 'package:flutter/material.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Quiz()
      
    );
  }
}

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  //class variables
  int groupValue = 2; 
  int currentQuestion = 0;  //current question is used to iterate the array/list
  int score = 0; //keep track of score
  Color resultColor = Colors.black; 

  var questions = ["Machine learning is a subset of artificial intelligence",
                     "All artificial intelligence systems can think and reason like humans",
                      "Artificial intelligence can analyze large amounts of data faster than humans"];
  var answers = [1, 0, 1]; 
  String result = ""; 

  //class methods
  void checkAnswer(int answer){

    print('User answered $answer'); 
    if(answers[currentQuestion] == answer){
      print ("correct"); 
      result = "Correct"; 
      resultColor = Colors.green; 
      score++;
    } else {
      print ("incorrect"); 
      result = "Incorrect"; 
      resultColor = Colors.red; 
    }
    //if answer is true or false set the score and show the result of correct/incorrect 
    //set the groupValue to activate the radio
    setState((){
      groupValue = answer;  
    });
    
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 108, 141, 212),
        title: Text("Artificial Intelligence Quiz",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ))
        ),
        backgroundColor: Color.fromARGB(255, 193, 209, 244),
        body: Padding(
          padding: EdgeInsets.all(36.6),
          child: Column(
            children: <Widget>[
              Text(questions[currentQuestion],
                style: TextStyle(
                  color: Color.fromARGB(255, 87, 122, 196),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,  ),
                  ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  Radio(value: 1, groupValue: groupValue, onChanged: (e)=>{checkAnswer(e!)}),
                  Text("True"),
                  Radio(value: 0, groupValue: groupValue, onChanged: (e)=>{checkAnswer(e!)}),
                  Text("False")
              ],)),
              TextButton(onPressed: ()=>{ setState(() {
                if(currentQuestion < 2){
                  currentQuestion++;
                }else{
                  currentQuestion = 0; 
                }
                groupValue = 2;
                result = "";  
              })}, child: Text("Next",
                      style: TextStyle(
                        color:  Color.fromARGB(255, 87, 122, 196),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                          )),),
              Text(result,
              style: TextStyle(
                color: resultColor,
                fontSize: 20, 
                fontWeight: FontWeight.bold,
              )
              ),
              Text("Score: $score",
              style: TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 87, 122, 196),
              )),
            ],    
          ),),
    );
  }
}
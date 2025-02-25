import 'package:flutter/material.dart';

void main() {
  runApp(const TemperatureConverterMain());
}

//create a new stateless widget
class TemperatureConverterMain extends StatelessWidget {
  const TemperatureConverterMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TemperatureConverter(),
    );

  }
}

class TemperatureConverter extends StatefulWidget {
  const TemperatureConverter({super.key});

  @override
  State<TemperatureConverter> createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
//  all class variables
int groupValue = 0;
double T = 0; // temperature to convert
double R = 0; //converted value
//holds the display text for the last Text widget
String converted = ""; 

//CHALLENGE
double sliderValue = 20.0;
Color sliderColor = Colors.black; 

//custom methods/functions
performConversion(int value){
setState((){
  groupValue = value; 
    // Formulas 
      // C = (F - 32) * (5/9)
      // F = (C * (9/5)) + 32
    // value holds the value of the checked radio button 1 or 2
    if(value == 1){
      //F to C
      R = (T - 32) * (5/9);
      converted = "$R C"; 
    }else if(value == 2){
      //C to F
      R = (T*(9/5)) + 32; 
      converted = "$R F"; 
    }
    print(R);
    moveSlider(value); 
  });
}

//CHALLENGE
moveSlider(int value){
  setState((){
    if(value == 2){
      //ranges for farenheit
      sliderValue = R; 
      if (R <= 32){
        sliderColor = Colors.purple; 
        sliderValue = 2;
      } else if (R > 32 && R <= 52){
        sliderColor = Colors.blue;
        sliderValue = 20;
      }else if (R > 52 && R <= 72){
        sliderColor = Colors.lightGreenAccent;
        sliderValue = 40;
      } else if (R > 72 && R <= 82){
        sliderColor = Colors.yellow;
        sliderValue = 60;
      } else if ( R > 82){
        sliderColor = Colors.red;
        sliderValue = 78;
      }
      
    }else if(value == 1){
      //ranges for celsius
      sliderValue = R; 
      if (R <= 0){
        sliderColor = Colors.purple; 
        sliderValue = 2;
      } else if (R > 0 && R <= 11){
        sliderColor = Colors.blue;
        sliderValue = 20;
      }else if (R > 11 && R <= 22){
        sliderColor = Colors.lightGreenAccent;
        sliderValue = 40;
      } else if (R > 22 && R <= 27){
        sliderColor = Colors.yellow;
        sliderValue = 60;
      } else if ( R > 27){
        sliderColor = Colors.red;
        sliderValue = 78;
      }
    }
  });
}

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Temperature Converter"),
        backgroundColor: Colors.blueAccent, 
      ),
      body: Padding(
        padding: EdgeInsets.all(36.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10.0),
            TextField(
              decoration: InputDecoration(labelText: "Enter Temperature"),
              onChanged: (String value) {
                // later we'll do soemthing with values
                if(value == "" /* blank */){
                  //write something
                }else{
                  T =  double.parse(value); 
                }
              },
              ), 
              SizedBox(height: 10.0),
              Row(
                children: <Widget> [
                  Radio(
                    value: 1, //farenheit to celsius is option 1
                    groupValue: groupValue,
                    onChanged: (e) => {
                      // To do conversion logic
                      performConversion(e!)
                    }),
                    Text('F to C'),
                    SizedBox(height: 10.0,),
                    Radio(
                      value: 2, //farenheit to celsius is option 1
                      groupValue: groupValue,
                      onChanged: (e) => {
                      // To do conversion logic
                      performConversion(e!)
                    }),
                    Text('C to F'),
                    SizedBox(height: 10.0,),
                ]
              ),
              SizedBox(height: 10.0),
              TextButton(
                child: Text('Clear'),
                onPressed: ()=>{
 	                setState((){
     		            //TO DO
                    converted = ""; 
                    groupValue = 0; 
                  }),
                },
              ),
              SizedBox(height: 20.0), 
              Text(converted),
              SizedBox(height: 10.0),
              Slider(
                value: sliderValue,
                onChanged: (dynamic e)=>{
                  //call function in here 
                    
                  sliderValue = e! 
                },
                activeColor: sliderColor, 
                min: 0,
                max: 80.0, // for visual representation if it is less than 0, it will stay at 0 and for more than 100, it will stay at 100
              )
          ],
          )
      ), 
    );
  }
}

//create class variables that change for the color and for the slider
/*
double sliderValue = 20.0;
Color sliderColor = Color.black; 

replace variables you had hard coded with variables 
*/
//Comments 

/* KEY LEARNING POINTS TODAY
Variables and Data Types 
Control Flow (if/else,switch) and Looping 
Functions and Methods 

^^ standards to make everything run and work, to work efficiently you have to add classes 

NOTES:
  - void creates a function which does not return a value 
  - main() is just the name of the function (reserved for dart -- can't call another function main)
  - in the brackets {} is the code to be executed when the function runs

  - VARIABLE DECLARATION:
    - type identifier/name = value 
    - dynamic types 
     
*/
void main() {
  greeting();
  print(addTwo(100));

  int result = addTwo(30);
  print(result); 

//variable declaration;
  var inferredString = "Cecile"; //var assigns the data type to what it is and then can't change
  String explicitString = "Darwiche";
  print(inferredString + " " + explicitString);

  //NULL SAFETY
  int? someNumber; 
  print(someNumber); 
  someNumber = 12; 
  print(someNumber); 

  //late keyword 
  late int willBeNumber; 

  int? goals; 
  //control the flow of the program to avoid error
  if(goals != null){
    print(goals + 2); 
  }else{
    print("goals is null"); 
  }
  
  //BUILT-IN DATA TYPES 
  int age = 21;
  num count = 3;
  double temp = 29.9;
  //Booleans (true or false)
  bool isReady = false; 
  //collections: lists, arrays and maps 
  //Strings for expressing text
  String school = "University of Miami"; 

  //string concatenation using +
  print("My school is " + school);
  //using placeholders to insert variables inside strings
  print("My school is $school");


//BUILT-IN TYPES OPERATIONS
print("my school name has ${school.length} characters");

if(school.length > 20 ){
  print("this name is really long");
}else{
  print("Your school has a short name");
}

/*CONTROL OPERATORS
 > greater than
 < less than
 >= greater than or equal to
 <= less than or equal to
 == equals
 != not equal
 % modulus 


 ARITHMETIC OPERATORS
 + addition
 - subtraction
 * multiplication 
 / division
 % modulus 

 MATH SHORTCUTS
 +=
 -=
 *=
 /=

 ! is the opposite of an expression
 */
 int x = 10;
 x = x+5; //15
 //same as 
 x += 5; //20 

 //!
 bool isHere = false; // !isHere --> will flip value to true 

 //next or combine if statements with || &&
 if(isHere || school.length < 10){
  print("one condition is met");
 }

 if(!isHere && (school.length < 10)){
  print("all conditions are met");
 }

 //while loops
 int counter = 0;
 while (counter < 2){
  print(counter); 
  counter++; 
 }

 //do while
 do{
  print(counter);
  counter++; 
 } while (counter < 20);




}

//Custom functions
void greeting(){
  print("hello");
}

//Operation with options or parameters
int addTwo(int n){
  return n + 2; 
}


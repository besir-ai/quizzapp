import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:quizzapp/Quizzbrain.dart';
import 'question.dart';
import 'Quizzbrain.dart';
import 'Quizzbrain.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        backgroundColor: Colors.white60,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );}
}
class QuizPage extends StatefulWidget {
  const QuizPage({super.key});


  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List <Icon>scoreKeeper=[];


  void checkAnswer(bool userPickedAnswer){
    bool correctAnswer =quizbrain.getCorrectAnswer();
    setState(() {
      if(userPickedAnswer==correctAnswer){
        scoreKeeper.add(Icon(Icons.check,color: Colors.green,));
      }else{
        scoreKeeper.add(Icon(Icons.close,color: Colors.red,));
      }
    });
  }
  // List<String>questions=[
  //   'You can lead a cow down stairs but not up stairs',
  //   'Approxiametly one quarter of human bones are in the feet',
  //   'A slug blood is green',
  // ];
  // List<bool>Answers=[
  //   false,
  //   true,
  //   true,
  // ];
  // Question q1=new Question(q:'You can lead a cow down stairs but not up stairs',a:false);
  // Question q2=new Question(q:'Approxiametly one quarter of human bones are in the feet',a:true);
  // Question q3=new Question(q: 'A slug blood is green',a:true);

  // List<Questionss>questionBank=[
  //   Questionss(false,'You can lead a cow down stairs but not up stairs' ),
  //   Questionss(true, 'Approxiametly one quarter of human bones are in the feet'),
  //   Questionss(true,'A slug blood is green' ),
  // ];
  Quizbrain quizbrain=new Quizbrain();

  int questionNumber=0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Text(

              quizbrain.getQuestionText(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.white,
            ),
            ),
          ),
        ),
        ),

        Expanded(
          child: Padding(
          padding: EdgeInsets.all(30.0),
          child: ElevatedButton(

            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
              ),
                backgroundColor: Colors.red, foregroundColor: Colors.green),
            onPressed: (){
              quizbrain.nextQuestion();
              bool correctAnswer=quizbrain.getCorrectAnswer();
             // bool coreectAnswer=quizbrain.getQuestionText(questionNumber);

              if(correctAnswer==false){
                print('User got it');
              }else{
                print('wrong answer');
              }

              setState(() {
                quizbrain.nextQuestion();
                scoreKeeper.add(Icon(Icons.close,color: Colors.red,));

              });
            },
            child: Text('False',
              style: TextStyle(
              fontSize: 20.0,
              color: Colors.white
            ),
            ),
          ),
        ),
        ),
        Expanded(
            child: Padding(
          padding: EdgeInsets.all(30.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
                backgroundColor: Colors.green, foregroundColor: Colors.blue),

            onPressed: (){
              quizbrain.getQuestionText();
              bool correctAnswer=quizbrain.getCorrectAnswer();

              if(correctAnswer==true){
                print('User got it');
              }else{
                print('wrong answer');
              }


              setState(() {

                quizbrain.nextQuestion();
                scoreKeeper.add(Icon(
                  Icons.check,color: Colors.green,
                ));
              });
            },
            child: Text('True',style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,

            ),
            ),
          ),
          ),
          ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}


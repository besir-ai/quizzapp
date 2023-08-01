import 'question.dart';
class Quizbrain{
  int _questionNumber=0;
  List<Questionss>_questionBank=[
    Questionss(false,'You can lead a cow down stairs but not up stairs' ),
    Questionss(true, 'Approxiametly one quarter of human bones are in the feet'),
    Questionss(true,'A slug blood is green' ),
  ];


  void nextQuestion(){
    if(_questionNumber<_questionBank.length-1){
     _questionNumber++;
    }else{

    }
    print(_questionNumber);
    print(_questionBank.length);
  }
  String getQuestionText(){
    return _questionBank[_questionNumber].questionText;
  }
  bool getCorrectAnswer(){
    return _questionBank[_questionNumber].Questionanswer;
  }
}
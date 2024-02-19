import 'package:flutter/material.dart';

import 'package:quiz_app/answer_button.dart';

import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
 const QuestionsScreen({super.key, required this.onSelectAnswer,}); 

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
  return _QuestionsScreenState(); 
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
var currentQuestionIndex = 0;

void answerQuestion(String selectedAnswers){
  widget.onSelectAnswer('...');
  // currentQuestionIndex = currentQuestionIndex + 1;
  // currentQuestionIndex += 1;
  setState(() {
      currentQuestionIndex++; //increments the value by 1
  });
}

  @override
  Widget build(context) {
    final currentQuestion = question[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
         Text(
          currentQuestion.text, 
        style: const  TextStyle(
          fontSize: 25,
          fontWeight:FontWeight.bold ,
          color: Colors.black,
        ),
        textAlign: TextAlign.center,
        ),
         const  SizedBox(height: 30),
         ...currentQuestion.getShuffledAnswers().map( (answer) {
          return AnswerButton(
            answerText: answer,
             onTap: () {
              answerQuestion(answer);
             },
             );
         })
        ],
        ),
      ),
    );
  }
}
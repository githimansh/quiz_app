// import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget{
const ResultsScreen({
  super.key, 
  required this.chosenAnswers,
  required this.onRestart,
  });

  final void Function() onRestart;
final List<String> chosenAnswers;

List<Map<String, Object>>getSummaryData () {
  final List<Map<String, Object>> summary = [];

  for(var i = 0; i < chosenAnswers.length; i++){
    summary.add({
      'question_index': i,
      'question': question[i].text,
      'correct_answer': question[i].answers[0],
      'user_answer': chosenAnswers[i],
    },
    );
  }

  return summary;
}

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
   final numTotalQuestion = question.length;
   final numCOrrectQuestions = summaryData
   .where(
    (data) => data['user_answer'] == data['correct_answer'],
   ).length;

    return  SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40), 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Text(
              'You answered $numCOrrectQuestions out of $numTotalQuestion questions correctly!',),
           const SizedBox(height: 30,),
           QuestionsSummary(summaryData),
            const SizedBox(height: 30,),
            TextButton(
              onPressed: () {}, 
              child: const Text('Restart Quiz!'),
              )

          ],
          ),
         ),
       );
  }
}
import 'package:firebase_quizapp/quiz/quiz_state.dart';
import 'package:firebase_quizapp/services/firestore.dart';
import 'package:firebase_quizapp/services/models.dart';
import 'package:firebase_quizapp/shared/loading.dart';
import 'package:firebase_quizapp/shared/progress_bar.dart';
import 'package:firebase_quizapp/topics/topics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizScreen extends StatelessWidget {
  final String quizId;
  const QuizScreen({super.key, required this.quizId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=> QuizState(),
      child: FutureBuilder<Quiz>(
        future: FirestoreService().getQuiz(quizId),
        builder: (context, snapshot) {
          var state = Provider.of<QuizState>(context);
          if (!snapshot.hasData || snapshot.hasError) {
            return Loader();
          } else {
            var quiz = snapshot.data!;
            return Scaffold(
              appBar: AppBar(
                title: AnimatedProgressbar(value: state.progress),
                leading: IconButton(
                  onPressed: ()=> Navigator.pop(context), 
                  icon: Icon(Icons.clear,)
                ),
              ),
              body: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                controller: state.controller,
                onPageChanged: (int idx) => state.progress =(idx/ (quiz.questions.length)+1),
                itemBuilder: (BuildContext context, int idx) {
                  if (idx == 0) {
                    return StartPage(quiz: quiz);
                  } else if (idx == quiz.questions.length +1){
                    return CongratsPage(quiz:quiz);
                  } else {
                    return QuestionPage(question: quiz.questions[idx -1]);
                  }
                }
              ),
            );
          }
        },
      ) ,
    );
      
  }
}
class StartPage extends StatelessWidget {
  final Quiz quiz;
  const StartPage({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<QuizState>(context);

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(quiz.title, style: Theme.of(context).textTheme.headline4),
          const Divider(),
          Expanded(child: Text(quiz.description)),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton.icon(
                onPressed: state.nextPage, 
                icon: Icon(Icons.bar_chart), 
                label: const Text('Start quiz')
              )


            ],

          )
        ],

      ),
    );
  }
}
class CongratsPage extends StatelessWidget {
  final Quiz quiz;
  const CongratsPage({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Epic move! you completed ${quiz.title} quiz', textAlign: TextAlign.center),
          const Divider(),
          Image.asset('assets/congrats.gif'),
          const Divider(),
          ElevatedButton.icon(
            icon: Icon(Icons.check),
            label: Text('Mark complete'),
            onPressed: () {
              FirestoreService().updateUserReport(quiz);
              Navigator.pushNamedAndRemoveUntil(context, '/topics', (route) => false);
            },
          )

        ],
      ),
    );
  }
}
class QuestionPage extends StatelessWidget {
  final Question question;
  const QuestionPage({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
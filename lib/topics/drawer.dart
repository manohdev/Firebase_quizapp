import 'package:firebase_quizapp/quiz/quiz.dart';
import 'package:firebase_quizapp/services/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopicsDrawer extends StatelessWidget {
  final List<Topic> topics;
  const TopicsDrawer({super.key, required this.topics});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: topics.length,
        separatorBuilder: (BuildContext context, int idx) => const Divider(),
        itemBuilder: (BuildContext context, int idx) {
          Topic topic = topics[idx];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Text(
                  topic.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color:Colors.white
                  ),
                ),
              ),
              QuizList(topic: topic)
            ],
          );
        }
      ),
    );
  }
}

class QuizList extends StatelessWidget {
  final Topic topic;
  const QuizList({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: topic.quizzes.map(
        (quiz) {
          return Card(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            margin: const EdgeInsets.all(4),
            elevation: 4,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> QuizScreen(quizId: quiz.id)));

              },
              child: Container(
                padding: const EdgeInsets.all(8),
                child: ListTile(
                  leading: QuizBadge(quizId: quiz.id, topic: topic),
                  title: Text(
                    quiz.title,
                    style: Theme.of(context).textTheme.headline5
                  ),
                  subtitle: Text(
                    quiz.description,
                    overflow: TextOverflow.fade,
                    style: Theme.of(context).textTheme.subtitle2,
                  )
                ),
              ),
            )
          );
        }
      ).toList()
    );
  }
}
class QuizBadge extends StatelessWidget {
  final String quizId;
  final Topic topic;
  const QuizBadge({super.key, required this.quizId, required this.topic});

  @override
  Widget build(BuildContext context) {
    Report report = Provider.of<Report>(context);
    List completed = report.topics[topic.id] ?? [];
    if (completed.contains(quizId)) {
      return const Icon(Icons.done_outline, color: Colors.yellow);
    } else {
      return const Icon(Icons.circle, color: Colors.white70);
    }
    
  }
}
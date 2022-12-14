import 'package:firebase_quizapp/shared/progress_bar.dart';
import 'package:firebase_quizapp/topics/drawer.dart';
import 'package:flutter/material.dart';
import 'package:firebase_quizapp/services/models.dart';


class TopicItem extends StatelessWidget {
  final Topic topic;
  const TopicItem({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: topic.img,
      child: Card(
        elevation: 10,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
        color: Color.fromARGB(255, 117, 34, 110),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => TopicScreen(topic: topic),
              )
            );
          },
          child: Column(
            
            children: [
              Flexible(
                flex: 3,
                child: SizedBox(
                  child: Image.asset('assets/covers/${topic.img}', fit: BoxFit.contain,),
                )
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right:10),
                  child: Text(
                    topic.title,
                    style: const TextStyle(height: 1.5, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.fade,
                    softWrap: false,
                  )
                ),
              ),
              Flexible(
              child: TopicProgress(topic: topic)
              )
            ],
          )

        ),
      )
    );
  }
}

class TopicScreen extends StatelessWidget {
  final Topic topic;
  const TopicScreen({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Topic'),backgroundColor: Colors.deepPurple,),
      body: Container(
        decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurple, Color.fromARGB(255, 148, 35, 72)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
          )
        ),
        child: ListView(
          children: [
            Hero(

              tag: topic.img, 
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.15),
                      spreadRadius: 10,
                      blurRadius: 7,
                      offset: Offset(0, 10), // changes position of shadow
                    ),
                  ],),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image.asset(
                    'assets/covers/${topic.img}',
                    width: MediaQuery.of(context).size.width
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                topic.title, 
                style: const TextStyle(height: 2.0, fontSize: 30, fontWeight: FontWeight.bold),),
            ),
            // show list of each topic
            QuizList(topic: topic)
          ],
        ),
      ),


    );
  }
}








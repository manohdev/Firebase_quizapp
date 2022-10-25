import 'package:firebase_quizapp/services/firestore.dart';
import 'package:firebase_quizapp/services/models.dart';
import 'package:firebase_quizapp/shared/bottom_nav.dart';
import 'package:firebase_quizapp/shared/error.dart';
import 'package:firebase_quizapp/shared/loading.dart';
import 'package:firebase_quizapp/topics/drawer.dart';
import 'package:firebase_quizapp/topics/topic_item.dart';
import 'package:flutter/material.dart';

class  TopicsScreen extends StatelessWidget {
  const TopicsScreen ({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Topic>>(
      future: FirestoreService().getTopics(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else if (snapshot.hasError) {
          return Center(child: ErrorMessage(message: snapshot.error.toString(),));
        } else if (snapshot.hasData) {

          var topics = snapshot.data!;

          return Scaffold(
            drawer: TopicsDrawer(topics: topics),
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              title: const Text('Topics'),
            ),
            body: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20.0),
              crossAxisSpacing: 10.0,
              crossAxisCount: 2,
              children: topics.map((topic)=> TopicItem(topic: topic)).toList(),
            ),

            bottomNavigationBar: const BottomNavBar()
          );
        } else {
          return const Text('No topics found in database, check firestore');
        }
      },
    );
  }
}
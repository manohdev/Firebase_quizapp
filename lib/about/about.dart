
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({ Key? key }) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri(scheme: "https", host: url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication
    )) {
      throw 'unable to launch url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About app'), backgroundColor: Colors.deepPurple,elevation: 50),
      body: Container(
        decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurple, Color.fromARGB(255, 148, 35, 72)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
          )
        ),

        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: <Widget>[
                
                Container(child: Image.asset('assets/applogo.png',height: 300,),alignment: Alignment.center),
                const Text('Source code of this app from github:'),
                Container(
                  
                  alignment: Alignment.topRight,
                  child: ElevatedButton.icon(
                    
                    onPressed: () {
                      _launchURL("https://github.com/Manohar29m29/Firebase_quizapp");
                    }, 
                    icon: Icon(Icons.code_sharp), 
                    label: Text('Source code')),
                ),
                const Text("This app was made in the process of ME, learning flutter"),
                const Text(''),
                const Text("I have learned a lot of things which i have implemented in this app:", style: TextStyle(fontWeight: FontWeight.bold),),
                const Text('Scroll below'),
                const Text(''),
                const Text('''
-signup, email-pass login, google login, guest login 
-list of topics with images to choose, same for side drawer , list of ALL topics to choose
-smooth animation when you click at any topic
-select the sub topic from the topic - a seperate page
-quiz page - 
-cancel quiz option if you change your mind,
-beautiful animated progress bar when answring quiz at the top
-start quiz, question displayed with 3 options to select,
-get wrong answer text in bottom sheet when selected wrong ans, 
-get correct ans and pass on to next question, 
-display score and congrats gif , and mark done option for the quiz
-progress info is displayed with the bar(reused widget) below each quiz topic in topics screen
-info screen to show about myself and about app
-profile screen displaying email and score, with a button to logout of the app
There could be some things that i may have forgot list here
                    '''
                )

          
              ],
            ),
          ),
        ),
      ),
    );
  }
}
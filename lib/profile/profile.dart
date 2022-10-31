import 'package:firebase_quizapp/services/auth.dart';
import 'package:firebase_quizapp/services/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class  ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var report = Provider.of<Report>(context);
    var user = AuthService().user;
    
    // profile pics strings
    String accountP = user?.photoURL ?? ''; // Network image
    String guestP = 'assets/user.png'; // Assets image
    
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: accountP != '' ? NetworkImage(accountP) : AssetImage(guestP) as ImageProvider
                      )
                    ),
                  ),

                  Text(user!.email ?? ''),
                
                  Text('${report.total}'),
                  const Text('Quizzes Completed')
                ],
              ),
            ),

            ElevatedButton(
              child: const Text('Sign Out'),
              onPressed: () async {
                await AuthService().signOut();
                Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
              },
            ),
          ],
        ),
      ),
      
    );
  }
}
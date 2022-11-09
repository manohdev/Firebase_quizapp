// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_quizapp/login/loginbutton.dart';
import 'package:firebase_quizapp/login/signup.dart';
import 'package:firebase_quizapp/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class  LoginScreen extends StatefulWidget {
  final VoidCallback showSignupScreen;
  LoginScreen({ Key? key, required this.showSignupScreen }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  void loginUser() async {
    AuthService().emailLogin(
      email: emailController.text,
      password: passwordController.text
    );
  }

  final formKey = GlobalKey<FormState>();

  // email validator 
  String validateEmail(String? x) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (x == null || x.isEmpty || !regex.hasMatch(x))
      return 'invalid';
    else
      return 'valid';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Color.fromARGB(255, 148, 35, 72)],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter
            )
          ),
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/applogo.png',height: 170,),
              SizedBox(height: 50,),
              Text('Login', style: Theme.of(context).textTheme.headline1),
              Text('Please login to your existing account to continue'),
              Form(
                key: formKey,
                child: Column(
                  
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50,),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Email'),
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if(value == null || value.isEmpty || validateEmail(value) == 'invalid'){
                          return 'Please enter valid email!';
                        }
                        return null;
                      },

                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(hintText: 'Password'),
                      controller: passwordController,
                      validator: (value) {
                        if(value == null || value.isEmpty || value.length < 8){
                          return 'Please enter password!';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30,),
                    ElevatedButton(
                      onPressed: () {
                        loginUser();
                        final isValidForm = formKey.currentState!.validate();
                        if (isValidForm){
                          Navigator.pushNamed(context, '/topics')
;
                        }
                      }, 
                      child: const Text('Login')
                    )
                  ],
                ),
              ),
              SizedBox(height: 40,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    onTap: widget.showSignupScreen,
                    child: const Text('New user? Sign up', style: TextStyle(color: Colors.white))
                    
                  ),
                  LoginButton(
                    icon: FontAwesomeIcons.google,
                    text: 'Login with google',
                    loginmethod: AuthService().googleLogin,
                    color: Colors.deepPurple,
                  ),
      
                  LoginButton(
                    icon: FontAwesomeIcons.userNinja,
                    text: 'Continue as guest',
                    loginmethod: AuthService().anonLogin,
                    color: Colors.deepPurple,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


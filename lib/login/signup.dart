
import 'package:firebase_quizapp/login/loginbutton.dart';
import 'package:firebase_quizapp/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignupScreen extends StatefulWidget {
  final VoidCallback showLoginScreen;
  SignupScreen ({super.key, required this.showLoginScreen});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  void signUpUser() async {
    AuthService().emailSignup(
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
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
            )
          ),
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/applogo.png',height: 170,),
              const SizedBox(height: 50,),
              Text('Sign up', style: Theme.of(context).textTheme.headline1),
              const Text('Please sign up and create account to continue'),
              Form(
                key: formKey,
                child: Column(
                  
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50,),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Email'),
                      controller: emailController,
                      validator: (value) {
                        if(value == null || value.isEmpty || validateEmail(value)=='invalid'){
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
                        signUpUser();
                        final isValidForm = formKey.currentState!.validate();
                        if (isValidForm){
                          Navigator.pushNamed(context, '/login');
                        }
                      }, 
                      child: const Text('Sign up')
                    )
                  ],
                ),
              ),
              const SizedBox(height: 40,),
              
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    onTap: widget.showLoginScreen,
                    child: const Text('Have account? Login')
                  ),
                  LoginButton(
                    icon: FontAwesomeIcons.google,
                    text: 'Signup with google',
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

/////
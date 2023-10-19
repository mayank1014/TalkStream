import 'package:flutter/material.dart';
import 'package:talkstream/resources/auth_methods.dart';
import 'package:talkstream/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to TalkStream',style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 48.0),
                child: Image.asset('assets/images/onboarding.jpg')),
            CustomButton(text :'Google Sign-in',onpressed: () async {
              bool res=await _authMethods.SigninWithGoogle(context);
              if(res){
                Navigator.pushNamed(context, '/home');
              }
            }),
          ],
        ),
      ),
    );
  }
}

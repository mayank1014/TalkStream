import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:talkstream/resources/auth_methods.dart';
import 'package:talkstream/screens/home_screen.dart';
import 'package:talkstream/screens/login_screen.dart';
import 'package:talkstream/screens/video_call_screen.dart';
import 'package:talkstream/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'talkstream',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor:bacgroundColor,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
      routes: {
        '/login' : (context)=> LoginScreen(),
        '/home' : (context)=> HomeScreen(),
        '/video-call': (context) => VideoCallScreen(),
      },
      home: StreamBuilder(
        stream: AuthMethods().authChanges,
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(
              child:CircularProgressIndicator(),
            );
          }
          if(snapshot.hasData){
            return const HomeScreen();
          }
          return const LoginScreen();
        },
      ),
    );
  }
}

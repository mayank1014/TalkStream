import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:talkstream/utils/utils.dart';

class AuthMethods{
  // await Firebase.initializeApp();
  final FirebaseAuth _auth= FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<User?> get authChanges => _auth.authStateChanges();
  User get user => _auth.currentUser!;

  Future<bool> SigninWithGoogle(BuildContext context) async{
    bool res=false;
    // await Firebase.initializeApp();
    try{

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential = await _auth.signInWithCredential(credential);
      User? user=userCredential.user;
      if(user!=null){
        if(userCredential.additionalUserInfo!.isNewUser){
          await _firestore.collection('users').doc(user.uid).set({
            'username':user.displayName,
            'uid':user.uid,
            'email':user.email,
            'profilePhoto':user.photoURL,
          });
        }
        res=true;
      }

    }on FirebaseAuthException catch(e){
      showSnackBar(context, e.message!);
      res=false;
    }
    return res;
  }

  void signOut() async {
    try {
      _auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}



//---------------------

// import 'package:flutter/cupertino.dart';
// import 'auth_methods.dart';
// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:flutter/material.dart';
// // import 'package:permission_handler/permission_handler.dart';
//
// class JitsiMeetMethods{
//
//   final AuthMethods _authMethods= AuthMethods();
//   late RtcEngine _engine;
//   int? _remoteUid;
//   bool _localUserJoined = false;
//   void createMeeting(
//       {
//         required String roomName,
//         required bool isAudioMuted,
//         required bool isVideoMuted,
//         // String username = '',
//       }) async{
//
//     try {
//       // await [Permission.microphone, Permission.camera].request();
//
//       //create the engine
//       RtcEngine _engine = createAgoraRtcEngine();
//       await _engine.initialize(const RtcEngineContext(
//         appId: "db02dbab0f88422c8b0bebfa3b3e4a9a",
//         channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
//       ));
//
//       _engine.registerEventHandler(
//         RtcEngineEventHandler(
//           onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
//             debugPrint("local user ${connection.localUid} joined");
//             // setState(() {
//             //   _localUserJoined = true;
//             // });
//           },
//           onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
//             debugPrint("remote user $remoteUid joined");
//             // setState(() {
//             //   _remoteUid = remoteUid;
//             // });
//           },
//           onUserOffline: (RtcConnection connection, int remoteUid, UserOfflineReasonType reason) {
//             debugPrint("remote user $remoteUid left channel");
//             // setState(() {
//             //   _remoteUid = null;
//             // });
//           },
//           onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
//             debugPrint('[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
//           },
//         ),
//       );
//
//       await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
//       await _engine.enableVideo();
//       await _engine.startPreview();
//
//       await _engine.joinChannel(
//         token: "db02dbab0f88422c8b0bebfa3b3e4a9a",
//         channelId: roomName,
//         uid: 0,
//         options: const ChannelMediaOptions(),
//       );
//     } catch (error) {
//       print("error: $error");
//     }
//
//   }
// }


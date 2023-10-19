// import 'package:flutter/cupertino.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'auth_methods.dart';
import 'firestore_methods.dart';

class JitsiMeetMethods{

  final AuthMethods _authMethods= AuthMethods();
  final FirestoreMethods _firestoreMethods = FirestoreMethods();
  void createMeeting(
      {
        required String roomName,
        required bool isAudioMuted,
        required bool isVideoMuted,
        String username = '',
      }) async{

    try {
      // x.FeatureFlag featureFlag = x.FeatureFlag();
      // featureFlag.resolution = x.FeatureFlagVideoResolution.MD_RESOLUTION; // Limit video resolution to 360p
      var jitsimeet=JitsiMeet();
      Map<String, Object> featureFlags = {
        // "FeatureFlag.isWelcomePageEnabled":false,
        // FeatureFlag.resolution,
      } ;
      String name;
      if (username.isEmpty) {
        name = _authMethods.user.displayName!;
      } else {
        name = username;
      }
      final options = JitsiMeetConferenceOptions(
          room:roomName,
          serverURL: "https://meet.mayfirst.org/",
          featureFlags: featureFlags,
          configOverrides: {
            "startWithAudioMuted": false,
            "startWithVideoMuted": false,
            "subject" : "TalkStream",
          },
        userInfo: JitsiMeetUserInfo(
            displayName: name,
            email:  _authMethods.user.email,
            avatar: _authMethods.user.photoURL,
        ),
      );
      // JitsiMeetingOptions(t)
      // await JitsiMeet.joinMeeting(options)

      _firestoreMethods.addToMeetingHistory(roomName);
      await jitsimeet.join(options);
    } catch (error) {
      print("error: $error");
    }

  }
}


//-----------------------------------------------










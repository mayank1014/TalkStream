import 'package:flutter/material.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:talkstream/resources/auth_methods.dart';
import 'package:talkstream/resources/jitsi_meet_methods.dart';
import 'package:talkstream/utils/colors.dart';
import 'package:talkstream/widgets/custom_button.dart';

import '../widgets/meeting_option.dart';

// class VideoCallScreen extends StatefulWidget {
//   const VideoCallScreen({Key? key}) : super(key: key);
//
//   @override
//   State<VideoCallScreen> createState() => _VideoCallScreenState();
// }
//
// class _VideoCallScreenState extends State<VideoCallScreen> {
//
// }


class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AuthMethods _authMethods = AuthMethods();
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  late TextEditingController meetingIdController;
  late TextEditingController nameController;

  bool isAudioMuted = true;
  bool isVideoMuted = true;


  @override
  void initState() {
    meetingIdController = TextEditingController();
    nameController = TextEditingController(text: _authMethods.user.displayName);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    meetingIdController.dispose();
    nameController.dispose();
  }

  _joinMeeting() {
    // _jitsiMeetMethods().createMeeting(
    //   roomName: meetingIdController.text,
    //   isAudioMuted: isAudioMuted,
    //   isVideoMuted: isVideoMuted,
    //   username: nameController.text,
    // );
    _jitsiMeetMethods.createMeeting(roomName: meetingIdController.text, isAudioMuted: isAudioMuted, isVideoMuted: isVideoMuted);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bacgroundColor,
        title: const Text(
          'Join Meeting',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
            child: Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(30),

              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,

                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                      child: TextField(
                        controller: meetingIdController,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          // fillColor: secondaryBacgroundColor,
                          // filled: true,
                          // border: UnderlineInputBorder(borderSide: BorderSide(width: 3,color: Colors.red,style: BorderStyle.solid)),
                          hintText: 'Room ID',
                          contentPadding: EdgeInsets.fromLTRB(5, 8, 5, 0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                      child: TextField(
                        controller: nameController,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          // fillColor: secondaryBacgroundColor,

                          hintText: 'Name',
                          contentPadding: EdgeInsets.fromLTRB(5, 8, 5, 0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  MeetingOption(
                    text: 'Mute Audio',
                    isMute: isAudioMuted,
                    onChange: onAudioMuted,
                  ),

                  MeetingOption(
                    text: 'Turn off My video',
                    isMute: isVideoMuted,
                    onChange: onVideoMuted,
                  ),
                ],
              ),
            ),
          ),

          InkWell(
            // onTap: _joinMeeting,
            child: Padding(
              padding: EdgeInsets.fromLTRB(90, 5, 90, 0),
              child: CustomButton(text: "Join", onpressed: _joinMeeting),
            ),
          ),
        ],

      ),
      backgroundColor: bacgroundColor,
    );
  }

  onAudioMuted(bool? value) {
    setState(() {
      isAudioMuted = value!;
    });
  }

  onVideoMuted(bool? value) {
    setState(() {
      isVideoMuted = value!;
    });
  }
}

import 'package:flutter/material.dart';
import 'package:talkstream/resources/auth_methods.dart';
import 'package:talkstream/screens/history_meeting_screen.dart';
import 'package:talkstream/utils/colors.dart';
import 'package:talkstream/widgets/custom_button.dart';
import 'package:talkstream/widgets/meeting_button.dart';
import 'package:talkstream/screens/meeting_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final AuthMethods _authMethods=AuthMethods();
  int _page=0;
  onpageChanged(int page){
    setState(() {
      _page=page;
    });
  }
  List<Widget> pages = [
    // MeetingScreen(),
     MeetingScreen(),
    HistoryMeetingScreen(),
    CustomButton(text: 'LogOut', onpressed:() => AuthMethods().signOut())
    // CustomButton(text: 'Log Out', onPressed: () => AuthMethods().signOut()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: bacgroundColor,
        leading: null,
        title: const Text("Talk Stream"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: pages[_page],
      ),
          backgroundColor: bacgroundColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: bacgroundColor/*footerColor*/,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          onTap: onpageChanged,
          currentIndex: _page,
          type: BottomNavigationBarType.fixed,
          unselectedFontSize: 12,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.comment_bank,),label:"Meet & chat"),
            BottomNavigationBarItem(icon: Icon(Icons.lock_clock,),label:"Meeting"),
            BottomNavigationBarItem(icon: Icon(Icons.settings_outlined,),label:"Settings"),
          ],
        ),
      ),
    );
  }
}
//
// class HistoryMeeting extends StatelessWidget {
//   const HistoryMeeting({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             MeetingButton(
//               onPressed: (){},
//               icon: Icons.videocam,
//               text: "new meeting",
//             ),
//             MeetingButton(
//               onPressed: (){},
//               text: "Join Meeting",
//               icon: Icons.add_box_rounded,
//             ),
//             MeetingButton(
//               onPressed: (){},
//               text: "Share Screen",
//               icon: Icons.arrow_upward_rounded,
//             ),
//           ],
//         ),
//         const Expanded(
//             child: Center(
//               child: Text(
//                 'create or Join with just a click',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 25,
//                 ),
//               ),
//             )
//         )
//       ],
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talkstream/utils/colors.dart';
//
// class MeetingOption extends StatelessWidget {
//   final String text;
//   final bool isMute;
//   final Function(bool) onChange;
//   const MeetingOption({
//     Key? key,
//     required this.text,
//     required this.isMute,
//     required this.onChange,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

class MeetingOption extends StatelessWidget {
  final String text;
  final bool isMute;
  final Function(bool) onChange;
  const MeetingOption({super.key,required this.text,required this.isMute,required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
      child: Container(
        height: 55,
        // decoration: Decora
        child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                text,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            // Switch.adaptive(value: isMute, onChanged: onChange)
            CupertinoSwitch(value: isMute, onChanged: onChange,),
          ],
        ),
      ),
    );;
  }
}

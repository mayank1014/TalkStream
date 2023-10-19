import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:talkstream/utils/colors.dart';
import '../resources/firestore_methods.dart';
class HistoryMeetingScreen extends StatelessWidget {
  const HistoryMeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final f = new DateFormat(' hh:mm  on  dd-MMM-yy ');
    return StreamBuilder(
      stream: FirestoreMethods().meetingsHistory,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          itemCount: (snapshot.data! as dynamic).docs.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(25),
              ),
              child: ListTile(
                title: Text(
                  'Room Name: ${(snapshot.data! as dynamic).docs[index]['meetingName']}',
                ),
                subtitle: Text(
                  'Joined at ${f.format((snapshot.data! as dynamic).docs[index]['createdAt'].toDate())}',
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

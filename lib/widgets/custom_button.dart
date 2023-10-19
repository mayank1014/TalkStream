import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;
  const CustomButton({super.key,required this.text,required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton(
          onPressed: onpressed,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 17,
            ),
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              minimumSize: const Size(double.infinity,50),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
            side: const BorderSide(color: Colors.deepPurple)
          ),
      ),
    );
  }
}

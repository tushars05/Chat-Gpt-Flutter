import 'package:flutter/material.dart';
import '/app/model/text_data.dart';

class MyTextCard extends StatelessWidget {
  final TextData textData;

  const MyTextCard({Key? key, required this.textData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(12.0),
      alignment: Alignment.centerRight,
      child: Text(
        textData.message,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
// TODO Implement this library.
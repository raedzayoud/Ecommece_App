import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
      ),
       body: Container(
        child: ListView(
          children: [
            Text("Message")
          ],
        ),
       ),
    );
  }
}
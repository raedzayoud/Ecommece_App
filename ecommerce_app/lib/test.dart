import 'package:ecommerce_app/core/class/accesstoken.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  String? accessToken;

  @override
  void initState() {
    super.initState();
    getAccessToken();
  }

  void getAccessToken() async {
    AccessTokenFirebase accessTokenFirebase = AccessTokenFirebase();

    try {
      String token = await accessTokenFirebase.getAccessToken();
      setState(() {
        accessToken = token; // Update the accessToken state
      });
      print(token);
    } catch (e) {
      setState(() {
        accessToken = "Error fetching token"; // Handle the error
      });
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Firebase Access Token:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(accessToken ?? "Fetching token..."),
          ],
        ),
      ),
    );
  }
}

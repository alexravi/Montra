import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:track/Screens/signin.dart';
import '../widgets/bottomnavigationbar.dart';

class Launch extends StatefulWidget {
  Launch({Key? key}) : super(key: key);

  @override
  State<Launch> createState() => _LaunchState();
}

class _LaunchState extends State<Launch> {
  String username = ''; // Variable to hold the username or display name

  @override
  void initState() {
    super.initState();
    navigate();
  }

  navigate() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});

    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      // User is already signed in, navigate to the homepage or desired screen
      setState(() {
        username = auth.currentUser!.displayName ?? ''; // Get the display name or username
      });
      Navigator.pushReplacement(
        context as BuildContext,
        MaterialPageRoute(builder: (context) => Bottom()), // Replace `Bottom` with your homepage screen
      );
    } else {
      // User is not signed in, navigate to the sign-in screen
      Navigator.pushReplacement(
        context as BuildContext,
        MaterialPageRoute(builder: (context) => SignInScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF843CFC),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/Screenshot 2023-06-20 at 5.43.34 PM.jpg'),
            const SizedBox(height: 20),
            Text(
              username,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

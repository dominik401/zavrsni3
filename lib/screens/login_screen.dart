import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';
import 'worker/worker_home_screen.dart';
import 'admin/admin_home_screen.dart'; // Import AdminHomeScreen

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String feedbackMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (usernameController.text == 'admin' && passwordController.text == 'admin') {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => AdminHomeScreen()),
                    (Route<dynamic> route) => false,
                  );
                } else {
                  User? user = await loginWorker(usernameController.text, passwordController.text);
                  if (user != null) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WorkerHomeScreen(), // Change to appropriate page
                      ),
                      (Route<dynamic> route) => false,
                    );
                  } else {
                    setState(() {
                      feedbackMessage = 'Invalid login credentials';
                    });
                  }
                }
              },
              child: Text('Login'),
            ),
            SizedBox(height: 20),
            Text(feedbackMessage),
          ],
        ),
      ),
    );
  }
}

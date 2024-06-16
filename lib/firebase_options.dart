import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';



const FirebaseOptions firebaseOptions = FirebaseOptions (
  apiKey: "AIzaSyA0EDMNS3uJaSGHu0knFDcntiK4l58yDeE",
  authDomain: "rdma-2c4b9.firebaseapp.com",
  projectId: "rdma-2c4b9",
  storageBucket: "rdma-2c4b9.appspot.com",
  messagingSenderId: "75681910070",
  appId: "1:75681910070:web:7208787b37957994bbb797",
  measurementId: "G-1M7CKRS2HX"
);


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: firebaseOptions,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee Management App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

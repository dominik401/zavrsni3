import 'package:flutter/material.dart';
import '../../screens/login_screen.dart';
import 'log_hours_screen.dart';
import 'upload_contract_screen.dart';

class WorkerHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // Disable Android back button
      child: Scaffold(
        appBar: AppBar(
          title: Text('Worker Home'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UploadContractScreen()),
                  );
                },
                child: Text('Upload Contract'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogHoursScreen()),
                  );
                },
                child: Text('Log Hours'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (route) => false, // Remove all routes below LoginScreen
                  );
                },
                child: Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

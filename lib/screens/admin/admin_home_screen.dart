import 'package:flutter/material.dart';
import '../admin/view_employees_screen.dart';
import '../admin/add_employee_screen.dart';
import 'package:employee_management_app/screens/login_screen.dart';

class AdminHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // Disable Android back button
      child: Scaffold(
        appBar: AppBar(
          title: Text('Admin Home'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddEmployeeScreen()),
                  );
                },
                child: Text('Add Employee'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ViewEmployeesScreen()),
                  );
                },
                child: Text('View Employees'),
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

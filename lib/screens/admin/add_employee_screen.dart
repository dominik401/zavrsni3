import 'package:flutter/material.dart';
import '../../services/auth_service.dart'; 
import '../../services/database_service.dart';

class AddEmployeeScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController oibController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final DatabaseService dbService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Employee'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: surnameController,
              decoration: InputDecoration(labelText: 'Surname'),
            ),
            TextField(
              controller: oibController,
              decoration: InputDecoration(labelText: 'OIB'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: positionController,
              decoration: InputDecoration(labelText: 'Position'),
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Worker Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Worker Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Register worker
                await registerWorker(usernameController.text, passwordController.text);
                
                // Add employee to database
                await dbService.addUser({
                  'name': nameController.text,
                  'surname': surnameController.text,
                  'oib': oibController.text,
                  'position': positionController.text,
                  'username': usernameController.text,
                  'password': passwordController.text, // Store password securely
                });

                // Clear the text fields
                nameController.clear();
                surnameController.clear();
                oibController.clear();
                positionController.clear();
                usernameController.clear();
                passwordController.clear();

                // Provide feedback or navigate back
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Employee added successfully')),
                );
              },
              child: Text('Create Worker'),
            ),
          ],
        ),
      ),
    );
  }
}



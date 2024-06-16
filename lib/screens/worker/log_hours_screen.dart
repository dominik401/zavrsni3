import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../services/database_service.dart';

class LogHoursScreen extends StatefulWidget {
  @override
  _LogHoursScreenState createState() => _LogHoursScreenState();
}

class _LogHoursScreenState extends State<LogHoursScreen> {
  final DatabaseService dbService = DatabaseService();
  final TextEditingController hoursController = TextEditingController();
  final TextEditingController minutesController = TextEditingController();
  final TextEditingController employeeIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log Hours'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: employeeIdController,
              decoration: InputDecoration(labelText: 'Employee ID'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: hoursController,
              decoration: InputDecoration(labelText: 'Hours worked'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: minutesController,
              decoration: InputDecoration(labelText: 'Minutes worked'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final hours = int.parse(hoursController.text);
                final minutes = int.parse(minutesController.text);
                final employeeId = employeeIdController.text;

                // Log hours in Firestore
                await dbService.updateUser(employeeId, {
                  'hours_worked': FieldValue.increment(hours),
                  'minutes_worked': FieldValue.increment(minutes),
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Hours logged successfully')),
                );

                // Clear the text fields
                employeeIdController.clear();
                hoursController.clear();
                minutesController.clear();
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

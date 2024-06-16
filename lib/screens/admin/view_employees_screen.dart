import 'package:flutter/material.dart';
import '../../services/database_service.dart';

class ViewEmployeesScreen extends StatelessWidget {
  final DatabaseService dbService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Employees'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: dbService.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No employees found.'));
          } else {
            final employees = snapshot.data!;
            return ListView.builder(
              itemCount: employees.length,
              itemBuilder: (context, index) {
                final employee = employees[index];
                return ListTile(
                  title: Text('${employee['name']} ${employee['surname']}'),
                  subtitle: Text('${employee['position']}'),
                  onTap: () {
                    // Show employee details
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('${employee['name']} ${employee['surname']}'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('OIB: ${employee['oib']}'),
                              Text('Position: ${employee['position']}'),
                              // Add more fields as necessary
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

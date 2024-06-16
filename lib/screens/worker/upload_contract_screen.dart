import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../../services/database_service.dart';

class UploadContractScreen extends StatefulWidget {
  @override
  _UploadContractScreenState createState() => _UploadContractScreenState();
}

class _UploadContractScreenState extends State<UploadContractScreen> {
  final DatabaseService dbService = DatabaseService();
  String selectedFileName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Contract'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (selectedFileName.isNotEmpty)
              Text('Selected file: $selectedFileName'),
            ElevatedButton(
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles();

                if (result != null) {
                  PlatformFile file = result.files.first;
                  setState(() {
                    selectedFileName = file.name;
                  });
                  
                  // Implement your upload logic here
                  // Example:
                  // await dbService.uploadContract(file);
                  
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('File uploaded successfully: ${file.name}')),
                  );

                  // Return to worker home screen
                  Navigator.pushReplacementNamed(context, '/workerHome');
                }
              },
              child: Text('Pick a file'),
            ),
          ],
        ),
      ),
    );
  }
}

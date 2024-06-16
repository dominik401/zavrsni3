import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Dodavanje korisnika
  Future<void> addUser(String userId, Map<String, dynamic> userData) async {
    await _db.collection('users').doc(userId).set(userData);
  }

  // Dohvaćanje svih korisnika
  Future<List<Map<String, dynamic>>> getUsers() async {
    QuerySnapshot snapshot = await _db.collection('users').get();
    return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }

  // Ažuriranje korisnika
  Future<void> updateUser(String userId, Map<String, dynamic> data) async {
    await _db.collection('users').doc(userId).update(data);
  }

  // Dodavanje radnih sati
  Future<void> addWorkHours(String userId, String date, int hoursWorked) async {
    await _db.collection('working_hours').doc(userId).collection('hours').doc(date).set({
      'hoursWorked': hoursWorked,
    });
  }

  // Dohvaćanje radnih sati
  Future<int> getTotalWorkHours(String userId) async {
    QuerySnapshot snapshot = await _db.collection('working_hours').doc(userId).collection('hours').get();
    int totalHours = 0;
    snapshot.docs.forEach((doc) {
      totalHours += doc.data()['hoursWorked'as int];
    });
    return totalHours;
  }
}

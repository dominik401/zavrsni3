// lib/models/employee.dart
class Employee {
  final int? id;
  final String name;
  final String surname;
  final String oib;
  final String position;
  final String contract;

  Employee({
    this.id,
    required this.name,
    required this.surname,
    required this.oib,
    required this.position,
    required this.contract,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'surname': surname,
      'oib': oib,
      'position': position,
      'contract': contract,
    };
  }
}

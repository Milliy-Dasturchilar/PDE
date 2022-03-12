import 'package:equatable/equatable.dart';

class User extends Equatable{
  final int id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String isStaff;

  User({required this.id, required this.firstName, required this.lastName, required this.phoneNumber, required this.isStaff});

  @override
  List<Object> get props => [id, firstName, lastName, phoneNumber, isStaff];

}
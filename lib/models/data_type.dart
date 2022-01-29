import 'package:equatable/equatable.dart';

class DataType extends Equatable {
  final String firstName;
  final String lastName;
  final String randomNumber;

  const DataType(
      {required this.firstName,
      required this.lastName,
      required this.randomNumber});

  @override
  List<Object?> get props => [firstName, lastName, randomNumber];
}

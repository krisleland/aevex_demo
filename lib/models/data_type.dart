import 'package:equatable/equatable.dart';

class DataType extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String randomNumber;

  const DataType(
      {this.id = -1,
      required this.firstName,
      required this.lastName,
      required this.randomNumber});

  @override
  List<Object?> get props => [id, firstName, lastName, randomNumber];

  DataType copyWith(
      {int? id, String? firstName, String? lastName, String? randomNumber}) {
    return DataType(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        randomNumber: randomNumber ?? this.randomNumber);
  }
}

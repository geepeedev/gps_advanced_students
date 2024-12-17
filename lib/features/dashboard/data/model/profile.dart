// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

// import 'package:gps_advanced_students/core/common/user/data/model/user.dart';

class StudentProfileModel extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? dateOfBirth;
  final String? stateOfOrigin;
  final int? age;
  final String? address;
  final String? gender;
  final String ownerId;
  const StudentProfileModel({
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.gender,
    this.stateOfOrigin,
    this.age,
    this.address,
    required this.ownerId,
  });

  const StudentProfileModel.empty(
      {this.firstName = '',
      this.lastName = '',
      this.dateOfBirth,
      this.stateOfOrigin = '',
      this.age = 0,
      this.address = '',
      this.gender = '',
      this.ownerId = ''});

  StudentProfileModel copyWith({
    String? firstName,
    String? lastName,
    String? dateOfBirth,
    String? stateOfOrigin,
    int? age,
    String? address,
    String? gender,
    String? ownerId,
  }) {
    return StudentProfileModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      stateOfOrigin: stateOfOrigin ?? this.stateOfOrigin,
      age: age ?? this.age,
      address: address ?? this.address,
      gender: gender ?? this.gender,
      ownerId: ownerId ?? this.ownerId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'dateOfBirth': dateOfBirth,
      'stateOfOrigin': stateOfOrigin,
      'age': age,
      'address': address,
      'gender': gender,
      'ownerId': ownerId,
    };
  }

  factory StudentProfileModel.fromMap(Map<String, dynamic> map) {
    return StudentProfileModel(
      firstName: (map['firstName'] ?? '') as String,
      lastName: (map['lastName'] ?? '') as String,
      dateOfBirth: (map['dateOfBirth'] ?? '') as String,
      stateOfOrigin: (map['stateOfOrigin'] ?? '') as String,
      age: (map['age'] ?? 0) as int,
      address: (map['address'] ?? '') as String,
      gender: (map['gender'] ?? '') as String,
      ownerId: (map['ownerId'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentProfileModel.fromJson(String source) =>
      StudentProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      firstName,
      lastName,
      dateOfBirth,
      stateOfOrigin,
      age,
      address,
      gender,
      ownerId,
    ];
  }
}

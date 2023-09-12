import 'package:flutter/material.dart';

class TouristModel {
  final TextEditingController name = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController dateOfBirth = TextEditingController();
  final TextEditingController citizenship = TextEditingController();
  final TextEditingController passportNumber = TextEditingController();
  final TextEditingController validityPeriodPassport = TextEditingController();

  List<TextEditingController> get props => [
        name,
        lastName,
        dateOfBirth,
        citizenship,
        passportNumber,
        validityPeriodPassport
      ];
}

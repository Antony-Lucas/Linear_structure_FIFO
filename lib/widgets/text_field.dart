import 'package:flutter/material.dart';

Widget textFieldDefault({String? hint, required TextEditingController controller}) {
  return TextField(
     controller: controller,
     decoration: InputDecoration(
       labelText: hint,
     )
  );
}

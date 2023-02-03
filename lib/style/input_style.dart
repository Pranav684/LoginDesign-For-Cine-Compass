import 'package:flutter/material.dart';
import '../style/used_colors.dart';

Padding InputText(String label, TextEditingController login_id) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: SizedBox(
      width: 300,
      child: TextFormField(
        controller: login_id,
        style: TextStyle(color: OrgGrey),
        decoration: InputDecoration(
          // label: Text('Password'),
          hintStyle: TextStyle(color: White),
          hintText: label,
          labelText: label,
          labelStyle: TextStyle(color: OrgGrey),
          filled: true,
          fillColor: Black,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Black,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Black,
              width: 2.0,
            ),
          ),
        ),
      ),
    ),
  );
}

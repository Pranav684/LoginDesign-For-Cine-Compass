import 'package:flutter/material.dart';

var signup_email = TextEditingController();
var signup_name = TextEditingController();
var signup_phone = TextEditingController();
var signup_pass = TextEditingController();
var signup_cnfm_pass = TextEditingController();

var signup_token = '';
var signup_msg = '';

reset_signup_controller() {
  signup_email = TextEditingController();
  signup_name = TextEditingController();
  signup_phone = TextEditingController();
  signup_pass = TextEditingController();
  signup_cnfm_pass = TextEditingController();

  signup_token = '';
  signup_msg = '';
}

import 'package:flutter/material.dart';

var login_id = TextEditingController();
var login_pass = TextEditingController();

var login_token = '';
var login_msg = '';

reset_loginin_controller() {
  login_id = TextEditingController();
  login_pass = TextEditingController();
  login_token = '';
  login_msg = '';
}

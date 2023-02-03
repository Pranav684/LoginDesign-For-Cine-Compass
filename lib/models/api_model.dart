import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:yuktidea_assignment/controller/otp_controller.dart';
import '../controller/login_controllers.dart';
import '../controller/signup_controllers.dart';
import '../controller/responses.dart';

Map registerData = {};
Map loginData = {};

setSignupData() {
  registerData = {
    "name": signup_name.text,
    "email": signup_email.text,
    "phone": signup_phone.text,
    "password": signup_pass.text,
    "password_confirmation": signup_cnfm_pass.text
  };
}

setLoginData() {
  loginData = {"login": login_id.text, "password": login_pass.text};
}

register_user() async {
  setSignupData();
  print(registerData);

  http.Response response = await http.post(
      Uri.parse(
        'https://cinecompass.yuktidea.com/api/v1/register',
      ),
      body: registerData);
  var decodedResponse = json.decode(response.body);
  signup_response = decodedResponse;

  print(
    decodedResponse.toString() + " -- " + response.statusCode.toString(),
  );
  if (response.statusCode == 200) {
    signup_token = signup_response['data'][0]['access_token'];
    return true;
  } else {
    signup_msg = signup_response["error"][0];
    print(signup_msg);
    return false;
  }
}

login_user() async {
  setLoginData();
  print(loginData);
  http.Response response = await http.post(
      Uri.parse(
        'https://cinecompass.yuktidea.com/api/v1/login',
      ),
      body: loginData);
  var decodedResponse = json.decode(response.body);
  login_response = decodedResponse;
  print(
    decodedResponse.toString() + " -- " + response.statusCode.toString(),
  );
  if (response.statusCode == 200) {
    return true;
  } else {
    login_msg = login_response["message"];
    return false;
  }
}

verify_otp() async {
  http.Response response = await http.post(
      Uri.parse(
        'https://cinecompass.yuktidea.com/api/v1/otp/verify',
      ),
      headers: {
        'Accept': 'application/json',
        'Authorization': signup_token.toString()
      },
      body: {
        "otp": signup_otp.text
      });
  var decodedResponse = json.decode(response.body);
  print(
    decodedResponse.toString() + " -- " + response.statusCode.toString(),
  );
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

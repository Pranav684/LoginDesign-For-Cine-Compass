import 'package:flutter/material.dart';
import 'package:yuktidea_assignment/style/alert_box.dart';
import '../style/used_colors.dart';
import '../style/input_style.dart';
import '../models/api_model.dart';
import '../controller/login_controllers.dart';

class LoginPage extends StatefulWidget {
  // LoginPage({Key? key}) : super(key: key);
  static const routeName = 'login_page';
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var hideText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Welcome Back!',
                    style: TextStyle(
                        color: White,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Please sign in to your account',
                    style: TextStyle(color: White, fontSize: 18),
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputText('Email/Phone Number', login_id),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SizedBox(
                    width: 300,
                    child: TextFormField(
                      controller: login_pass,
                      obscureText: hideText,
                      style: TextStyle(color: OrgGrey),
                      decoration: InputDecoration(
                        // label: Text('Password'),
                        // suffixStyle: TextStyle(color: OrgGrey),
                        suffixIconColor: OrgGrey,
                        suffixIcon: IconButton(
                            color: OrgGrey,
                            onPressed: () {
                              setState(() {
                                hideText = !hideText;
                              });
                            },
                            icon: hideText
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility)),
                        hintStyle: TextStyle(color: White),
                        hintText: 'Password',
                        labelText: "Password",
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
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'Forgot Password ?',
                    style: TextStyle(color: OrgGrey, fontSize: 18),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: SizedBox(
                    height: 50,
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () async {
                        dynamic result = await login_user();
                        if (result == true) {
                          Navigator.pushNamed(context, 'home_page');
                        } else if (result == false) {
                          showMyDialog(context, login_msg);
                          setState(() {});
                        }
                      },
                      style: ElevatedButton.styleFrom(primary: Red),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        'Don\'t have an account ?',
                        style: TextStyle(color: OrgGrey, fontSize: 18),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'signup_page');
                        },
                        child: Text(
                          'Signup',
                          style: TextStyle(color: Red, fontSize: 15),
                        ))
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:justgrab_pro/presentation/forgot_password/widgets/Background.dart';
import 'package:justgrab_pro/presentation/home/Home.dart';
import 'package:justgrab_pro/presentation/sign_in/Sign_in.dart';
import 'package:justgrab_pro/theme/colors.dart';
import 'package:justgrab_pro/application/auth/auth.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool isEmailCorrect = false;
  bool isObscure = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _newPasswordConfirmController = TextEditingController();
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // A key for managing the form
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).copyWith().size;
    return Scaffold(
      body: Stack(
        children: [
          Background22(),
          Container(
            padding: EdgeInsets.only(
                top: size.height * 0.3,
                left: size.width * 0.1,
                right: size.width * 0.1),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "field required";
                      }
                      return null;
                    },
                    controller: _emailController,
                    decoration: InputDecoration(
                        labelText: "Email Address",
                        hintText: "example@company.com",
                        focusColor: gold1,
                        suffix:
                            Icon(isEmailCorrect ? Icons.check : Icons.close),
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: brown1)),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: isObscure,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "field required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: "Old Password",
                        hintText: "*********",
                        focusColor: gold1,
                        suffix: IconButton(
                            onPressed: () => setState(() {
                                  isObscure = !isObscure;
                                }),
                            icon: Icon(
                              isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: brown1,
                            )),
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: brown1)),
                  ),
                  TextFormField(
                    controller: _newPasswordController,
                    obscureText: isObscure,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "field required";
                      } else if (value == "Password@1") {
                        return "Cannot use this password";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: "New Password",
                        hintText: "*********",
                        focusColor: gold1,
                        suffix: IconButton(
                            onPressed: () => setState(() {
                                  isObscure = !isObscure;
                                }),
                            icon: Icon(
                              isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: brown1,
                            )),
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: brown1)),
                  ),
                  TextFormField(
                    controller: _newPasswordConfirmController,
                    obscureText: isObscure,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "field required";
                      } else if (value == "Password@1") {
                        return "Cannot use this password";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: "New Password Confirm",
                        hintText: "*********",
                        focusColor: gold1,
                        suffix: IconButton(
                            onPressed: () => setState(() {
                                  isObscure = !isObscure;
                                }),
                            icon: Icon(
                              isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: brown1,
                            )),
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: brown1)),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: size.width * 0.1, right: size.width * 0.1),
                    child: TextButton(
                        style: TextButton.styleFrom(backgroundColor: brown1),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            if (_newPasswordConfirmController.text.trim() ==
                                _newPasswordController.text.trim()) {
                              var res = await Auth().updatePassword(
                                  oldpassword: _passwordController.text.trim(),
                                  email: _emailController.text.trim(),
                                  newPassword:
                                      _newPasswordController.text.trim());
                              if (res.statusCode == 200) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignIn(),
                                    ));
                              } else {
                                const snackdemo = SnackBar(
                                  content: Text(
                                      "Failed to change Password! Check Password or email"),
                                  backgroundColor:
                                      Color.fromARGB(255, 206, 87, 40),
                                  elevation: 10,
                                  behavior: SnackBarBehavior.floating,
                                  margin: EdgeInsets.all(5),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackdemo);
                              }
                            } else {
                              const snackdemo = SnackBar(
                                content: Text("Passwords do not Match"),
                                backgroundColor:
                                    Color.fromARGB(255, 206, 87, 40),
                                elevation: 10,
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.all(5),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackdemo);
                            }
                          }
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: white1, fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:mechtool_app/Components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mechtool_app/screens/registration_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String id = 'login_screen';

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email = "";
  String password = "";
  bool showSpinner = false;
  bool showPassword = false;
  String emailError = '';
  String passwordError = '';
  String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Safety Guide
        title: const Text(
          "LOG IN",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(height: 50),
                  Hero(
                    tag: 'logo',
                    child: SizedBox(
                      height: 250.0,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Center(
                    child: Text('Enter Your Email & Password To Log In',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        )),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      //Do something with the user input.
                      email = value;
                      bool isValidEmail = email.isNotEmpty &&
                          email.contains('@') &&
                          email.contains('.');
                      setState(() {
                        emailError = isValidEmail
                            ? ''
                            : 'Please enter a valid Email address.';
                      });
                    },
                    decoration: InputDecoration(
                      label: const Text('Email'),
                      hintText: 'Enter Email',
                      hintStyle: const TextStyle(
                        color: Colors.black26,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: emailError.isNotEmpty
                              ? Colors.red
                              : Colors.blueAccent, // Default border color
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon:
                          const Icon(Icons.email_outlined), //adding email icon
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: emailError.isNotEmpty
                              ? Colors.red
                              : Colors.blueAccent, // Default border color
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Text(
                    emailError,
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    obscureText: !showPassword,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      //Do something with the user input.
                      password = value;
                      bool isValidPassword =
                          password.isNotEmpty && password.length >= 6;
                      setState(() {
                        passwordError = isValidPassword
                            ? ''
                            : 'Password must be at least 6 characters.';
                      });
                    },
                    decoration: InputDecoration(
                      label: const Text('Password'),
                      hintText: 'Enter Password',
                      hintStyle: const TextStyle(
                        color: Colors.black26,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: passwordError.isNotEmpty
                              ? Colors.red
                              : Colors.blueAccent, // Default border color
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          showPassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: showPassword
                              ? Colors.black
                              : Colors.grey.shade300,
                        ),
                        onPressed: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: passwordError.isNotEmpty
                              ? Colors.red
                              : Colors.blueAccent, // Default border color
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Text(
                    passwordError,
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  RoundedButton(
                      title: 'Log In',
                      colour: Colors.blueAccent,
                      onPressed: () async {
                        RegExp regex = RegExp(pattern);
                        if (email.isEmpty && password.isEmpty) {
                          setState(() {
                            passwordError =
                                'Please enter a valid Email and Password';
                            emailError = '';
                          });
                        } else if (!regex.hasMatch(email)) {
                          emailError = 'Please enter a valid email address';
                        } else if (email.isEmpty ||
                            !email.contains('@') ||
                            !email.contains('.')) {
                          setState(() {
                            emailError = 'Please enter a valid Email address.';
                          });
                        }
                        if (email.isEmpty && password.isEmpty) {
                          setState(() {
                            passwordError = 'Please enter Password';
                            emailError = 'Please enter a valid Email address';
                          });
                        } else if (password.isEmpty) {
                          setState(() {
                            passwordError = 'Please enter the password.';
                          });
                        } else if (password.length < 6) {
                          setState(() {
                            passwordError =
                                'Password must be at least 6 characters.';
                          });
                        }
                        // setState(() {
                        //   showSpinner = true;
                        // });
                        try {
                          await _auth.signInWithEmailAndPassword(
                            email: email,
                            password: password,
                          );
                          Navigator.pushNamed(context, HomeScreen.id);
                          // setState(() {
                          //   showSpinner = false;
                          // });
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'invalid-credential') {
                            setState(() {
                              passwordError = 'Password or Email incorrect';
                            });
                          }
                        } catch (e) {
                          print(e);
                        }
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account?'),
                      const SizedBox(width: 5.0),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RegistrationScreen.id);
                        }, // Replace '/signup' with your actual signup route name
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

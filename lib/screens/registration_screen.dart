import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mechtool_app/Components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mechtool_app/screens/home_screen.dart';
import 'package:mechtool_app/screens/login_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});
  static const String id = 'registration_screen';
  @override
  // ignore: library_private_types_in_public_api
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  final _data = FirebaseDatabase.instance;
  bool showSpinner = false;
  String email = "";
  String password = "";
  String username = "";
  String emailError = "";
  String confirmPassword = "";
  String usernameError = "";
  String passwordError = "";
  String cPasswordError = "";
  bool showPassword = false;
  bool showPassword1 = false;
  String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Safety Guide
        title: const Text(
          "SIGN UP",
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
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(height: 50),
                  Hero(
                    tag: 'logo',
                    child: SizedBox(
                      height: 120.0,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Center(
                    child: Text('Enter Your Personal Details To Sign In',
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
                      username = value;
                      bool isValidUsername = username.isNotEmpty;
                      setState(() {
                        usernameError =
                            isValidUsername ? '' : 'User name cannot be empty.';
                      });
                    },
                    decoration: InputDecoration(
                      label: const Text('Username'),
                      hintText: 'Enter Username',
                      hintStyle: const TextStyle(
                        color: Colors.black26,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: usernameError.isNotEmpty
                              ? Colors.red
                              : Colors.blueAccent, // Default border color
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Icon(Icons.account_circle_outlined),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: usernameError.isNotEmpty
                              ? Colors.red
                              : Colors.blueAccent, // Default border color
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Text(
                    usernameError,
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(
                    height: 10.0,
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
                            : 'Please enter a valid email address.';
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
                      prefixIcon: const Icon(Icons.email_outlined),
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
                  TextField(
                    obscureText: !showPassword1,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      confirmPassword = value;
                      bool isValidCPassword = confirmPassword.isNotEmpty &&
                          confirmPassword == password;
                      setState(() {
                        cPasswordError =
                            isValidCPassword ? '' : 'Password not matching.';
                      });
                    },
                    decoration: InputDecoration(
                      label: const Text('Re-Enter Password'),
                      hintText: 'Confirm Password',
                      hintStyle: const TextStyle(
                        color: Colors.black26,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: cPasswordError.isNotEmpty
                              ? Colors.red
                              : Colors.blueAccent, // Default border color
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          showPassword1
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: showPassword1
                              ? Colors.black
                              : Colors.grey.shade300,
                        ),
                        onPressed: () {
                          setState(() {
                            showPassword1 = !showPassword1;
                          });
                        },
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: cPasswordError.isNotEmpty
                              ? Colors.red
                              : Colors.blueAccent, // Default border color
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Text(
                    cPasswordError,
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  RoundedButton(
                      title: 'Sign Up',
                      colour: Colors.blueAccent,
                      onPressed: () async {
                        // setState(() {
                        //   showSpinner = true;
                        // });
                        RegExp regex = RegExp(pattern);
                        if (username.isEmpty) {
                          setState(() {
                            usernameError = 'User name cannot be empty.';
                          });
                        }
                        if (email.isEmpty ||
                            !email.contains('@') ||
                            !email.contains('.')) {
                          setState(() {
                            emailError = 'Please enter a valid email address.';
                          });
                        } else if (!regex.hasMatch(email)) {
                          emailError = 'Please enter a valid email address';
                        }

                        if (password.isEmpty) {
                          setState(() {
                            passwordError = 'Please Enter Password';
                          });
                        } else if (password.length < 6) {
                          setState(() {
                            passwordError =
                                'Password must be at least 6 characters.';
                          });
                        }
                        if (confirmPassword.isEmpty) {
                          setState(() {
                            cPasswordError = 'Please Enter Confirm Password.';
                          });
                        } else if (confirmPassword != password) {
                          setState(() {
                            cPasswordError = 'Password not matching.';
                          });
                        }
                        // print(email);
                        // print(password);
                        try {
                          if (password == confirmPassword) {
                            await _auth.createUserWithEmailAndPassword(
                              email: email,
                              password: password,
                            );
                            await _data
                                .ref("users/${_auth.currentUser!.uid}")
                                .set({"userName": username, "email": email});
                            if (!mounted) {
                              return;
                            }
                            Navigator.pushNamed(context, HomeScreen.id);
                          }
                          // setState(() {
                          //   showSpinner = false;
                          // });
                        } on FirebaseAuthException catch (error) {
                          print(error.message);
                        } catch (e) {
                          print(e);
                        }
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account? '),
                      const SizedBox(width: 1.0),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, LoginScreen.id);
                        },
                        child: const Text(
                          'Log In',
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

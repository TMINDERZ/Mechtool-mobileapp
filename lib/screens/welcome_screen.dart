import 'package:mechtool_app/screens/login_screen.dart';
import 'package:mechtool_app/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:mechtool_app/Components/rounded_button.dart';

import 'home_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  static const String id = 'welcome_screen';

  @override
  // ignore: library_private_types_in_public_api
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);

    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 200),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: 'logo',
                      child: SizedBox(
                        height: 60.0,
                        child: Image.asset('images/logo.png'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'MECHTOOL',
                      style: TextStyle(
                        fontSize: 38.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.lightBlue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 280,
                  child: Text(
                    'Explore the latest technologies using MECHTOOL.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.blue[800],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundedButton(
                      title: 'Get Started',
                      colour: Colors.blueAccent,
                      onPressed: () {
                        Navigator.pushNamed(context, HomeScreen.id);
                      },
                    ),
                    const SizedBox(width: 20),
                    RoundedButton(
                      title: 'Log in',
                      colour: Colors.blueAccent,
                      onPressed: () {
                        Navigator.pushNamed(context, LoginScreen.id);
                      },
                    ),
                    const SizedBox(width: 20),
                    RoundedButton(
                      title: 'Sign Up',
                      colour: Colors.blueAccent,
                      onPressed: () {
                        Navigator.pushNamed(context, RegistrationScreen.id);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

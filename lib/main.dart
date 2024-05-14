import 'package:firebase_core/firebase_core.dart';
import 'package:mechtool_app/Tools/Adjustable%20Wrench.dart';
import 'package:mechtool_app/Tools/Claw%20Hammer.dart';
import 'package:mechtool_app/Tools/Electric%20Drill.dart';
import 'package:mechtool_app/Tools/Screwdriver.dart';
import 'package:mechtool_app/Tools/Wrench.dart';
import 'package:mechtool_app/maps/maps_page.dart';
import 'package:mechtool_app/screens/account_screen.dart';
import 'package:mechtool_app/screens/equipment_detection.dart';
import 'package:mechtool_app/screens/equipment_screen.dart';
import 'package:mechtool_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:mechtool_app/screens/safety_screen.dart';
import 'package:mechtool_app/screens/store_location.dart';
import 'package:mechtool_app/screens/tool_detection.dart';
import 'package:mechtool_app/screens/tool_screen.dart';
import 'package:mechtool_app/screens/welcome_screen.dart';
import 'package:mechtool_app/screens/login_screen.dart';
import 'package:mechtool_app/screens/registration_screen.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MechTool());
}

class MechTool extends StatelessWidget {
  const MechTool({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.id,
      theme: ThemeData.light().copyWith(useMaterial3: false),
      routes: <String, WidgetBuilder>{
        //Screens
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        RegistrationScreen.id: (context) => const RegistrationScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        StoreLocation.id: (context) => const StoreLocation(),
        ToolDetection.id: (context) => const ToolDetection(),
        SafetyScreen.id: (context) => const SafetyScreen(),
        ToolScreen.id: (context) => const ToolScreen(),
        EquipmentScreen.id: (context) => const EquipmentScreen(),
        EquipmentDetection.id: (context) => const EquipmentDetection(),
        AccountScreen.id: (context) => const AccountScreen(),
        //Maps
        MapPage.id: (context) => const MapPage(),
        //Tools
        ScrewdriverTool.id: (context) => const ScrewdriverTool(),
        WrenchTool.id: (context) => const WrenchTool(),
        AdjustableWrenchTool.id: (context) => const AdjustableWrenchTool(),
        ElectricDrillTool.id: (context) => const ElectricDrillTool(),
        ClawHammerTool.id: (context) => const ClawHammerTool(),
      },
    );
  }
}

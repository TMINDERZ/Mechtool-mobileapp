import 'package:firebase_core/firebase_core.dart';
import 'package:mechtool_app/Detected%20item/Detected_Equipment.dart';
import 'package:mechtool_app/Detected%20item/Detected_Tool.dart';
import 'package:mechtool_app/Equipments/Cables.dart';
import 'package:mechtool_app/Equipments/Flat%20Screwdriver%20Nails.dart';
import 'package:mechtool_app/Equipments/Iron%20Nails.dart';
import 'package:mechtool_app/Equipments/Phillips%20Screwdriver%20nails.dart';
import 'package:mechtool_app/Equipments/Wrench%20Nuts.dart';
import 'package:mechtool_app/Safety%20Guide/Adjustable%20Wrench%20Safety.dart';
import 'package:mechtool_app/Safety%20Guide/Claw%20Hammer%20Safety.dart';
import 'package:mechtool_app/Safety%20Guide/Electric%20Drill%20Safety.dart';
import 'package:mechtool_app/Safety%20Guide/Screwdriver%20Safety.dart';
import 'package:mechtool_app/Safety%20Guide/Wrench%20Safety.dart';
import 'package:mechtool_app/Tools/Adjustable%20Wrench.dart';
import 'package:mechtool_app/Tools/Claw%20Hammer.dart';
import 'package:mechtool_app/Tools/Electric%20Drill.dart';
import 'package:mechtool_app/Tools/Screwdriver.dart';
import 'package:mechtool_app/Tools/Wrench.dart';
import 'package:mechtool_app/maps/maps_page.dart';
import 'package:mechtool_app/maps/maps_page1.dart';
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
import 'maps/maps_page2.dart';
import 'maps/maps_page3.dart';
import 'maps/maps_page4.dart';

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
        MapsPage1.id: (context) => const MapsPage1(),
        MapsPage2.id: (context) => const MapsPage2(),
        MapsPage3.id: (context) => const MapsPage3(),
        MapsPage4.id: (context) => const MapsPage4(),

        //Tools
        ScrewdriverTool.id: (context) => const ScrewdriverTool(),
        WrenchTool.id: (context) => const WrenchTool(),
        AdjustableWrenchTool.id: (context) => const AdjustableWrenchTool(),
        ElectricDrillTool.id: (context) => const ElectricDrillTool(),
        ClawHammerTool.id: (context) => const ClawHammerTool(),
        //Safety Guide
        ScrewdriverSafety.id: (context) => const ScrewdriverSafety(),
        WrenchSafety.id: (context) => const WrenchSafety(),
        AdjustableWrenchSafety.id: (context) => const AdjustableWrenchSafety(),
        ElectricDrillSafety.id: (context) => const ElectricDrillSafety(),
        ClawHammerSafety.id: (context) => const ClawHammerSafety(),

        //Equipment
        CablesEquipment.id: (context) => const CablesEquipment(),
        FlatScrewdriverNailEquipment.id: (context) =>
            const FlatScrewdriverNailEquipment(),
        IronNailsEquipment.id: (context) => const IronNailsEquipment(),
        PhillipsScrewdriverNailsEquipment.id: (context) =>
            const PhillipsScrewdriverNailsEquipment(),
        WrenchNutsEquipment.id: (context) => const WrenchNutsEquipment(),

        //Detected tool/Equipment Screen
        DetectedTool.id: (context) => const DetectedTool(),
        DetectedEquipment.id: (context) => const DetectedEquipment(),
      },
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mealorium/Navigation/BottomNavigator.dart';
import 'package:mealorium/Screens/CreateAccountScreen.dart';
import 'package:mealorium/Screens/HomeScreen.dart';
import 'package:mealorium/Screens/Splash.dart';
import 'package:mealorium/Theme/Theme.dart';
import 'package:mealorium/services/AccountCreationHandler.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
    ));
    return ChangeNotifierProvider(
      create: (context) => AccountCreationHandler(),
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        builder: () => GetMaterialApp(
          theme: AppTheme.lightTheme,
          title: 'Mealorium',
          debugShowCheckedModeBanner: false,
          builder: (BuildContext context, widget) =>
              Theme(data: AppTheme.lightTheme, child: widget!),
          home: CreateAccountScreen(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'core/constants/AppConstants.dart';
import 'screens/login/ui/login_screen.dart';

void main(){
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: true,
      home:LoginScreen(),
    title: appName,);
  }
}

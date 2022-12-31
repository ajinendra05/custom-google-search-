import 'package:flutter/material.dart';
import 'package:google_flutter/colors.dart';
import 'package:google_flutter/responsive/mobile_screen_layout.dart';
import 'package:google_flutter/responsive/responsive_layout_screen.dart';
import 'package:google_flutter/responsive/web_screen_layout.dart';
import 'package:google_flutter/screens/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Google Flutter',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: const ResponsiveLayoutScreen(
          mobileScreenLayout: MobileScreenLayout(),
          webScreenLayout: WebScreenLayout()),
      // home: SearchScreen(),
    );
  }
}

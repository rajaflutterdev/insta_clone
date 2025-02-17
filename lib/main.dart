import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ConstFiles/imageDownload.dart';
import 'Controller/provider/apiService/apiService.dart';
import 'Controller/provider/appBarController.dart';
import 'Controller/provider/bottomBarController.dart';
import 'Controller/provider/homeController.dart';
import 'Controller/provider/profileController.dart';
import 'Views/splashScreen/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => bottomMenus(),),
        ChangeNotifierProvider(create: (context) => appBarData(),),
        ChangeNotifierProvider(create: (context) => profileContent(),),
        ChangeNotifierProvider(create: (context) => ApiService(),),
        ChangeNotifierProvider(create: (context) => imageDownload(),),
        ChangeNotifierProvider(create: (context) => homeContent(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: splashScreen(),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../ConstFiles/widegtsList.dart';
import '../../Controller/provider/apiService/apiService.dart';
import '../../Controller/provider/bottomBarController.dart';
import '../../customWidgets/galssMorphismWidgets/glassMorphism.dart';
import '../../widgets/bottomBarWidget/bottomBarWidget.dart';

class landingScreen extends StatefulWidget {
  const landingScreen({super.key});

  @override
  State<landingScreen> createState() => _landingScreenState();
}

class _landingScreenState extends State<landingScreen> {


  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  _fetchData(){
     Provider.of<ApiService>(context, listen: false).fetchApiData();
  }


  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body:

      Consumer<bottomMenus>(
        builder: (context, value, child) => screenWidgets[value.selectedIndex],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: width/27.4,
          vertical: height/57.73333333333333
        ),
        child: GlassMorphism(
          start: 0.9,
          end: 0.6,
          radius: BorderRadius.circular(50),
          child: SizedBox(height: height/14.43333333333333, child: bottomBar()),
        ),
      ),
    );
  }
}

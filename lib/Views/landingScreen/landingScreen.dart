import 'package:flutter/material.dart';
import 'package:insta_clone/customWidgets/customText/customText.dart';
import 'package:insta_clone/untils/homeScreenUntils/homeScreenUntils.dart';
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

    return WillPopScope(
        onWillPop: () async {
          bool? shouldPop = await  showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: customText(textName: 'Exit Confirmation',textStyle: fontStyle.fontStyleAboreto(
                  fontSize: width/20.55,
                  fontWeight: FontWeight.w600
                ),),
                content: customText(textName: 'Are you sure you want to exit?',textStyle: fontStyle.fontStyleAboreto(
                    fontSize: width/22.8333
                ),),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: customText(textName: 'Cancel',textStyle: fontStyle.fontStyleAboreto(
              fontSize: width/22.8333
              ),),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: customText(textName: 'Yes',textStyle: fontStyle.fontStyleAboreto(
              fontSize: width/22.8333
              ),),
                  ),
                ],
              );
            },
          );
          return shouldPop ?? false;
        },
        child: Scaffold(
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
      ),
    );
  }


}




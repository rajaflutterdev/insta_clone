import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta_clone/Views/landingScreen/landingScreen.dart';
import 'package:insta_clone/customWidgets/customText/customText.dart';
import 'package:insta_clone/customWidgets/gradientContainer/gradientContainer.dart';
import 'package:insta_clone/untils/homeScreenUntils/homeScreenUntils.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 5),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => landingScreen(),));
    },);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            /// splash Logo
            gradientContainer(
              width: width/5.1375,
              height: height/10.825,
              bgColorShow: true,
              child: FaIcon(
                FontAwesomeIcons.instagram,
                color: whiteColor,
                size: width/6.85,
              ),),
            ///Welcome Text
            customText(
              textName: 'Instagram',
              textStyle: fontStyle.fontStyleAboreto(
                fontSize: width/16.44
              ),
            ),

            SizedBox(
              height: height/28.866,
              width: width/13.7,
              child: CircularProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }
}

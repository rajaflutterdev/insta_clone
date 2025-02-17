import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta_clone/customWidgets/customText/customText.dart';
import 'package:provider/provider.dart';
import '../../Controller/provider/appBarController.dart';
import '../../customWidgets/customButton/customeButton.dart';
import '../../untils/homeScreenUntils/homeScreenUntils.dart';

class appBarWidgets extends StatefulWidget {
  const appBarWidgets({super.key});

  @override
  State<appBarWidgets> createState() => _appBarWidgetsState();
}

class _appBarWidgetsState extends State<appBarWidgets> {

  @override
  Widget build(BuildContext context) {

     final iconTapped=Provider.of<appBarData>(context);
     double width = MediaQuery.of(context).size.width;
     double height = MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ///title Text Widgets

        customText(
          textName: "Muhammad .uix",
          textStyle: fontStyle.fontStyleAboreto(
              fontSize: width/20.55,
              fontColor: titleColor,
              fontWeight: FontWeight.w500),
        ),

       SizedBox(
         child: Row(
           spacing: 5,
           children: [

             /// bookMark icon
             customButton(
               buttonHeight: height/17.32,
               buttonWidth:width/8.22,
               buttonRadius: BorderRadius.circular(15),
               buttonColor: iconTapped.typeData=='bookmark'?greyColor.withOpacity(0.3):Colors.transparent,
               child: FaIcon(FontAwesomeIcons.bookmark, color: greyColor,size: width/22.8333,),
               onPressed: () {
                 iconTapped.changeTappedFunc(type: 'bookmark');
               },
             ),

             /// message icon
             customButton(
               buttonHeight: height/17.32,
               buttonWidth:width/8.22,
               buttonRadius: BorderRadius.circular(15),
               buttonColor: iconTapped.typeData=='message'?greyColor.withOpacity(0.3):Colors.transparent,
               child: Badge(
                 backgroundColor: Colors.transparent,
                 label: Icon(Icons.circle,size: width/34.25,color: greyColor,),
                   child: FaIcon(FontAwesomeIcons.message, color: greyColor,size: width/22.8333,)),
               onPressed: () {
                 iconTapped.changeTappedFunc(type: 'message');
               },
             ),
           ],
         ),
       )
      ],
    );
  }
}

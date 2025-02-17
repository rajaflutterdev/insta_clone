import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../Model/bottomBarModel.dart';
import '../../untils/homeScreenUntils/homeScreenUntils.dart';

class bottomMenus extends ChangeNotifier{

  int selectedIndex=0;
  List<bottomBarMenu> data=[
    bottomBarMenu(
      iconData: FaIcon(FontAwesomeIcons.homeAlt, color: greyColor,),
    ),
    bottomBarMenu(
      iconData: FaIcon(FontAwesomeIcons.search, color: greyColor, ),
    ),
    bottomBarMenu(
      iconData: FaIcon(FontAwesomeIcons.camera, color: greyColor, ),

    ),
    bottomBarMenu(
      iconData: FaIcon(FontAwesomeIcons.heart, color: greyColor, ),

    ),
    bottomBarMenu(
      iconData: FaIcon(FontAwesomeIcons.user, color: greyColor, ),
    ),

  ];
  changeIndex({ required int index}){
    selectedIndex=index;
    notifyListeners();
  }
}
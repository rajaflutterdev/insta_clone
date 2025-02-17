import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta_clone/untils/homeScreenUntils/homeScreenUntils.dart';
import 'package:provider/provider.dart';

import '../../Controller/provider/bottomBarController.dart';
import '../../customWidgets/gradientContainer/gradientContainer.dart';

class bottomBar extends StatefulWidget {
  const bottomBar({super.key});

  @override
  State<bottomBar> createState() => _bottomBarState();
}

class _bottomBarState extends State<bottomBar> {
  @override
  Widget build(BuildContext context) {
    var menuData = Provider.of<bottomMenus>(context, listen: true);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


    return
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List<Widget>.generate(menuData.data.length,(index) =>
            gradientContainer(
              bgColorShow: menuData.selectedIndex==index?true: false,
          height: height/19.24444444444444,
          width: width/9.1428,
          onTap: () {
                menuData.changeIndex(index: index);
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 1500),
            curve: Curves.easeInOut,
            child: FaIcon(menuData.data[index].iconData!.icon,
              color:menuData.selectedIndex==index? whiteColor:blackColor,size: width/22.833,),
          ),
        )),
      );
  }
}

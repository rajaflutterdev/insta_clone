import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta_clone/Controller/provider/apiService/apiService.dart';
import 'package:insta_clone/untils/homeScreenUntils/homeScreenUntils.dart';
import 'package:provider/provider.dart';
import '../../widgets/appBarWidgets/appBarWidgets.dart';
import '../../widgets/postWidget/postWidget.dart';
import '../../widgets/storyWidgets/storyWidget.dart';
import '../../widgets/stroyContainer/stroyContainer.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var apiService=Provider.of<ApiService>(context);

    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: FadeIn(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: height / 108.25, horizontal: width / 51.375),
          child: SafeArea(
            child: Column(
              spacing: 4,
              children: [
                /// appBar widgets( title and save and message Icon Widgets)
                appBarWidgets(),
                SizedBox(
                  height: height / 86.6,
                ),

                /// Story widgets
                /// own Story upload Container widgets
                /// List View Builder widget
                SizedBox(
                    width: width /1,
                    height: height / 14.4333,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: ScrollPhysics(),
                      child: Row(
                        spacing: 8,
                        children: [

                          stroyContainer(
                            elevation: 0,
                            onTap: () {},
                            child: FaIcon(
                              FontAwesomeIcons.add,
                              color: whiteColor,
                              size: width / 27.4,
                            ),
                          ),
                          storyWidgets(),
                        ],
                      ),
                    )),

                Divider(
                  thickness: 0.5,
                ),

                ///Post Widgets
                Padding(
                  padding:
                      EdgeInsets.only(left: width / 68.5, right: width / 68.5),
                  child: postWidget(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

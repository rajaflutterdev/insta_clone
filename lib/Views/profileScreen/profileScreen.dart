import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta_clone/customWidgets/customButton/customeButton.dart';
import 'package:insta_clone/customWidgets/customText/customText.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../Controller/provider/apiService/apiService.dart';
import '../../Controller/provider/bottomBarController.dart';
import '../../Controller/provider/homeController.dart';
import '../../Controller/provider/profileController.dart';
import '../../customWidgets/galssMorphismWidgets/glassMorphism.dart';
import '../../customWidgets/gradientTextWidgets/gradientText.dart';
import '../../untils/homeScreenUntils/homeScreenUntils.dart';
import '../detailsScreen/detailsScreen.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  @override
  Widget build(BuildContext context) {
    var profileCon = Provider.of<profileContent>(context, listen: true);
    var homeCon = Provider.of<homeContent>(context);
    var data = Provider.of<ApiService>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Consumer<bottomMenus>(
      builder: (context, value, child) => FadeIn(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: SafeArea(
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5,
              children: [
                /// details Container
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    /// blur container
                    ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                        child: Container(
                          // the size where the blurring starts
                          height: height/10.825,
                          color: Colors.white38,
                        ),
                      ),
                    ),

                    /// content container
                    Container(
                      padding: EdgeInsets.only(top: height/43.3, bottom: height/43.3, left: width/41.1),
                      decoration: BoxDecoration(
                        color: Colors.white38,
                        // image: DecorationImage(
                        //   fit: BoxFit.cover,
                        //   image: NetworkImage(
                        //       'https://static.vecteezy.com/system/resources/thumbnails/032/936/497/small_2x/cute-mammal-small-and-fluffy-sitting-in-the-autumn-forest-free-photo.jpg'),
                        // ),
                      ),
                      height: height/2.886666666666667,
                      width: width/1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// back Button
                          GestureDetector(
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Icon(CupertinoIcons.back,
                                    color: greyColor)),
                            onTap: () {
                              /// change the screen using change notifiers
                              value.changeIndex(index: 0);
                            },
                          ),

                          /// user details

                          SizedBox(
                            child: Column(
                              spacing: 10,
                              children: <Widget>[
                                /// Image (post ) widgets
                                Material(
                                  color: greyColor,
                                  elevation: 10,
                                  borderRadius: BorderRadius.circular(15),
                                  child: Container(
                                    height: height/12.371,
                                    width: width/5.871428571428571,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1zwhySGCEBxRRFYIcQgvOLOpRGqrT3d7Qng&s'))),
                                  ),
                                ),

                                /// user name
                                customText(
                                  textName: 'Muhammid.uic',
                                  textStyle: fontStyle.fontStyleAboreto(
                                      fontSize: width/22.833, fontColor: greyColor),
                                ),

                                /// post and following text widgets

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  spacing: 20,
                                  children: [
                                    /// post Content widgets
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        /// counts
                                        GradientText(
                                          gradient: LinearGradient(
                                              begin: FractionalOffset.topRight,
                                              end: FractionalOffset.bottomLeft,
                                              colors: [
                                                storyMidColor,
                                                storyPrimaryColor,
                                              ]),
                                          child: customText(
                                            textName: "31",
                                            textStyle:
                                                fontStyle.fontStyleAboreto(
                                                    fontSize: width/25.6875,
                                                    fontColor: greyColor),
                                          ),
                                        ),

                                        ///name
                                        customText(
                                          textName: "Post",
                                          textStyle: fontStyle.fontStyleAboreto(
                                            fontSize: width/22.833,
                                          ),
                                        ),
                                      ],
                                    ),

                                    /// Followers Content Widgets

                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        /// counts
                                        GradientText(
                                          gradient: LinearGradient(
                                              begin: FractionalOffset.topRight,
                                              end: FractionalOffset.bottomLeft,
                                              colors: [
                                                storyMidColor,
                                                storyPrimaryColor,
                                              ]),
                                          child: customText(
                                            textName: "22K",
                                            textStyle:
                                                fontStyle.fontStyleAboreto(
                                                    fontSize: width/25.6875,
                                                    fontColor: greyColor),
                                          ),
                                        ),

                                        ///name
                                        customText(
                                          textName: "Followers",
                                          textStyle: fontStyle.fontStyleAboreto(
                                            fontSize: width/22.833,
                                          ),
                                        ),
                                      ],
                                    ),

                                    /// Following Content Widgets

                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ///count
                                        GradientText(
                                          gradient: LinearGradient(
                                              begin: FractionalOffset.topRight,
                                              end: FractionalOffset.bottomLeft,
                                              colors: [
                                                storyMidColor,
                                                storyPrimaryColor,
                                              ]),
                                          child: customText(
                                            textName: "23K",
                                            textStyle:
                                                fontStyle.fontStyleAboreto(
                                                    fontSize: width/25.6875,
                                                    fontColor: greyColor),
                                          ),
                                        ),

                                        ///name
                                        customText(
                                          textName: "Following",
                                          textStyle: fontStyle.fontStyleAboreto(
                                            fontSize: width/22.833,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                /// Follow Button and message Button
                                Padding(
                                  padding:  EdgeInsets.only(top: height/86.6),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    spacing: 5,
                                    children: [
                                      /// follow Button
                                      DecoratedBox(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          gradient: LinearGradient(
                                              begin: FractionalOffset.topRight,
                                              end: FractionalOffset.bottomLeft,
                                              colors: [
                                                storyMidColor,
                                                storyPrimaryColor,
                                              ]),
                                        ),
                                        child: customButton(
                                            buttonRadius:
                                                BorderRadius.circular(10),
                                            buttonWidth: width/1.245454545454545,
                                            buttonHeight: height/17.32,
                                            buttonColor: Colors.transparent,
                                            onPressed: () {},
                                            child: customText(
                                              textName: 'Follow',
                                              textStyle:
                                                  fontStyle.fontStyleAboreto(
                                                fontSize: width/22.833,
                                                fontColor: whiteColor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )),
                                      ),

                                      customButton(
                                        buttonHeight: height/17.32,
                                        buttonWidth: width/8.22,
                                        buttonRadius: BorderRadius.circular(15),
                                        buttonColor: Colors.transparent,
                                        child: FaIcon(
                                          FontAwesomeIcons.message,
                                          color: greyColor,
                                          size: width/20.55,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                /// my Fav Text
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:  EdgeInsets.only(left: width/41.1),
                      child: customText(
                        textName: 'My Favourites',
                        textStyle: fontStyle.fontStyleAboreto(
                            fontWeight: FontWeight.w600, fontSize: width/22.83333333333333),
                      ),
                    )),

                ///fav Button List widgets

                SingleChildScrollView(
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding:  EdgeInsets.only(left: width/27.4,right: width/27.4,bottom: height/86.6),
                    child: Row(
                      spacing: 15,
                      children: List<Widget>.generate(
                        profileCon.favIconData.length,
                        (index) => customButton(
                          buttonElevation: 20,
                          buttonHeight: height/17.32,
                          buttonWidth: width/8.22,
                          buttonRadius: BorderRadius.circular(15),
                          onPressed: () {
                            profileCon.selectItem(index: index);
                          },
                          child: FaIcon(
                            profileCon.favIconData[index],
                            color: profileCon.selectedItemIndex == index
                                ? blackColor
                                : greyColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                /// post Content and different(Stories and saved and All),

                SingleChildScrollView(
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding:  EdgeInsets.only(left: width/41.1),
                    child: Row(
                      spacing: 20,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List<Widget>.generate(
                        profileCon.postContentText.length,
                        (index) => InkWell(
                          onTap: () {
                            profileCon.postContentSelectedFunc(index: index);
                          },
                          child: GradientText(
                            gradient: profileCon.selectedPostItem == index
                                ? LinearGradient(
                                    begin: FractionalOffset.topRight,
                                    end: FractionalOffset.bottomLeft,
                                    colors: [
                                        storyMidColor,
                                        storyPrimaryColor,
                                      ])
                                : LinearGradient(colors: [
                                    blackColor,
                                    blackColor,
                                  ]),
                            child: customText(
                              textName:
                                  profileCon.postContentText[index].toString(),
                              textStyle: fontStyle.fontStyleAboreto(
                                  fontWeight: FontWeight.w600,
                                  fontSize: width/25.6875,
                                  fontColor: blackColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                /// Gridview Builder

                Padding(
                  padding:  EdgeInsets.only(left: width/27.4,right: width/27.4,bottom: height/24.74285714285714),
                  child: SizedBox(
                    height: height/1.732,
                    width: width/1,
                    child:
                    data.isLoading?
                    GridView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: width/102.75,
                            vertical: height/216.5
                          ),
                          child: Shimmer.fromColors(
                            enabled: true,
                            baseColor: whiteColor,
                            highlightColor: greyColor.withOpacity(0.5),
                            child: SizedBox(
                              height: height/7.872727272727273,
                              width: width/4.11,
                              child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [

                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [

                                        Container(
                                          height: height/8.66,
                                          width: width/4.11,
                                          decoration: BoxDecoration(
                                              color: greyColor.withOpacity(0.4),
                                              borderRadius:
                                              BorderRadius.circular(15)),
                                        ),
                                      ],
                                    ),

                                    /// Like Button
                                    GlassMorphism(
                                      start: 0.9,
                                      end: 0.6,
                                      radius: BorderRadius.circular(15),
                                      child: customButton(
                                        buttonHeight: height/34.64,
                                        buttonWidth: width/5.871428571428571,
                                        buttonColor: Colors.transparent,
                                        buttonRadius: BorderRadius.circular(15),
                                        onPressed: () {},
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            FaIcon(
                                              FontAwesomeIcons.heart,
                                              color: greyColor,
                                              size: width/41.1,
                                            ),
                                            GradientText(
                                              gradient: LinearGradient(
                                                  begin:
                                                      FractionalOffset.topRight,
                                                  end:
                                                      FractionalOffset.bottomLeft,
                                                  colors: [
                                                    storyMidColor,
                                                    storyPrimaryColor,
                                                  ]),
                                              child: customText(
                                                textName: "",
                                                textStyle:
                                                    fontStyle.fontStyleAboreto(
                                                  fontWeight: FontWeight.w600,
                                                      fontSize: width/29.357
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 110 / 110,
                      ),
                    ):
                    GridView.builder(
                      itemCount: data.dataList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: width/102.75,
                              vertical: height/216.5
                          ),
                          child: GestureDetector(
                            onTap: (){
                             if(data.isLoading==false){
                               Navigator.of(context)
                                   .push(MaterialPageRoute(
                                 builder: (context) => detailsScreen(
                                   userName: data.dataList[index].author,
                                   desCription: homeCon.postDescription,
                                   imgUrl: data.dataList[index].downloadUrl,
                                 ),
                               ));
                             }
                            },
                            child: SizedBox(
                              height: height/7.872727272727273,
                              width: width/4.11,
                              child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [

                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [

                                        CachedNetworkImage(
                                          imageUrl: data.dataList[index].downloadUrl.toString(),
                                          imageBuilder: (context, imageProvider) =>
                                              Container(
                                                height: height/8.66,
                                                width: width/4.11,
                                                decoration: BoxDecoration(
                                                    color: greyColor.withOpacity(0.4),
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: imageProvider),
                                                    borderRadius:
                                                    BorderRadius.circular(15)),
                                              ),
                                          placeholder: (context, url) => Shimmer.fromColors(
                                            enabled: true,
                                            baseColor: storyPrimaryColor,
                                            highlightColor: storyMidColor,
                                            child: Container(
                                              height: height/8.66,
                                              width: width/4.11,
                                              decoration: BoxDecoration(
                                                  color: greyColor.withOpacity(0.4),
                                                  borderRadius:
                                                  BorderRadius.circular(15)),
                                            ),
                                          ),
                                          errorWidget: (context, url, error) => SizedBox(),
                                        ),
                                      ],
                                    ),

                                    /// Like Button
                                    GlassMorphism(
                                      start: 0.9,
                                      end: 0.6,
                                      radius: BorderRadius.circular(15),
                                      child: customButton(
                                        buttonHeight: height/34.64,
                                        buttonWidth: width/5.871428571428571,
                                        buttonColor: Colors.transparent,
                                        buttonRadius: BorderRadius.circular(15),
                                        onPressed: () {},
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                          children: [
                                            FaIcon(
                                              FontAwesomeIcons.heart,
                                              color: greyColor,
                                              size: width/41.1,
                                            ),
                                            GradientText(
                                              gradient: LinearGradient(
                                                  begin:
                                                  FractionalOffset.topRight,
                                                  end:
                                                  FractionalOffset.bottomLeft,
                                                  colors: [
                                                    storyMidColor,
                                                    storyPrimaryColor,
                                                  ]),
                                              child: customText(
                                                textName: "100K",
                                                textStyle:
                                                fontStyle.fontStyleAboreto(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: width/29.357
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 110 / 110,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height/24.74285714285714,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

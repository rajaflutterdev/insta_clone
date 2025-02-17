import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../ConstFiles/imageDownload.dart';
import '../../Controller/provider/homeController.dart';
import '../../customWidgets/customButton/customeButton.dart';
import '../../customWidgets/customText/customText.dart';
import '../../customWidgets/gradientTextWidgets/gradientText.dart';
import '../../untils/homeScreenUntils/homeScreenUntils.dart';

class detailsScreen extends StatefulWidget {
  String? desCription;
  String? userName;
  String? imgUrl;

  detailsScreen({this.desCription,this.imgUrl,this.userName});

  @override
  State<detailsScreen> createState() => _detailsScreenState();
}

class _detailsScreenState extends State<detailsScreen> {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var homeCon = Provider.of<homeContent>(context);
    var imgDownloadFile = Provider.of<imageDownload>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height:height/57.7333,),
              /// back Button
              GestureDetector(
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:  EdgeInsets.only(left: width/41.1),
                      child: Icon(CupertinoIcons.back, color: greyColor),
                    )),
                onTap: () {
                  /// change the screen using change notifiers
                  Navigator.pop(context);
                },
              ),
              Container(
                width: width/1,
                margin: EdgeInsets.symmetric(
                  vertical: height/86.6,
                  horizontal: width/41.1
                ),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    /// post content Widgets
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Material(
                        shadowColor: Colors.black87,
                        elevation: 10,
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(15),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 4,
                            children: [

                              /// post Name and more icon
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  /// Text Widgets
                                  SizedBox(
                                      width: width/2.74,
                                      child: customText(
                                        textName:widget.userName.toString(),
                                        textStyle: fontStyle.fontStyleAboreto(
                                            fontWeight: FontWeight.w500,
                                            fontSize: width/25.6875
                                        ),
                                      )),

                                  /// Post time and more icon
                                  SizedBox(
                                    width: width/5.1375,
                                    child: Padding(
                                      padding:  EdgeInsets.only(right: width/102.75),
                                      child: Row(
                                        spacing: 10,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          customText(textName: '6 min',
                                            textStyle: fontStyle.fontStyleAboreto(
                                              fontSize: width/25.6875,
                                              fontColor: titleColor,
                                              fontWeight: FontWeight.w500,
                                            ),),
                                          FaIcon(
                                            FontAwesomeIcons.ellipsisVertical,
                                            color: greyColor,
                                            size: width/22.83333333333333,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),

                                ],
                              ),

                              SizedBox(height: height/86.6,),

                              /// Post Container

                              CachedNetworkImage(
                                imageUrl: widget.imgUrl.toString(),
                                imageBuilder: (context, imageProvider) =>Container(
                                  height: height / 2.8866,
                                  width: width / 1.141666666666667,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: imageProvider),
                                    color: greyColor.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                placeholder: (context, url) => Shimmer.fromColors(
                                  enabled: true,
                                  baseColor: storyPrimaryColor,
                                  highlightColor: storyMidColor,
                                  child: Container(
                                    height: height / 2.8866,
                                    width: width / 1.141666666666667,
                                    decoration: BoxDecoration(
                                      color: greyColor.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) => SizedBox(),
                              ),

                              /// like and share Button

                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  /// like and share and comment buttons
                                  SizedBox(
                                    child: Row(
                                      spacing: 2,
                                      children: [
                                        /// Like Button
                                        customButton(
                                          buttonHeight: height / 43.3,
                                          buttonWidth:homeCon.likeCount !=
                                              0?
                                          width / 5.50:width/15.55,
                                          buttonColor: Colors.transparent,
                                          child: Row(
                                            spacing: 5,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons.heart,
                                                color: greyColor,
                                                size: width / 22.833,
                                              ),
                                              GradientText(
                                                gradient: LinearGradient(
                                                    begin: FractionalOffset
                                                        .topRight,
                                                    end: FractionalOffset
                                                        .bottomLeft,
                                                    colors: [
                                                      storyMidColor,
                                                      storyPrimaryColor,
                                                    ]),
                                                child: customText(
                                                  textName: homeCon.likeCount !=
                                                      0
                                                      ? '${homeCon.formatNumber(value: double.parse(homeCon.likeCount.toString()))}k'
                                                      : "",
                                                  textStyle: fontStyle
                                                      .fontStyleAboreto(
                                                      fontSize:
                                                      width / 25.6875,
                                                      fontColor:
                                                      greyColor),
                                                ),
                                              ),
                                            ],
                                          ),
                                          onPressed: () {
                                            homeCon.updateTheCount(type: 'like');
                                          },
                                        ),

                                        /// comment Button

                                        customButton(
                                          buttonHeight: height / 43.3,
                                          buttonWidth:homeCon.commentCount!=
                                              0?
                                          width / 5.50:width/15.55,
                                          buttonColor: Colors.transparent,
                                          child: Row(
                                            spacing: 5,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,

                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons.comment,
                                                color: greyColor,
                                                size: width / 22.833,
                                              ),
                                              customText(
                                                textName: homeCon.commentCount!=
                                                    0
                                                    ? '${homeCon.formatNumber(value: double.parse(homeCon.commentCount.toString()))}k'
                                                    : "",
                                                textStyle: fontStyle
                                                    .fontStyleAboreto(
                                                  fontSize: width / 25.6875,
                                                  fontColor: titleColor,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )
                                            ],
                                          ),
                                          onPressed: () {
                                            homeCon.updateTheCount(type: 'comment');
                                          },
                                        ),

                                        ///share Button
                                        customButton(
                                          buttonHeight: height / 43.3,
                                          buttonWidth:
                                          homeCon.shareCount !=
                                              0?
                                          width / 5.50:width/15.55,
                                          buttonColor: Colors.transparent,
                                          child: Row(
                                            spacing: 5,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons.share,
                                                color: greyColor,
                                                size: width / 22.833,
                                              ),
                                              customText(
                                                textName: homeCon.shareCount!=
                                                    0
                                                    ? '${homeCon.formatNumber(value: double.parse(homeCon.shareCount.toString()))}k'
                                                    : "",
                                                textStyle: fontStyle
                                                    .fontStyleAboreto(
                                                  fontSize: width / 25.6875,
                                                  fontColor: titleColor,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )
                                            ],
                                          ),

                                          onPressed: () {
                                            imgDownloadFile
                                                .shareImageToWhatsApp(imagePath: widget.imgUrl.toString());

                                            homeCon.updateTheCount(type: 'share');
                                          },
                                        ),
                                      ],
                                    ),
                                  ),

                                  /// save Button
                                  customButton(
                                    buttonHeight: height / 21.65,
                                    buttonWidth: width / 13.7,
                                    buttonRadius: BorderRadius.circular(15),
                                    buttonColor: Colors.transparent,
                                    child: FaIcon(
                                      FontAwesomeIcons.bookmark,
                                      color: greyColor,
                                      size: width / 22.833,
                                    ),
                                    onPressed: () {
                                      imgDownloadFile.asyncMethod(urls: [
                                        widget.imgUrl.toString()
                                      ], context: context);
                                    },
                                  ),
                                ],
                              ),

                              /// description Text Widgets
                              customText(
                                  overflow: TextOverflow.ellipsis,
                                  textStyle: fontStyle.fontStyleAboreto(
                                    fontSize: width/25.6875,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textName:
                                widget.desCription.toString()),


                              SizedBox(height:height/57.7333,),

                              /// View Comment Text
                              GradientText(
                                gradient: LinearGradient(
                                    begin: FractionalOffset
                                        .topRight,
                                    end: FractionalOffset
                                        .bottomLeft,
                                    colors: [
                                      storyMidColor,
                                      storyPrimaryColor,
                                    ]),
                                child: customText(
                                  textName: "View all comments(32545)",
                                  textStyle: fontStyle
                                      .fontStyleAboreto(
                                      fontSize: width/22.833,
                                      fontWeight: FontWeight.w600,
                                      fontColor:
                                      greyColor),
                                ),
                              ),



                              SizedBox(
                                height: height/2.0139,
                                child: ListView.builder(
                                  itemCount: 10,
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return
                                      ListTile(
                                      title: SizedBox(
                                        width: width/4.11,
                                        child: customText(
                                          overflow: TextOverflow.ellipsis,
                                          textName: "Helina_morahhh",
                                          textStyle: fontStyle
                                              .fontStyleAboreto(
                                              fontSize: width/22.83333333333333,
                                           ),
                                        ),
                                      ),
                                      subtitle: SizedBox(
                                        width: width/4.11,
                                        child: customText(
                                          overflow: TextOverflow.ellipsis,
                                          textName: "Very Nice design",
                                          textStyle: fontStyle
                                              .fontStyleAboreto(
                                              fontSize: width/25.6875,
                                              fontColor:
                                              greyColor),
                                        ),
                                      ),
                                        trailing: GestureDetector(
                                            onTap: (){},
                                            child: FaIcon(FontAwesomeIcons.heart,size: width/22.8333,)),

                                    );

                                },),
                              ),


                              SizedBox(height:height/57.7333,),


                            ],
                          ),
                        ),
                      ),
                    ),

                    /// Image (post ) widgets
                    Material(
                      color: greyColor,
                      elevation: 5,
                      borderRadius: BorderRadius.circular(15),
                      child: CachedNetworkImage(
                        imageUrl: widget.imgUrl.toString(),
                        placeholder: (context, url) => Shimmer.fromColors(
                          enabled: true,
                          baseColor: Colors.red,
                          highlightColor: Colors.yellow.withOpacity(0.4),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                            height: height / 17.32,
                            width: width / 8.22,
                          ),
                        ),
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: imageProvider)),
                          height: height / 17.32,
                          width: width / 8.22,
                        ),
                      )
                    ),
                  ],
                ),
              ),

              SizedBox(height:height/57.7333,),
            ],
          ),
        ),
      ),
    );
  }
}

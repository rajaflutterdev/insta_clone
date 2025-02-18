import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta_clone/ConstFiles/imageDownload.dart';
import 'package:insta_clone/Controller/provider/homeController.dart';
import 'package:insta_clone/Views/detailsScreen/detailsScreen.dart';
import 'package:insta_clone/customWidgets/customText/customText.dart';
import 'package:insta_clone/untils/homeScreenUntils/homeScreenUntils.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../Controller/provider/apiService/apiService.dart';
import '../../customWidgets/customButton/customeButton.dart';
import '../../customWidgets/gradientTextWidgets/gradientText.dart';

class postWidget extends StatefulWidget {
  const postWidget({super.key});

  @override
  State<postWidget> createState() => _postWidgetState();
}

class _postWidgetState extends State<postWidget> {



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var imgDownloadFile = Provider.of<imageDownload>(context);
    var homeCon = Provider.of<homeContent>(context);

    return Consumer<ApiService>(
      builder: (context, valueOfData, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            valueOfData.isLoading?
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {

                  return
                    Shimmer.fromColors(
                      enabled: true,
                      baseColor: whiteColor,
                      highlightColor: greyColor.withOpacity(0.5),
                      child: Container(
                      height: height / 1.70416,
                      margin: EdgeInsets.only(bottom: height / 43.3),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          /// post content Widgets
                          Padding(
                            padding: EdgeInsets.only(top: height / 43.3),
                            child: Material(
                              shadowColor: Colors.black87,
                              elevation: 10,
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(15),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width / 34.25,
                                    vertical: height / 72.16666666666667),
                                child: SizedBox(
                                  height: height / 1.80416,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    spacing: 4,
                                    children: [
                      
                                      /// post Name and more icon
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          /// Text Widgets
                                          SizedBox(
                                              width: width / 2.74,
                                              child: customText(
                                               textName:  "",
                                                textStyle: fontStyle.fontStyleAboreto(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: width / 25.6875),
                                              )),
                      
                                          /// Post time and more icon
                                          SizedBox(
                                            width: width / 5.1375,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  right: width / 102.75),
                                              child: Row(
                                                spacing: 10,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  customText(
                                                    textName: '',
                                                    textStyle:
                                                        fontStyle.fontStyleAboreto(
                                                      fontSize: width / 25.6875,
                                                      fontColor: titleColor,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                  FaIcon(
                                                    FontAwesomeIcons.ellipsisVertical,
                                                    color: greyColor,
                                                    size: width / 22.83333333333333,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                      
                                      SizedBox(
                                        height: height / 86.6,
                                      ),
                      
                                      /// Post Container
                      
                                      Container(
                                        height: height / 2.8866,
                                        width: width / 1.141666666666667,
                                        decoration: BoxDecoration(
                                          color: greyColor.withOpacity(0.4),
                                          borderRadius: BorderRadius.circular(15),
                                        ),
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
                                                          textName: "",
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
                                                        textName:  "",
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
                                                        textName:  "",
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
                                            },
                                          ),
                                        ],
                                      ),
                      
                                      /// description Text Widgets
                                      SizedBox(
                                          height: height / 19.24444444444444,
                                          child: customText(
                                              overflow: TextOverflow.ellipsis,
                                              maxLine: 2,
                                              textStyle: fontStyle.fontStyleAboreto(
                                                fontSize: width / 25.6875,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textName:
                                              "")),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          /// Image (post ) widgets
                          Material(
                            color: greyColor,
                            elevation: 5,
                            borderRadius: BorderRadius.circular(15),
                            child:
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),),
                              height: height / 17.32,
                              width: width / 8.22,
                            )
                          ),
                        ],
                      ),
                                        ),
                    );
                   /* Container(
                      height: height / 1.68516,
                      margin: EdgeInsets.only(bottom: height / 43.3),

                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          /// post content Widgets
                          Padding(
                            padding: EdgeInsets.only(top: height / 43.3),
                            child: Material(
                              shadowColor: Colors.black87,
                              elevation: 10,
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(15),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width / 34.25,
                                    vertical: height / 72.16666666666667),
                                child: Container(
                                  color: whiteColor,
                                  height: height / 1.85416,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    spacing: 4,
                                    children: [
                                      /// post Name and more icon
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          /// Text Widgets
                                          SizedBox(
                                              width: width / 2.74,
                                              child: customText(
                                                textName: 'Marina .krishna',
                                                textStyle: fontStyle.fontStyleAboreto(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: width / 25.6875),
                                              )),

                                          /// Post time and more icon
                                          SizedBox(
                                            width: width / 5.1375,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  right: width / 102.75),
                                              child: Row(
                                                spacing: 10,
                                                mainAxisAlignment:
                                                MainAxisAlignment.end,
                                                children: [
                                                  customText(
                                                    textName: '6 min',
                                                    textStyle:
                                                    fontStyle.fontStyleAboreto(
                                                      fontSize: width / 25.6875,
                                                      fontColor: titleColor,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                  FaIcon(
                                                    FontAwesomeIcons.ellipsisVertical,
                                                    color: greyColor,
                                                    size: width / 22.83333333333333,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      SizedBox(
                                        height: height / 86.6,
                                      ),

                                      /// Post Container

                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) => detailsScreen(),
                                          ));
                                        },
                                        child: carousalSlider(imgList: data.image),
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
                                                  buttonWidth:valueOfData
                                                      .postReachList[
                                                  index]
                                                      .like !=
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
                                                          textName: valueOfData
                                                              .postReachList[
                                                          index]
                                                              .like !=
                                                              0
                                                              ? '${valueOfData.formatNumber(value: double.parse(data.like.toString()))}k'
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
                                                    valueOfData.updateTheCount(index: index,type: 'like');
                                                  },
                                                ),

                                                /// comment Button

                                                customButton(
                                                  buttonHeight: height / 43.3,
                                                  buttonWidth:valueOfData
                                                      .postReachList[
                                                  index]
                                                      .comment !=
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
                                                        textName: valueOfData
                                                            .postReachList[
                                                        index]
                                                            .comment !=
                                                            0
                                                            ? '${valueOfData.formatNumber(value: double.parse(data.comment.toString()))}k'
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
                                                    valueOfData.updateTheCount(index: index,type: 'comment');
                                                  },
                                                ),

                                                ///share Button
                                                customButton(
                                                  buttonHeight: height / 43.3,
                                                  buttonWidth:
                                                  valueOfData
                                                      .postReachList[
                                                  index]
                                                      .share !=
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
                                                        textName: valueOfData
                                                            .postReachList[
                                                        index]
                                                            .share !=
                                                            0
                                                            ? '${valueOfData.formatNumber(value: double.parse(data.share.toString()))}k'
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
                                                        .shareImageToWhatsApp(imagePath: data.image!.first);

                                                    valueOfData.updateTheCount(index: index,type: 'share');
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
                                                'https://m.media-amazon.com/images/I/61H6elOlc+L.jpg',
                                                'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/PNG_transparency_demonstration_1.png/640px-PNG_transparency_demonstration_1.png'
                                              ], context: context);
                                            },
                                          ),
                                        ],
                                      ),

                                      /// description Text Widgets
                                      SizedBox(
                                          height: height / 19.24444444444444,
                                          child: customText(
                                              overflow: TextOverflow.ellipsis,
                                              maxLine: 2,
                                              textStyle: fontStyle.fontStyleAboreto(
                                                fontSize: width / 25.6875,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textName:
                                              data.postDescription.toString())),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          /// Image (post ) widgets
                          Material(
                            color: greyColor,
                            elevation: 5,
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1zwhySGCEBxRRFYIcQgvOLOpRGqrT3d7Qng&s'))),
                              height: height / 17.32,
                              width: width / 8.22,
                            ),
                          ),
                        ],
                      ),
                    );*/
                }):
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: valueOfData.dataList.length,
                itemBuilder: (context, index) {
                  var data=valueOfData.dataList[index];

                  return
                    Container(
                      height: height / 1.70416,
                      margin: EdgeInsets.only(bottom: height / 43.3),

                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          /// post content Widgets
                          Padding(
                            padding: EdgeInsets.only(top: height / 43.3),
                            child: Material(
                              shadowColor: Colors.black87,
                              elevation: 10,
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(15),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width / 34.25,
                                    vertical: height / 72.16666666666667),
                                child: SizedBox(
                                  height: height / 1.80416,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    spacing: 4,
                                    children: [

                                      /// post Name and more icon
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          /// Text Widgets
                                          SizedBox(
                                              width: width / 2.74,
                                              child: customText(
                                                textName:data.author.toString(),
                                                textStyle: fontStyle.fontStyleAboreto(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: width / 25.6875),
                                              )),

                                          /// Post time and more icon
                                          SizedBox(
                                            width: width / 5.1375,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  right: width / 102.75),
                                              child: Row(
                                                spacing: 10,
                                                mainAxisAlignment:
                                                MainAxisAlignment.end,
                                                children: [
                                                  customText(
                                                    textName: '6 min',
                                                    textStyle:
                                                    fontStyle.fontStyleAboreto(
                                                      fontSize: width / 25.6875,
                                                      fontColor: titleColor,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                  FaIcon(
                                                    FontAwesomeIcons.ellipsisVertical,
                                                    color: greyColor,
                                                    size: width / 22.83333333333333,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      SizedBox(
                                        height: height / 86.6,
                                      ),

                                      /// Post Container

                                      InkWell(
                                        onTap: () {
                                          if(valueOfData.isLoading==false){
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                              builder: (context) => detailsScreen(
                                                userName: data.author,
                                                desCription: homeCon.postDescription,
                                                imgUrl: data.downloadUrl,
                                              ),
                                            ));
                                          }
                                        },
                                        child: CachedNetworkImage(
                                          imageUrl: data.downloadUrl.toString(),
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
                                                        .shareImageToWhatsApp(imagePath: data.downloadUrl.toString());

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
                                                data.downloadUrl.toString()
                                              ], context: context);
                                            },
                                          ),
                                        ],
                                      ),

                                      /// description Text Widgets
                                      SizedBox(
                                          height: height / 19.24444444444444,
                                          child: customText(
                                              overflow: TextOverflow.ellipsis,
                                              maxLine: 2,
                                              textStyle: fontStyle.fontStyleAboreto(
                                                fontSize: width / 25.6875,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textName:
                                              homeCon.postDescription.toString())),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          /// Image (post ) widgets
                          Material(
                            color: greyColor.withOpacity(0.5),
                            elevation: 5,
                            borderRadius: BorderRadius.circular(15),
                            child: CachedNetworkImage(
                              imageUrl: data.downloadUrl.toString(),
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
                            ),
                          ),
                        ],
                      ),
                    );
                  /* Container(
                      height: height / 1.68516,
                      margin: EdgeInsets.only(bottom: height / 43.3),

                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          /// post content Widgets
                          Padding(
                            padding: EdgeInsets.only(top: height / 43.3),
                            child: Material(
                              shadowColor: Colors.black87,
                              elevation: 10,
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(15),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width / 34.25,
                                    vertical: height / 72.16666666666667),
                                child: Container(
                                  color: whiteColor,
                                  height: height / 1.85416,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    spacing: 4,
                                    children: [
                                      /// post Name and more icon
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          /// Text Widgets
                                          SizedBox(
                                              width: width / 2.74,
                                              child: customText(
                                                textName: 'Marina .krishna',
                                                textStyle: fontStyle.fontStyleAboreto(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: width / 25.6875),
                                              )),

                                          /// Post time and more icon
                                          SizedBox(
                                            width: width / 5.1375,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  right: width / 102.75),
                                              child: Row(
                                                spacing: 10,
                                                mainAxisAlignment:
                                                MainAxisAlignment.end,
                                                children: [
                                                  customText(
                                                    textName: '6 min',
                                                    textStyle:
                                                    fontStyle.fontStyleAboreto(
                                                      fontSize: width / 25.6875,
                                                      fontColor: titleColor,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                  FaIcon(
                                                    FontAwesomeIcons.ellipsisVertical,
                                                    color: greyColor,
                                                    size: width / 22.83333333333333,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      SizedBox(
                                        height: height / 86.6,
                                      ),

                                      /// Post Container

                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) => detailsScreen(),
                                          ));
                                        },
                                        child: carousalSlider(imgList: data.image),
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
                                                  buttonWidth:valueOfData
                                                      .postReachList[
                                                  index]
                                                      .like !=
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
                                                          textName: valueOfData
                                                              .postReachList[
                                                          index]
                                                              .like !=
                                                              0
                                                              ? '${valueOfData.formatNumber(value: double.parse(data.like.toString()))}k'
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
                                                    valueOfData.updateTheCount(index: index,type: 'like');
                                                  },
                                                ),

                                                /// comment Button

                                                customButton(
                                                  buttonHeight: height / 43.3,
                                                  buttonWidth:valueOfData
                                                      .postReachList[
                                                  index]
                                                      .comment !=
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
                                                        textName: valueOfData
                                                            .postReachList[
                                                        index]
                                                            .comment !=
                                                            0
                                                            ? '${valueOfData.formatNumber(value: double.parse(data.comment.toString()))}k'
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
                                                    valueOfData.updateTheCount(index: index,type: 'comment');
                                                  },
                                                ),

                                                ///share Button
                                                customButton(
                                                  buttonHeight: height / 43.3,
                                                  buttonWidth:
                                                  valueOfData
                                                      .postReachList[
                                                  index]
                                                      .share !=
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
                                                        textName: valueOfData
                                                            .postReachList[
                                                        index]
                                                            .share !=
                                                            0
                                                            ? '${valueOfData.formatNumber(value: double.parse(data.share.toString()))}k'
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
                                                        .shareImageToWhatsApp(imagePath: data.image!.first);

                                                    valueOfData.updateTheCount(index: index,type: 'share');
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
                                                'https://m.media-amazon.com/images/I/61H6elOlc+L.jpg',
                                                'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/PNG_transparency_demonstration_1.png/640px-PNG_transparency_demonstration_1.png'
                                              ], context: context);
                                            },
                                          ),
                                        ],
                                      ),

                                      /// description Text Widgets
                                      SizedBox(
                                          height: height / 19.24444444444444,
                                          child: customText(
                                              overflow: TextOverflow.ellipsis,
                                              maxLine: 2,
                                              textStyle: fontStyle.fontStyleAboreto(
                                                fontSize: width / 25.6875,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textName:
                                              data.postDescription.toString())),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          /// Image (post ) widgets
                          Material(
                            color: greyColor,
                            elevation: 5,
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1zwhySGCEBxRRFYIcQgvOLOpRGqrT3d7Qng&s'))),
                              height: height / 17.32,
                              width: width / 8.22,
                            ),
                          ),
                        ],
                      ),
                    );*/
                }),
          ],
        );
      },
    );
  }
}

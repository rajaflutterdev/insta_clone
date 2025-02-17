import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/Controller/provider/apiService/apiService.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../untils/homeScreenUntils/homeScreenUntils.dart';
import '../stroyContainer/stroyContainer.dart';

class storyWidgets extends StatefulWidget {


  @override
  State<storyWidgets> createState() => _storyWidgetsState();
}

class _storyWidgetsState extends State<storyWidgets> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var data = Provider.of<ApiService>(context);
    return
      data.isLoading?
      ListView.builder(
        itemCount: 6,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return
            Padding(
              padding:  EdgeInsets.only(left: width/68.5, right: width/68.5, bottom: height/433,top: height/288.666),
              child: Shimmer.fromColors(
                enabled: true,
                baseColor: greyColor.withOpacity(0.4),
                highlightColor: Colors.red.withOpacity(0.4),
                child: stroyContainer(
                  elevation: 0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  onTap: () {},
                ),
              )
            );
        },
      ):
      ListView.builder(
      itemCount: data.dataList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {

        return

          Padding(
          padding:  EdgeInsets.only(left: width/68.5, right: width/68.5, bottom: height/433,top: height/288.666),
          child: CachedNetworkImage(
            imageUrl: data.dataList[index].downloadUrl.toString(),
            imageBuilder: (context, imageProvider) =>
                stroyContainer(
                  elevation: 0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: imageProvider)
                  ),
                  onTap: () {},
                ),
            placeholder: (context, url) =>
                Shimmer.fromColors(
              enabled: true,
              baseColor: greyColor.withOpacity(0.4),
              highlightColor: Colors.red.withOpacity(0.4),
              child: stroyContainer(
                
                elevation: 0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                ),
                onTap: () {},
              ),
            ),
            errorWidget: (context, url, error) => SizedBox(),
          ),
        );
      },
    );
  }
}

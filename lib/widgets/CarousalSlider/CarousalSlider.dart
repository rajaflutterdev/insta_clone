
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Controller/provider/homeController.dart';

class carousalSlider extends StatefulWidget {
 List?imgList;



 carousalSlider({this.imgList});

  @override
  State<carousalSlider> createState() => _carousalSliderState();
}

class _carousalSliderState extends State<carousalSlider> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Consumer<homeContent>(
      builder: (context, data, child) {
      return Container(
          height: height / 2.5866,
          width: width / 1.141666666666667,
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              CarouselSlider.builder(
                itemCount: widget.imgList!.length,
                carouselController: CarouselSliderController(),
                itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex){

                  return
                    Container(
                      height: height / 2.8866,
                      width: width / 1.141666666666667,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(widget.imgList![itemIndex]))
                      ),

                    );
                },

                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    data.updateCarousalCount(index: index);
                  },
                    autoPlay: false,
                    scrollPhysics: BouncingScrollPhysics(),
                    aspectRatio: 1.0,
                    height: height / 2.8866,
                    viewportFraction: 1.1
                ),
              ),
               Padding(
            padding:  EdgeInsets.only(top: height/108.25),
            child: DotsIndicator(
              dotsCount: widget.imgList!.length,
              position: data.sliderIndex.toDouble(),
              animate: true,

              decorator: DotsDecorator(
                size: const Size.square(6.0),
                activeSize: const Size(15.0, 6.0),
                activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
          ),


            ],
          )

        /* CarouselSlider(
        options: CarouselOptions(
          onScrolled: (value) {

          },
          autoPlay: false,
          aspectRatio: 1.0,
          height: height / 2.8866,
          viewportFraction: 1.1
        ),
        items: widget.imgList!.map((imageUrl) {
          return
            Container(
            height: height / 2.8866,
            width: width / 1.141666666666667,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(imageUrl))
            ),
          );
        }).toList(),
      ),*/
      );
    },);
  }
}


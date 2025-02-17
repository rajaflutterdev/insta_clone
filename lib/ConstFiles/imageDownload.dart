import 'dart:io';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:insta_clone/customWidgets/customText/customText.dart';
import 'package:insta_clone/customWidgets/gradientContainer/gradientContainer.dart';
import 'package:insta_clone/untils/homeScreenUntils/homeScreenUntils.dart';
import 'package:share_plus/share_plus.dart';


class imageDownload extends ChangeNotifier {

  String imageData = '';
  bool dataLoaded = false;
  final random = Random();

  asyncMethod({List<String>? urls, BuildContext? context}) async {


    if (urls == null || context == null ||urls.isEmpty) {

      return;
    }
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    dataLoaded = true;
    notifyListeners();
    if(dataLoaded){
      loadingDialog(context: context,show: false);
      notifyListeners();
    }
    else{
      Navigator.pop(context);
      notifyListeners();
    }
    try {
      for (var url in urls) {
        var response = await get(Uri.parse(url));
        if (response.statusCode == 200) {
          Directory? downloadsDirectory = Directory('/storage/emulated/0/Download');
          if (await downloadsDirectory.exists()) {
            var firstPath = "${downloadsDirectory.path}/images";
            await Directory(firstPath).create(recursive: true);
            var filePathAndName = '$firstPath/${random.nextInt(100000)}_pic.jpg';
            File file = File(filePathAndName);
            await file.writeAsBytes(response.bodyBytes);
            imageData = filePathAndName;


            /* scaffoldMessenger.showSnackBar(SnackBar(
              content: Text(
                "Downloaded Successfully",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Color(0xFFe91e63),
            ));*/
          }
          dataLoaded = false;
          notifyListeners();
        }

      }
    }
    catch (e) {
      scaffoldMessenger.showSnackBar(SnackBar(
        content: Text(
          "Error Downloading Image",
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFFe91e63),
      ));
    }
    finally {
      dataLoaded = false;
      imageData = '';
      Navigator.pop(context);
      scaffoldMessenger.showSnackBar(SnackBar(
        content: Text(
          "Downloading Image Success",
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFFe91e63),
      ));
      notifyListeners();
    }
  }

 shareImageToWhatsApp({required String imagePath}) async {
    // final url=Uri.parse(imagePath);
    // final res =await http.get(url);
    // final bytes=res.bodyBytes;
    // final temp=await getTemporaryDirectory();
    // final path="${temp.path}/image.jpg";
    // File(path).writeAsBytesSync(bytes);
    // final xFile=XFile(path);
    // await Share.shareXFiles([xFile],text: 'Check Out This Post');
    Share.share(imagePath, subject: "Check out this link!");


  }
  
  
  loadingDialog({context, required bool show}){
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    showDialog(
      barrierDismissible: show,
      context: context, builder: (context) => AlertDialog(
      backgroundColor: Colors.transparent,
      content: gradientContainer(
        height: height/4.81111,
        width: width/2.56875,
        bgColorShow: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 30,
          children: [
            /// Text Widgets
            customText(textName: 'Please Wait ...',textStyle: fontStyle.fontStyleAboreto(
              fontColor: whiteColor,
              fontSize: width/22.833
            ),),
            SizedBox(
              height: height/14.433,
              width: width/6.85,
              child: CircularProgressIndicator(
                color: whiteColor,
                strokeWidth: width/68.5,

              ),
            )
          ],
        ),),
      ),
    );
    
    
    
  }

}



import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Model/instaModel.dart';
import 'package:connectivity_plus/connectivity_plus.dart';



class ApiService extends ChangeNotifier {
  String url = 'https://picsum.photos/v2/list';
  List<instaModel> dataList = [];
  bool isLoading=false;

  fetchApiData() async {
    isLoading=true;
    notifyListeners();
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      var cachedData = await getCachedData();
      if (cachedData != null && cachedData.isNotEmpty) {
        dataList = cachedData;

        isLoading=false;
        notifyListeners();
      }
    }
    else {
      // Connected to the internet, fetch data from API
      var res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        var body = res.body;
        var jsonData = jsonDecode(body) as List;
        dataList = jsonData.map((e) => instaModel.fromJson(e)).toList();

        // Cache the data
        cacheData();
        isLoading=false;
        notifyListeners();
      } else {
        isLoading=false;
        notifyListeners();


      }
    }
    notifyListeners();
  }

  cacheData() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> jsonData = dataList.map((item) => json.encode(item.toJson())).toList();
    await prefs.setStringList('cached_data', jsonData);
  }

  Future<List<instaModel>?> getCachedData() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? jsonData = prefs.getStringList('cached_data');

    if (jsonData == null || jsonData.isEmpty) return null;

    return jsonData.map((item) => instaModel.fromJson(json.decode(item))).toList();
  }
}

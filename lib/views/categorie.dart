import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:walpaperapp/data/data.dart';
import 'package:walpaperapp/model/walpaper_model.dart';
import 'package:walpaperapp/widget/widgets.dart';

class Categories extends StatefulWidget {

  final String categoriesName;
  Categories({this.categoriesName});
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  List<WallpaperModel> wallpapers = new List();

  @override
  void initState() {
    // TODO: implement initState
    getSearchWallpaper(widget.categoriesName);
    super.initState();
  }


  getSearchWallpaper(String query) async {
    var response = await http.get(
        "https://api.pexels.com/v1/search?query=$query&per_page=15&page=1",
        headers: {"Authorization": apiKey});
    //print(response.body.toString());

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      //print(element);
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              wallpapersList(wallpapers: wallpapers, context: context)
            ],
          ),
        ),
      ),
    );
  }
}

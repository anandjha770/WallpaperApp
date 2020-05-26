import 'package:flutter/material.dart';
import 'package:walpaperapp/model/walpaper_model.dart';
import 'package:walpaperapp/views/image_view.dart';

Widget brandName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        "Walpaper",
        style: TextStyle(color: Colors.black87),
      ),
      Text(
        "Hub",
        style: TextStyle(color: Colors.blue),
      )
    ],
  );
}

Widget wallpapersList({List<WallpaperModel> wallpapers, context}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers.map((walpaper) {
        return GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ImageView(
                    imgUrl: walpaper.src.portrait,
                  )));
            },
            child: Hero(
              tag: walpaper.src.portrait,
              child: Container(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        walpaper.src.portrait,
                        fit: BoxFit.cover,
                      ))),
            ),
          ),
        );
      }).toList(),
    ),
  );
}

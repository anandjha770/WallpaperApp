import 'package:flutter/material.dart';

class ImageView extends StatefulWidget {
  final String imgUrl;

  ImageView({@required this.imgUrl});

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: widget.imgUrl,
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  widget.imgUrl,
                  fit: BoxFit.cover,
                )),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap:(){
                    Navigator.pop(context);
                  },
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width/2,
                        height: 60,
                        color: Color(0xff1C1B1B).withOpacity(0.8),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/2,
                        height: 60,
                        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                        decoration:
                        BoxDecoration(
                            border: Border.all(color: Colors.white60,width: 1),
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                                colors: [
                                  Color(0x36FFFFFF),
                                  Color(0x0FFFFFFF),
                                ])),
                        child: Column(
                          children: <Widget>[
                            Text("Set Wallpaper",style: TextStyle(
                                fontSize: 16,color: Colors.white
                            ),),
                            SizedBox(height: 4,),
                            Text("Image will be saved in gallery",style: TextStyle(
                                fontSize: 10,color: Colors.white
                            ),)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  "Cancle",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

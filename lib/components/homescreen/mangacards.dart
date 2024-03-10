import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nhen_app/screens/detailscreen.dart';
import 'package:nhen_app/screens/homescreen.dart';

class MangaCard extends StatelessWidget {
  final String mangaImg;
  final String mangaTitle;
  final String mangaUrl;

  const MangaCard({
    super.key,
    required this.mangaImg,
    required this.mangaTitle,
    required this.mangaUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 130,
      // margin: EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                    mangaImg: mangaImg,
                    mangaTitle: mangaTitle,
                    mangaUrl: mangaUrl),
              ));

          // print(mangaTitle);
          // print(mangaImg);
          // print(mangaUrl);
        },
        child: Column(
          children: [
            Expanded(
              flex: 60,
              child: Container(
                child: Image.network(
                  mangaImg,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return SpinKitRing(
                      color: Colors.blue,
                      size: 30,
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 27,
              child: Container(
                  child: Text(
                (mangaTitle),
                style: TextStyle(color: Colors.white),
              )),
            ),
          ],
        ),
      ),
    );
  }
}

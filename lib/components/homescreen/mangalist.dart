import 'package:flutter/material.dart';
import 'mangacards.dart';

class MangaList extends StatelessWidget {
  final List<Map<String, dynamic>> mangaList; // to get the list of manga
  final List<Map<String, dynamic>> mangaUrlList; // to get the list of manga

  const MangaList(
      {Key? key, required this.mangaList, required this.mangaUrlList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height,
      width: screenSize.width,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Wrap(
          spacing: 0,
          children: [
            Container(
              width: double.infinity,
              height: 30,
              margin: EdgeInsets.fromLTRB(10, 0, 0, 5),
              padding: EdgeInsets.only(left: 5),
              alignment: Alignment.centerLeft,
              child: Text(
                "Manga's Available: ${mangaList.length}",
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
            // mangaList.map((e) => )
            for (int i = 0; i < mangaList.length; i++)
              MangaCard(
                mangaImg: mangaList[i]['attributes']['src'],
                mangaTitle: mangaList[i]['attributes']['alt'],
                mangaUrl: mangaUrlList[i]['attributes']['href'],
              )
          ],
        ),
      ),
    );
  }
}

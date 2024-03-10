import 'package:flutter/material.dart';

class MangaChapters extends StatelessWidget {
  final List<Map<String, dynamic>> mangaChapters;

  const MangaChapters({super.key, required this.mangaChapters});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: mangaChapters.length,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            width: double.infinity,
            child: Material(
              color: Colors.black,
              child: InkWell(
                onTap: () => print(mangaChapters[index]['attributes']['href']),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "* " + mangaChapters[index]['title'],
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

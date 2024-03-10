import 'package:flutter/material.dart';
import 'package:nhen_app/detailScreen/mangadec.dart';
import 'package:nhen_app/widget/horidiv.dart';
import 'package:nhen_app/widget/mangainfobtn.dart';

class MangaInfo extends StatelessWidget {
  late String mangaImg;
  late String mangaTitle;
  late String mangaUrl;
  late String mangaAutr;
  late String mangaStat;
  late String mangagen;
  late String mangadis;

  MangaInfo({
    super.key,
    required this.mangaImg,
    required this.mangaTitle,
    required this.mangaUrl,
    required this.mangaAutr,
    required this.mangaStat,
    required this.mangadis,
    required this.mangagen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      child: Stack(
        children: [
          Opacity(
            opacity: 0.1,
            child: Positioned(
              child: Image.network(
                width: MediaQuery.of(context).size.width,
                height: 500,
                mangaImg,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                  child: Container(
                height: 20,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(bottom: 10)),
                    Container(
                      height: 200,
                      margin: EdgeInsets.only(
                          left: 17, right: 17, top: 60, bottom: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          height: 200,
                          width: 150,
                          mangaImg,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      height: 191,
                      margin: EdgeInsets.only(
                        top: 80,
                        right: 7,
                      ),
                      child: Column(
                        children: [
                          Text(
                            mangaTitle,
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          // ignore: prefer_const_constructors
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Icon(
                                Icons.person_outline_sharp,
                                color: Colors.white70,
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 5, bottom: 0)),
                              Text(
                                mangaAutr,
                                style: TextStyle(color: Colors.white60),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "- - - - ${mangaStat}",
                                style: TextStyle(color: Colors.white60),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
              )),
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                      Colors.black,
                      Colors.transparent,
                    ])),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MangaInfoBtn(icon: Icons.play_arrow, title: "Read First"),
                    MangaInfoBtn(
                        icon: Icons.favorite_border_sharp, title: "In Library"),
                    MangaInfoBtn(icon: Icons.refresh, title: "Refresh"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 8, 5),
                child: Column(
                  children: [
                    MangaDec(
                        mangaDec: this.mangadis, mangaGeneres: this.mangagen),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

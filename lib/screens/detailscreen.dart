import 'package:flutter/material.dart';
import 'package:nhen_app/detailScreen/mangachapters.dart';
import 'package:nhen_app/detailScreen/mangainfo.dart';
import 'package:web_scraper/web_scraper.dart';

class DetailScreen extends StatefulWidget {
  late String mangaImg, mangaTitle, mangaUrl;

  DetailScreen(
      {super.key,
      required this.mangaImg,
      required this.mangaTitle,
      required this.mangaUrl});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String mangaGenres = 'hello';
  String mangaAuthor = 'hello';
  String mangaDecription = 'hello';
  String mangaStatus = 'hello';
  late List<Map<String, dynamic>> mangaDetail;
  late List<Map<String, dynamic>> mangaDecList;
  late List<Map<String, dynamic>> mangaChapters = [];

  bool datafech = false;

  void getMangaInfo() async {
    try {
      String tempBaseUrl = widget.mangaUrl.split(".com")[0];
      String tempRoute = widget.mangaUrl.split(".com")[1];

      final webscraper = WebScraper(tempBaseUrl);

      if (await webscraper.loadWebPage(tempRoute)) {
        mangaDetail = webscraper.getElement(
          'div.body-site > div.container.container-main > div.container-main-left > div.panel-story-info > div.story-info-right > tbody > tr > td.table-value',
          [],
        );
        mangaDecList = webscraper.getElement(
          'div.container.container-main > div.container-main-left > div.panel-story-info > div#panel-story-info-description.panel-story-info-description',
          [],
        );
        mangaChapters = webscraper.getElement(
          'div.container.container-main > div.container-main-left > div.panel-story-chapter-list > ul > li > a',
          ['href'],
        );
        mangaGenres = mangaDetail[3]['title'].toString();
        mangaStatus = mangaDetail[2]['title'].toString();
        mangaAuthor = mangaDetail[1]['title'].toString();
        mangaDecription = mangaDecList[0]['title'].toString();
        print(mangaDetail);
      }

      setState(() {
        datafech = true;
      });
    } catch (e) {
      // Handle the exception here
      print("Error during web scraping: $e");
      // Optionally, show a message to the user or perform other actions.
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMangaInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: AppBar(
              backgroundColor: Colors.black,
            )),
        backgroundColor: Colors.black,
        body: datafech
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          MangaInfo(
                            mangaImg: widget.mangaImg,
                            mangaTitle: widget.mangaTitle,
                            mangaUrl: widget.mangaUrl,
                            mangaStat: mangaStatus,
                            mangaAutr: mangaAuthor,
                            mangadis: mangaDecription,
                            mangagen: mangaGenres,
                          ),
                          MangaChapters(mangaChapters: mangaChapters),

                          //will have manga info
                          //will have manga decription
                          //will have chapters list
                        ],
                      ),
                      // child:Column(
                      //   children: [
                      //     MangaChapters(mangaChapters: mangaChapters),
                      //   ],
                      // ),
                    ),
                  ],
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}

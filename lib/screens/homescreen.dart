import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nhen_app/components/homescreen/mangacards.dart';
import 'package:nhen_app/constants/constants.dart';
import 'package:nhen_app/widget/bottnavwidget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:web_scraper/web_scraper.dart';
import 'package:nhen_app/components/homescreen/mangalist.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool mangaloaded = false;
  late List<Map<String, dynamic>> mangaList; // to get the list of manga
  late List<Map<String, dynamic>> mangaUrlList; // to get the url for the manga
  // to get the url for the manga
  //for bottom navbar navigation Start
  int SelectedNavIndex = 0;
  void navBarTab(int inde) {
    setState(() {
      SelectedNavIndex = inde;
    });
  } // End

  void fechManga() async {
    final webscraper = WebScraper(Constants.baseURL);
    if (await webscraper.loadWebPage('/wwww')) {
      mangaList = webscraper.getElement(
        ' div.body-site > div.container.container-main > div.container-main-left > div.panel-content-homepage >  div > a > img',
        ['src', 'alt'],
      );
      mangaUrlList = webscraper.getElement(
        ' div.body-site >  div.container.container-main > div.container-main-left > div.panel-content-homepage > div.content-homepage-item > a',
        ['href'],
      );
      setState(() {
        mangaloaded = true; // Start
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fechManga();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size; //get screen size

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Browse",
          style: TextStyle(
              color: Colors.blue[200],
              fontSize: 27,
              fontStyle: FontStyle.italic),
        ),
        backgroundColor: Colors.black,
      ),
      body: mangaloaded
          ? MangaList(
              mangaList: mangaList,
              mangaUrlList: mangaUrlList,
            )
          : Center(
              child: SpinKitWave(
                color: Colors.blue[200],
                size: 40,
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blue[200],
        unselectedItemColor: Colors.white,
        currentIndex: SelectedNavIndex,
        onTap: navBarTab,
        items: [
          botNavItem(Icons.explore_outlined, "Browse"),
          botNavItem(Icons.collections_bookmark_outlined, "Manga"),
          botNavItem(Icons.history_sharp, "History"),
          botNavItem(Icons.more_horiz_sharp, "More"),
        ],
      ),
    );
  }
}

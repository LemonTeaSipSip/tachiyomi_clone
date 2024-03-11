import 'package:flutter/material.dart';
import 'package:nhen_app/screens/detailscreen.dart';
import 'package:nhen_app/screens/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
debugShowCheckedModeBanner: false,
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homescreen(),
      // home: DetailScreen(
      //     mangaImg: 'https://avt.mkklcdnv6temp.com/38/b/30-1688529849.jpg',
      //     mangaTitle: 'THE IDOLM@STER MILLION LIVE! Blooming Clover',
      //     mangaUrl: 'https://m.manganelo.com/manga-zg114452'),
    );
  }
}

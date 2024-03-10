import 'package:flutter/material.dart';
import 'package:nhen_app/widget/horidiv.dart';

class MangaDec extends StatefulWidget {
  final String mangaDec, mangaGeneres;

  const MangaDec({Key? key, required this.mangaDec, required this.mangaGeneres})
      : super(key: key);

  @override
  State<MangaDec> createState() => _MangaDecState();
}

class _MangaDecState extends State<MangaDec> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          HoriDivision(),
          Text(
            widget.mangaDec,
            style: TextStyle(color: Colors.white),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

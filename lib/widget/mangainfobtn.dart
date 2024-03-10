import 'package:flutter/material.dart';

class MangaInfoBtn extends StatelessWidget {
  final IconData icon;
  final String title;
  const MangaInfoBtn({super.key, required this.icon, required this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 30,
          color: Colors.white,
        ),
        Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 13),
        ),
      ],
    );
  }
}

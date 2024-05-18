import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onTap;

  const CategoryTile({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Image.asset(imagePath, fit: BoxFit.cover), // Use Image.asset for local images
          ),
          Text(title, style: TextStyle(fontSize: 16,fontFamily: 'subfont',)),
        ],
      ),
    );
  }
}
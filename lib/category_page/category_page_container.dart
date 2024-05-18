import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zzero/menu_detail_page/menu_detail_page.dart';

class CategoryPageContaienr extends StatefulWidget {
  final String url;
  final String name;
  const CategoryPageContaienr(
      {super.key, required this.url, required this.name});

  @override
  State<CategoryPageContaienr> createState() => _CategoryPageContaienrState();
}

class _CategoryPageContaienrState extends State<CategoryPageContaienr> {
  @override
  Widget build(BuildContext context) {
    String url = widget.url;
    return Container(
      width: 110,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MenuPage()));
            },
            child: Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  image: DecorationImage(
                      image: NetworkImage(url), fit: BoxFit.fill)),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            width: 110,
            child:Text(
            '${widget.name}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign:TextAlign.left,
            style: TextStyle(
              color: Color(0xFF2C2C2C),
              fontSize: 14,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w600,
            ),
          ),),
          Align(
            alignment: Alignment.topRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${Random().nextInt(5) + 1},${Random().nextInt(5)}00원',
                  style: TextStyle(
                    color: Color(0xFF2C2C2C),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.chat,
                      size: 12,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 1),
                    Text(
                      '${Random().nextInt(50)}',
                      style: TextStyle(
                        color: Color(0xFF949494),
                        fontSize: 10,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 8),
                    // Icon(
                    //   Icons.favorite,
                    //   size: 12,
                    //   color: Colors.grey,
                    // ),
                    // SizedBox(width: 1),
                    // Text(
                    //   '${Random().nextInt(50) + 50}',
                    //   style: TextStyle(
                    //     color: Color(0xFF949494),
                    //     fontSize: 10,
                    //     fontFamily: 'Pretendard',
                    //     fontWeight: FontWeight.w400,
                    //   ),
                    // )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

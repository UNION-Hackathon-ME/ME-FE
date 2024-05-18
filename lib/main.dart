import 'package:flutter/material.dart';
import 'package:zzero/category_page/category_page.dart';
import 'package:zzero/category_page/cheese_page.dart';
import 'package:zzero/game_page/grow_cow.dart';
import 'package:zzero/menu_detail_page/menu_detail_page.dart';
import 'package:zzero/my_page/my_page.dart';
import 'package:zzero/review_page/review_write.dart';
import 'home_page/main_page.dart';
import 'menu_detail_page/menu_detail_page.dart';
import 'category_page/category_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,color: Colors.white, home: MainPage());
  }
}

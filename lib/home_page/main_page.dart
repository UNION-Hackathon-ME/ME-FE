import 'package:flutter/material.dart';
import 'package:zzero/category_page/category_page.dart';
import 'package:zzero/components/Image_Slide.dart';
import 'package:zzero/components/search_box.dart';

import '../components/category_tile.dart';
import '../my_page/my_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController _searchController = TextEditingController();

  final List<String> imageUrls = [
    'assets/images/ad1.jpg', // 로컬 이미지 자산 경로 예시
    'assets/images/ad2.jpg',
    'assets/images/ad3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F7F7),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF5EA152),
          elevation: 0,
          title: Container(
            width: 110,
            height: 50, //로고 사이즈 임의 설정
            child: Image.asset('assets/images/moo.png',fit: BoxFit.contain,),
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
          ),//test
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.0), // 구분선 높이
            child: Container(
              color: Color(0xFF5EA152), // 구분선 색상 설정해주기
              height: 1.0,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 16.0,
              ),
              SearchBox(
                controller: _searchController,
              ), //검색상자'
              SizedBox(
                height: 16.0,
              ),
              ImageSlide(imageUrls: imageUrls),
              Container(
                alignment: Alignment.centerLeft, // 왼쪽 정렬
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "카테고리",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: "mainfont",
                    ),
                  ),
                ),
              ),
              GridView.count(
                shrinkWrap: true, physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 4, // 타일의 열 수 조정
                children: <Widget>[
                  CategoryTile(
                    imagePath: 'assets/images/cheese.png', //사진 넣어주기
                    title: '치즈',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryPage(
                                  sorting: '음료',
                                )),
                      );
                    },
                  ),
                  CategoryTile(
                    imagePath: 'assets/images/dairy.png', //사진 넣어주기
                    title: '유제품',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryPage(
                                  sorting: '아이스크림',
                                )), //페이지 라우팅 해주기
                      );
                    },
                  ),
                  CategoryTile(
                    imagePath: 'assets/images/protein.png', //사진 넣어주기
                    title: '프로틴',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryPage(
                                  sorting: '초콜릿',
                                )), //페이지 라우팅 해주기
                      );
                    },
                  ),
                  CategoryTile(
                    imagePath: 'assets/images/bug.png', //사진 넣어주기
                    title: '곤충',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryPage(
                                  sorting: '젤리/사탕',
                                )), //페이지 라우팅 해주기
                      );
                    },
                  ),
                  CategoryTile(
                    imagePath: 'assets/images/chicken.png', //사진 넣어주기
                    title: '닭고기',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryPage(
                                  sorting: '과자',
                                )),
                      );
                    },
                  ),
                  CategoryTile(
                    imagePath: 'assets/images/cow.png', //사진 넣어주기
                    title: '소고기',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryPage(
                                  sorting: '빵',
                                )), //페이지 라우팅 해주기
                      );
                    },
                  ),
                  CategoryTile(
                    imagePath: 'assets/images/pig.png', //사진 넣어주기
                    title: '돼지',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryPage(
                                  sorting: '술',
                                )), //페이지 라우팅 해주기
                      );
                    },
                  ),
                  CategoryTile(
                    imagePath: 'assets/images/fish.png', //사진 넣어주기
                    title: '어패류',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryPage(
                                  sorting: '기타식품',
                                )), //페이지 라우팅 해주기
                      );
                    },
                  ),
                ],
              ),
              Container(
                alignment: Alignment.centerLeft, // 왼쪽 정렬
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(height:35,child: Image.asset('assets/images/hot.png')),
                      Text(
                        "랭킹",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: "mainfont",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment:
                    MainAxisAlignment.spaceAround, // 박스 사이에 동일한 간격을 두기
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white),
                      height: 60,
                      child: Row(
                        children: [
                          SizedBox(width: 11),
                          Text(
                            '1',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF808080),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 11),
                          Text(
                            '라라스윗 저당 말차 초코바',
                            style: TextStyle(
                              color: Color(0xFF414141),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w300,
                              height: 0.09,
                              letterSpacing: -0.48,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white),
                      height: 60,
                      child: Row(
                        children: [
                          SizedBox(width: 11),
                          Text(
                            '2',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF808080),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 11),
                          Text(
                            '라라스윗 저당 생크림롤',
                            style: TextStyle(
                              color: Color(0xFF414141),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w300,
                              height: 0.09,
                              letterSpacing: -0.48,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white),
                      height: 60,
                      child: Row(
                        children: [
                          SizedBox(width: 11),
                          Text(
                            '3',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF808080),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 11),
                          Text(
                            '라라스윗 초콜릿 모나카',
                            style: TextStyle(
                              color: Color(0xFF414141),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w300,
                              height: 0.09,
                              letterSpacing: -0.48,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }
}

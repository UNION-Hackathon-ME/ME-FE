import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zzero/category_page/category_page_container.dart';
import 'package:zzero/components/search_box.dart';

class CategoryPage extends StatefulWidget {
  final String sorting;
  const CategoryPage({super.key, required this.sorting});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  bool isSugar = false;
  bool isKcal = false;
  List<Map> datas = [
    {
      "name": "실론티 레몬 제로 ",
      "url": "https://zzero-bucket.s3.ap-northeast-2.amazonaws.com/9.jpg"
    },
    {
      "name": "환타 제로 ",
      "url": "https://zzero-bucket.s3.ap-northeast-2.amazonaws.com/images.jpg"
    },
    {
      "name": "파워에이드 제로 ",
      "url": "https://zzero-bucket.s3.ap-northeast-2.amazonaws.com/2.jpg"
    },
    {
      "name": "웰치제로 오렌지맛 그레이프맛 ",
      "url": "https://zzero-bucket.s3.ap-northeast-2.amazonaws.com/3.jpg"
    },
    {
      "name": "비타 500 제로 ",
      "url": "https://zzero-bucket.s3.ap-northeast-2.amazonaws.com/5.jpg"
    },
    {
      "name": "밀키스 제로 ",
      "url":
          "https://zzero-bucket.s3.ap-northeast-2.amazonaws.com/milkisZero_01_250.jpg"
    },
    {
      "name": "밀키스 딸기 바나나 ",
      "url": "https://zzero-bucket.s3.ap-northeast-2.amazonaws.com/11.jpg"
    },
    {
      "name": "펩시 제로 슈가 ",
      "url": "https://zzero-bucket.s3.ap-northeast-2.amazonaws.com/12.jpg"
    },
    {
      "name": "밀키스 딸기 바나나 ",
      "url": "https://zzero-bucket.s3.ap-northeast-2.amazonaws.com/9.jpg"
    },
    {
      "name": "라라스윗 저당 말차 초코바 ",
      "url": "https://cdn.e2news.com/news/photo/202402/305847_205316_4627.jpg"
    },
    {
      "name": "라라스윗 저당 생크림롤 ",
      "url": "https://zzero-bucket.s3.ap-northeast-2.amazonaws.com/23.jpg"
    },
    {
      "name": "라라스윗 초콜릿 모나카 ",
      "url": "https://zzero-bucket.s3.ap-northeast-2.amazonaws.com/24.jpg"
    },
    {
      "name": "곤약 물냉면 ",
      "url": "https://zzero-bucket.s3.ap-northeast-2.amazonaws.com/41.jpg"
    },
    {
      "name": "저당불고기 ",
      "url": "https://zzero-bucket.s3.ap-northeast-2.amazonaws.com/51.jpg"
    },
    {
      "name": "몽쉘 제로 ",
      "url": "https://zzero-bucket.s3.ap-northeast-2.amazonaws.com/52.jpg"
    },
    {
      "name": "저칼로리 데리야끼 소스 ",
      "url": "https://zzero-bucket.s3.ap-northeast-2.amazonaws.com/42.jpg"
    },
    {
      "name": "제로 초콜릿 쿠키  ",
      "url": "https://zzero-bucket.s3.ap-northeast-2.amazonaws.com/090635.png"
    },
    {
      "name": "저당 크래커 아이비 ",
      "url": "https://zzero-bucket.s3.ap-northeast-2.amazonaws.com/090851.png"
    },
    {
      "name": "라라스윗 파인트 초코 ",
      "url": "https://zzero-bucket.s3.ap-northeast-2.amazonaws.com/22.jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    String sort = widget.sorting;
    return Scaffold(
      appBar: AppBar(
        title: Text(sort),
        centerTitle: true,
        elevation: 1.2,
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(height: 20),
              SearchBox(
                controller: TextEditingController(),
              ),
              SizedBox(height: 25),
              // Row(
              //   children: [
              //     const SizedBox(width: 16),
              //     GestureDetector(
              //       onTap: () {
              //         isSugar = !isSugar;
              //         setState(() {});
              //       },
              //       child: Container(
              //         height: 32,
              //         width: 100,
              //         alignment: Alignment.center,
              //         decoration: ShapeDecoration(
              //           color: Colors.white,
              //           shape: RoundedRectangleBorder(
              //             side: BorderSide(
              //                 width: 1,
              //                 color:
              //                     isSugar ? Color(0xFFADD67A) : Colors.white),
              //             borderRadius: BorderRadius.circular(999),
              //           ),
              //           shadows: const [
              //             BoxShadow(
              //               color: Color(0x19000000),
              //               blurRadius: 2,
              //               offset: Offset(0, 2),
              //               spreadRadius: 0,
              //             )
              //           ],
              //         ),
              //         child: Text(
              //           '제로 슈거',
              //           textAlign: TextAlign.center,
              //           style: TextStyle(
              //             color: Color(0xFF414141),
              //             fontSize: 16,
              //             fontFamily: 'Pretendard',
              //             fontWeight: FontWeight.w600,
              //           ),
              //         ),
              //       ),
              //     ),
              //     const SizedBox(width: 8),
              //     GestureDetector(
              //       onTap: () {
              //         isKcal = !isKcal;
              //         setState(() {});
              //       },
              //       child: Container(
              //         alignment: Alignment.center,
              //         height: 32,
              //         width: 100,
              //         decoration: ShapeDecoration(
              //           color: Colors.white,
              //           shape: RoundedRectangleBorder(
              //             side: BorderSide(
              //                 width: 1,
              //                 color: isKcal ? Color(0xFFFF93AD) : Colors.white),
              //             borderRadius: BorderRadius.circular(999),
              //           ),
              //           shadows: const [
              //             BoxShadow(
              //               color: Color(0x19000000),
              //               blurRadius: 2,
              //               offset: Offset(0, 2),
              //               spreadRadius: 0,
              //             )
              //           ],
              //         ),
              //         child: const Text(
              //           '제로 칼로리',
              //           textAlign: TextAlign.center,
              //           style: TextStyle(
              //             color: Color(0xFF414141),
              //             fontSize: 16,
              //             fontFamily: 'Pretendard',
              //             fontWeight: FontWeight.w600,
              //           ),
              //         ),
              //       ),
              //     )
              //   ],
              // ),
              // const SizedBox(height: 20),
              Container(
                  alignment: Alignment.topCenter,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: isSugar
                        ? isKcal
                            ? 3
                            : 6
                        : isKcal
                            ? 6
                            : 9,
                    itemBuilder: (BuildContext context, int index) {
                      if (index % 3 == 0) {
                        if (index < datas.length - 2) {
                          if (sort == '아이스크림') {
                            index = index + 9;
                          }
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CategoryPageContaienr(
                                  url: datas[index]['url'],
                                  name: datas[index]['name'],
                                ),
                                const SizedBox(width: 10),
                                CategoryPageContaienr(
                                    url: datas[index + 1]['url'],
                                    name: datas[index + 1]['name']),
                                const SizedBox(width: 10),
                                CategoryPageContaienr(
                                    url: datas[index + 2]['url'],
                                    name: datas[index + 2]['name'])
                              ],
                            ),
                          );
                        }
                      }
                      return Container();
                    },
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

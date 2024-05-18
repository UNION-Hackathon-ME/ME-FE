import 'package:flutter/material.dart';
import 'package:zzero/menu_detail_page/menu_detail_page.dart';

class MyReview extends StatefulWidget {
  const MyReview({super.key});

  @override
  State<MyReview> createState() => _MyReviewState();
}

class _MyReviewState extends State<MyReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '작성한 리뷰',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF2C2C2C),
            fontSize: 16,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF959595)), // 여기에서 아이콘 색상을 변경
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MenuPage())); // 여기에서 원하는 페이지로 이동
          },
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0), // 구분선 높이
          child: Container(
            color: Color(0xFF5EA152), // 구분선 색상 설정해주기
            height: 1.0,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          ListView.builder(
            itemCount: 1,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.only(left: 20, right: 30, top: 12),
                margin: EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.network('https://cdn.e2news.com/news/photo/202402/305847_205316_4627.jpg', fit: BoxFit.fill),
                          ),
                        ),
                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '라라스윗',
                              style: TextStyle(
                                color: Color(0xFF6B6B6B),
                                fontSize: 14,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              '라라스윗 저당 말차 초코바',
                              style: TextStyle(
                                color: Color(0xFF2C2C2C),
                                fontSize: 14,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete,
                              color: Colors.grey,
                            ))
                      ],
                    ),
                    SizedBox(height: 25),
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 2, vertical: 1),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 0.50, color: Color(0xFF949494)),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            child: Text(
                              '#맛 보장',
                              style: TextStyle(
                                color: Color(0xFF555555),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                        SizedBox(width: 6),
                        // Container(
                        //     padding: EdgeInsets.all(1),
                        //     decoration: ShapeDecoration(
                        //       shape: RoundedRectangleBorder(
                        //         side: BorderSide(
                        //             width: 0.50, color: Color(0xFF949494)),
                        //         borderRadius: BorderRadius.circular(4),
                        //       ),
                        //     ),
                        //     child: Text(
                        //       '#다이어트 보장',
                        //       style: TextStyle(
                        //         color: Color(0xFF555555),
                        //         fontSize: 12,
                        //         fontFamily: 'Pretendard',
                        //         fontWeight: FontWeight.w500,
                        //       ),
                        //     )),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/face3.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(width: 4),
                        Text('감미료 맛도 안나고 진한 말차맛이 나서 맛있어요!', maxLines: 2)
                      ],
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

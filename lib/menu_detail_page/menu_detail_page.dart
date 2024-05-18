import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zzero/review_page/review_write.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  bool isSugar = true;
  bool isKcal = true;
  bool isDetail = false;
  bool isFav = false;
  bool isReview = false;
  bool isGam = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '상품 상세',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF2C2C2C),
            fontSize: 16,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 270,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://cdn.e2news.com/news/photo/202402/305847_205316_4627.jpg'),
                          fit: BoxFit.cover)),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16, top: 8),
                    child: Row(children: [
                      isSugar
                          ? Container(
                              margin: EdgeInsets.only(right: 4),
                              height: 32,
                              width: 100,
                              alignment: Alignment.center,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1,
                                      color: isSugar
                                          ? Color(0xFFADD67A)
                                          : Colors.white),
                                  borderRadius: BorderRadius.circular(999),
                                ),
                                shadows: const [
                                  BoxShadow(
                                    color: Color(0x19000000),
                                    blurRadius: 2,
                                    offset: Offset(0, 2),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: const Text(
                                '제로 슈거',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF414141),
                                  fontSize: 16,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          : Container(),
                      isKcal
                          ? Container(
                              height: 32,
                              width: 100,
                              alignment: Alignment.center,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1,
                                      color: isSugar
                                          ? Color(0xFFFF93AD)
                                          : Colors.white),
                                  borderRadius: BorderRadius.circular(999),
                                ),
                                shadows: const [
                                  BoxShadow(
                                    color: Color(0x19000000),
                                    blurRadius: 2,
                                    offset: Offset(0, 2),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Text(
                                '제로 칼로리',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF414141),
                                  fontSize: 16,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          : Container()
                    ]),
                  ),
                )
              ],
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      _whereContainer('assets/images/cu.png', 'cu'),
                      _whereContainer('assets/images/lala.png', '라라스윗')
                    ],
                  ),
                  SizedBox(height: 20,),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Text(
                            '라라스윗 저당 말차 초코바',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      )),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '44,400',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 6),
                          Text(
                            '원',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 32,
                        height: 32,
                        child: GestureDetector(
                          onTap: () {
                            isFav = !isFav;
                            setState(() {});
                          },
                          child: isFav
                              ? Icon(Icons.favorite,
                                  color: Colors.red, size: 32)
                              : Icon(Icons.favorite_border_outlined, size: 32),
                        ),
                      ),
                      const SizedBox(width: 16)
                    ],
                  ),
                  SizedBox(height: 6),
                  Text(
                    '2개의 유의해야할 감미료가 포함되어 있어요!',
                    style: TextStyle(
                        color: Color(0xFF5EA152),
                        fontSize: 16,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 6),
                  SizedBox(
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 8, top: 8),
                            child: Text(
                              '대체감미료 (3개)',
                              style: TextStyle(
                                color: Color(0xFF555555),
                                fontSize: 16,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Stack(
                          children: [
                            Column(
                              children: [
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    SizedBox(width: 20),
                                    Container(
                                      width: 12,
                                      height: 12,
                                      decoration: ShapeDecoration(
                                        color:
                                            Color(0xFF13A284).withOpacity(0.3),
                                        shape: OvalBorder(),
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      '괜찮아요',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    Opacity(
                                      opacity: 0.30,
                                      child: Container(
                                        width: 12,
                                        height: 12,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFFB00000),
                                          shape: OvalBorder(),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      '유의해요',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    Opacity(
                                      opacity: 0.30,
                                      child: Container(
                                        width: 12,
                                        height: 12,
                                        decoration: ShapeDecoration(
                                          color: Colors.black,
                                          shape: OvalBorder(),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      '데이터가 부족해요',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 11),
                                SizedBox(
                                  height: 100,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 3,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            isGam = true;
                                            setState(() {});
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 4),
                                            width: 100,
                                            height: 100,
                                            decoration: ShapeDecoration(
                                              color: index == 0
                                                  ? Color(0xFF13A284)
                                                      .withOpacity(0.3)
                                                  : Color(0xFFB00000)
                                                      .withOpacity(0.3),
                                              shape: OvalBorder(),
                                            ),
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: 60,
                                              child: Text(
                                                index == 0
                                                    ? '알룰로스'
                                                    : index == 1
                                                        ? '에리스리톨'
                                                        : '효소처리 스테비아',
                                                maxLines: 3,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            isGam
                                ? Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 180,
                                      width: 380,
                                      color: Colors.white,
                                      child: Stack(
                                        children: [
                                          Align(
                                              alignment: Alignment.topRight,
                                              child: TextButton(
                                                child: Text('X'),
                                                onPressed: () {
                                                  isGam = false;
                                                  setState(() {});
                                                },
                                              )),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 30),
                                              Row(
                                                children: [
                                                  SizedBox(width: 30),
                                                  Text(
                                                    'I알룰로스I',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                      fontFamily: 'Pretendard',
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  SizedBox(width: 8),
                                                  Container(
                                                    width: 12,
                                                    height: 12,
                                                    decoration: ShapeDecoration(
                                                      color: Color(0xFF13A284)
                                                          .withOpacity(0.3),
                                                      shape: OvalBorder(),
                                                    ),
                                                  ),
                                                  SizedBox(width: 8),
                                                  Text(
                                                    '괜찮아요',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontFamily: 'Pretendard',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 10),
                                              Container(
                                                alignment: Alignment.center,
                                                margin:
                                                    EdgeInsets.only(left: 34),
                                                width: 110.13,
                                                height: 22.03,
                                                decoration: ShapeDecoration(
                                                    color: Color(0xFFEAEAEA),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4))),
                                                child: Text(
                                                  '천연 감미료',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontFamily: 'Pretendard',
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 20),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 30),
                                                child: Text(
                                                  '일반적인 섭취량 이내라면 안전합니다. \n다만 과량 섭취시 배탈을 유발합니다.',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontFamily: 'Pretendard',
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          '감미료를 터치하여 상세정보를 확인해보세요',
                          style: TextStyle(
                            color: Color(0xFFC0C0C0),
                            fontSize: 12,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const SizedBox(height: 12),
                  Container(
                    width: 343,
                    constraints: const BoxConstraints(minHeight: 56),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Container(height: 17),
                                  const Text(
                                    '원재료명, 영양정보 확인하기',
                                    style: TextStyle(
                                      color: Color(0xFF555555),
                                      fontSize: 16,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(0, 10),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                    width: 48,
                                    height: 48,
                                    child: GestureDetector(
                                      onTap: () {
                                        isDetail = !isDetail;
                                        setState(() {});
                                      },
                                      child: isDetail
                                          ? const Icon(
                                              Icons.keyboard_arrow_up_outlined,
                                              size: 36)
                                          : const Icon(
                                              Icons.keyboard_arrow_down,
                                              size: 36),
                                    )),
                              ),
                            )
                          ],
                        ),
                        isDetail
                            ? Container(
                                width: 343,
                                height: 320,
                                decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4)),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/detail_info.png'),
                                        fit: BoxFit.fitWidth)),
                                child: Container())
                            : Container()
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    child: Row(
                      children: [
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            isReview = false;
                            setState(() {});
                          },
                          child: Text(
                            '상품 정보',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: isReview
                                  ? Color(0xFF949494)
                                  : Color(0xFF555555),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )),
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            isReview = true;
                            setState(() {});
                          },
                          child: Text(
                            '리뷰',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: isReview
                                  ? Color(0xFF949494)
                                  : Color(0xFF555555),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ))
                      ],
                    ),
                  ),
                  isReview
                      ? Container(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 16, top: 16),
                                  child: Row(
                                    children: [
                                      Text(
                                        '리뷰',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        '32',
                                        style: TextStyle(
                                          color: Color(0xFF5EA152),
                                          fontSize: 16,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ReviewWrite(
                                            ),
                                      ));
                                },
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width - 32,
                                  height: 52,
                                  alignment: Alignment.center,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF5EA152),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4)),
                                  ),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.edit_outlined,
                                            size: 24, color: Colors.white),
                                        SizedBox(width: 4),
                                        Text(
                                          '리뷰쓰기',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      ]),
                                ),
                              ),
                              SizedBox(height: 24),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                              width: 107,
                                              height: 32,
                                              decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      width: 0.50,
                                                      color: Color(0xFF949494)),
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                '#맛 보장',
                                                style: TextStyle(
                                                  color: Color(0xFF555555),
                                                  fontSize: 14,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              )),
                                          SizedBox(width: 6),
                                          Text(
                                            '32',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color(0xFF555555),
                                              fontSize: 16,
                                              fontFamily: 'Pretendard',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 4),
                                      Row(
                                        children: [
                                          Container(
                                            width: 107,
                                            height: 32,
                                            decoration: ShapeDecoration(
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    width: 0.50,
                                                    color: Color(0xFF949494)),
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(
                                              '#다이어트 보장',
                                              style: TextStyle(
                                                color: Color(0xFF555555),
                                                fontSize: 14,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 6),
                                          Text(
                                            '92',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color(0xFF555555),
                                              fontSize: 16,
                                              fontFamily: 'Pretendard',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(width: 24),
                                  Container(
                                    height: 28,
                                    width: 1,
                                    color: Color(0xFFEAEAEA),
                                  ),
                                  SizedBox(width: 16),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/face3.png')),
                                                color: Colors.transparent),
                                          ),
                                          Text('90')
                                        ],
                                      ),
                                      SizedBox(width: 8),
                                      Column(
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/face2.png')),
                                                color: Colors.transparent),
                                          ),
                                          Text('76')
                                        ],
                                      ),
                                      SizedBox(width: 8),
                                      Column(
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/face1.png')),
                                                color: Colors.transparent),
                                          ),
                                          Text('59')
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Divider(
                                color: Colors.grey,
                                height: 1,
                                thickness: 1,
                              ),
                              SizedBox(height: 16),
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return _reviewContainer();
                                },
                              ),
                            ],
                          ),
                        )
                      : Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: 800,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/long.png'),
                                  fit: BoxFit.fitWidth)),
                        )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _whereContainer(String url, String name) {
    return Container(
      width: 180,
      height: 36,
      padding: EdgeInsets.only(left: 8, top: 6, bottom: 6),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration:
                BoxDecoration(image: DecorationImage(image: AssetImage(url))),
          ),
          SizedBox(width: 8),
          Text(name)
        ],
      ),
    );
  }

  Widget _reviewContainer() {
    return Container(
      padding: const EdgeInsets.only(left: 16, bottom: 16),
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: 50,
                height: 19,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 0.50, color: Color(0xFF949494)),
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
                ),
              ),
              const SizedBox(width: 4),
              Container(
                alignment: Alignment.center,
                height: 19,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 0.50, color: Color(0xFF949494)),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Text(
                  '#다이어트 보장',
                  style: TextStyle(
                    color: Color(0xFF555555),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 13),
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: const ShapeDecoration(
                  color: Color(0xFFF7F7F7),
                  shape: OvalBorder(),
                ),
              ),
              const Column(
                children: [
                  Text(
                    '닉네임',
                    style: TextStyle(
                      color: Color(0xFF414141),
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '2024. 05. 04',
                    style: TextStyle(
                      color: Color(0xFF949494),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        "assets/images/face${Random().nextInt(3) % 3 + 1}.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(width: 4),
              Text('맛있어요', maxLines: 2)
            ],
          )
        ],
      ),
    );
  }
}

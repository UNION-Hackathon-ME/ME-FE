import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zzero/review_page/review_write.dart';
// import 'package:zzero/api/api_';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  bool isDetail = false;
  bool isReview = false;
  late Future<Product> futureProducts;

  Future<Product> fetchProducts() async {
    // 서버에서 데이터를 가져오는 비동기 요청
    final response = await http.get(Uri.parse(
        'http://13.125.255.90:8080/api/product-detail?productId=23898979'));

    // print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      // 응답 데이터를 JSON으로 변환하여 Product 객체로 만들기
      final utf8DecodedBody = utf8.decode(response.bodyBytes);
      return Product.fromJson(jsonDecode(utf8DecodedBody));
    } else {
      // 응답이 실패한 경우 에러 던지기
      throw Exception('Failed to load product');
    }
  }

  @override
  void initState() {
    super.initState();
    //futureProducts = fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '상품 상세',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'mainfont',
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF5EA152),
      ),
      body: SingleChildScrollView(
        // child: Column(
        //   children: [
        //     Stack(
        //       children: [
        //         Container(
        //           width: MediaQuery.sizeOf(context).width,
        //           height: 270,
        //           decoration: BoxDecoration(
        //               color: Colors.grey,
        //               image: DecorationImage(
        //                   image: NetworkImage(
        //                       'https://sitem.ssgcdn.com/62/87/42/item/1000556428762_i1_1100.jpg'),
        //                   fit: BoxFit.cover)),
        //               ),
        //             ],
        //           ),
        //           const SizedBox(height: 12),
        //           Padding(
        //             padding: const EdgeInsets.only(left: 16, right: 16),
        //             child: Column(
        //               children: [
        //                 Row(
        //                   children: [
        //                     //_whereContainer('assets/images/cu.png', 'cu'),
        //                     _whereContainer('assets/images/lala.png', '풀무원')
        //                   ],
        //                 ),
        //                 SizedBox(height: 20,),
        //                 Align(
        //                     alignment: Alignment.topLeft,
        //                     child: Row(
        //                       children: [
        //                         Text(
        //                           '라라스윗 저당 말차 초코바',
        //                           style: TextStyle(
        //                             color: Colors.black,
        //                             fontSize: 20,
        //                             fontFamily: "subfont",
        //                             fontWeight: FontWeight.w600,
        //                           ),
        //                         ),
        //                       ],
        //                     )),
        //                 SizedBox(height: 6),
        //                 Row(
        //                   children: [
        //                     const Row(
        //                       crossAxisAlignment: CrossAxisAlignment.end,
        //                       children: [
        //                         Text(
        //                           '44,400',
        //                           style: TextStyle(
        //                             color: Colors.black,
        //                             fontSize: 20,
        //                             fontFamily: 'subfont',
        //                             fontWeight: FontWeight.w600,
        //                           ),
        //                         ),
        //                         SizedBox(width: 6),
        //                         Text(
        //                           '원',
        //                           style: TextStyle(
        //                             color: Colors.black,
        //                             fontSize: 18,
        //                             fontFamily: 'subfont',
        //                             fontWeight: FontWeight.w600,
        //                           ),
        //                         )
        //                       ],
        //                     ),
        //                     const Spacer(),
        //                     SizedBox(
        //                       width: 32,
        //                       height: 32,
        //                     ),
        //                     const SizedBox(width: 16)
        //                   ],
        //                 ),
        //                 SizedBox(height: 6),
        //                 const SizedBox(height: 20),
        //                 Container(
        //                   width: MediaQuery.sizeOf(context).width,
        //                   child: Row(
        //                     children: [
        //                       Expanded(
        //                           child: GestureDetector(
        //                             onTap: () {
        //                               isReview = false;
        //                               setState(() {});
        //                               },
        //                             child: Text(
        //                               '상품 정보',
        //                               textAlign: TextAlign.center,
        //                               style: TextStyle(
        //                                 color: isReview ? Color(0xFF949494) : Color(0xFF555555),
        //                                 fontSize: 16,
        //                                 fontFamily: 'subfont',
        //                                 fontWeight: FontWeight.w500,
        //                               ),
        //                             ),
        //                           )
        //                       ),
        //                       Expanded(
        //                           child: GestureDetector(
        //                             onTap: () {
        //                               isReview = true;
        //                               setState(() {});
        //                               },
        //                             child: Text(
        //                               '리뷰',
        //                               textAlign: TextAlign.center,
        //                               style: TextStyle(
        //                                 color: isReview ? Color(0xFF949494) : Color(0xFF555555),
        //                                 fontSize: 16,
        //                                 fontFamily: 'subfont',
        //                                 fontWeight: FontWeight.w500,
        //                               ),
        //                             ),
        //                           )
        //                       )
        //                     ],
        //                   ),
        //                 ),
        //                 isReview
        //                     ? Container(
        //                         child: Column(
        //                           children: [
        //                             Align(
        //                               alignment: Alignment.topLeft,
        //                               child: Padding(
        //                                 padding:
        //                                     const EdgeInsets.only(left: 16, top: 16),
        //                                 child: Row(
        //                                   children: [
        //                                     Text(
        //                                       '리뷰',
        //                                       style: TextStyle(
        //                                         color: Colors.black,
        //                                         fontSize: 16,
        //                                         fontFamily: 'subfont',
        //                                         fontWeight: FontWeight.w500,
        //                                       ),
        //                                     ),
        //                                     SizedBox(width: 4),
        //                                     Text(
        //                                       '32',
        //                                       style: TextStyle(
        //                                         color: Color(0xFF5EA152),
        //                                         fontSize: 16,
        //                                         fontFamily: 'subfont',
        //                                         fontWeight: FontWeight.w600,
        //                                       ),
        //                                     )
        //                                   ],
        //                                 ),
        //                               ),
        //                             ),
        //                             SizedBox(height: 16),
        //                             GestureDetector(
        //                               onTap: () {
        //                                 Navigator.push(
        //                                     context,
        //                                     MaterialPageRoute(
        //                                       builder: (context) => ReviewWrite(
        //                                           ),
        //                                     ));
        //                               },
        //                               child: Container(
        //                                 width: MediaQuery.sizeOf(context).width - 32,
        //                                 height: 52,
        //                                 alignment: Alignment.center,
        //                                 decoration: ShapeDecoration(
        //                                   color: Color(0xFF5EA152),
        //                                   shape: RoundedRectangleBorder(
        //                                       borderRadius: BorderRadius.circular(4)),
        //                                 ),
        //                                 child: Row(
        //                                     mainAxisAlignment: MainAxisAlignment.center,
        //                                     children: [
        //                                       Icon(Icons.edit_outlined,
        //                                           size: 24, color: Colors.white),
        //                                       SizedBox(width: 4),
        //                                       Text(
        //                                         '리뷰쓰기',
        //                                         style: TextStyle(
        //                                           color: Colors.white,
        //                                           fontSize: 16,
        //                                           fontFamily: 'subfont',
        //                                           fontWeight: FontWeight.w600,
        //                                         ),
        //                                       )
        //                                     ]),
        //                               ),
        //                             ),
        //                             SizedBox(height: 24),
        //                             Divider(
        //                               color: Colors.grey,
        //                               height: 1,
        //                               thickness: 1,
        //                             ),
        //                             SizedBox(height: 16),
        //                             Container(
        //                               alignment: Alignment.centerLeft,
        //                               // width: MediaQuery.of(context).size.width, // 또는 다른 원하는 너비
        //                               child: ListView.builder(
        //                                 physics: const NeverScrollableScrollPhysics(),
        //                                 shrinkWrap: true,
        //                                 itemCount: 5,
        //                                 itemBuilder: (context, index) {
        //                                   return _reviewContainer();
        //                                 },
        //                               ),
        //                             )
        //                             // Column(
        //                             //   crossAxisAlignment: CrossAxisAlignment.start,
        //                             //   children: [
        //                             //
        //                             //   ],
        //                             // ),
        //
        //                           ],
        //                         ),
        //                       )
        //                     : Container(
        //                         width: MediaQuery.sizeOf(context).width,
        //                         height: 800,
        //                         decoration: BoxDecoration(
        //                             image: DecorationImage(
        //                                 image: AssetImage('assets/images/long.png'),
        //                                 fit: BoxFit.fitWidth)),
        //                       )
        //               ],
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   );
        // }
        //
        // Widget _whereContainer(String url, String name) {
        //   return Container(
        //     width: 180,
        //     height: 36,
        //     padding: EdgeInsets.only(left: 8, top: 6, bottom: 6),
        //     decoration: ShapeDecoration(
        //       color: Colors.white,
        //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        //     ),
        //     child: Row(
        //       children: [
        //         Container(
        //           width: 24,
        //           height: 24,
        //           decoration:
        //               BoxDecoration(image: DecorationImage(image: AssetImage(url))),
        //         ),
        //         SizedBox(width: 8),
        //         Text(name)
        //       ],
        //     ),
        //   );
        // }
        //
        // Widget _reviewContainer() {
        //   return Container(
        //     padding: const EdgeInsets.only(bottom: 16),
        //     width: MediaQuery.sizeOf(context).width,
        //     child: Row(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         const SizedBox(height: 13),
        //         Row(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Container(
        //               width: 32,
        //               height: 32,
        //               decoration: const ShapeDecoration(
        //                 color: Color(0xFFF7F7F7),
        //                 shape: OvalBorder(),
        //               ),
        //             ),
        //             SizedBox(width: 15),
        //             Column(
        //               children: [
        //                 Container(
        //                   width: 40,
        //                   height: 40,
        //                   child: Icon(Icons.person, size: 30, color: Colors.grey[800]),
        //                 ),
        //                 Text(
        //                   '닉네임',
        //                   style: TextStyle(
        //                     color: Color(0xFF414141),
        //                     fontSize: 14,
        //                     fontFamily: 'Pretendard',
        //                     fontWeight: FontWeight.w500,
        //                   ),
        //                 ),
        //               ],
        //             ),
        //             SizedBox(width: 15),
        //             Column(
        //               mainAxisAlignment: MainAxisAlignment.end,
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                 Text(
        //                   '2024. 05. 04',
        //                   style: TextStyle(
        //                     color: Color(0xFF949494),
        //                     fontSize: 12,
        //                     fontFamily: 'Pretendard',
        //                     fontWeight: FontWeight.w300,
        //                   ),
        //                 ),
        //                 Text('맛있어요', maxLines: 2)
        //               ]
        //             )
        //           ],
        //         ),
        //       ],
        //     ),
        //   );
        // }
        child: Column(
          children: [
            const SizedBox(height: 12),
            FutureBuilder<Product>(
              future: fetchProducts(), // Ensure the correct future is used
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  Product product = snapshot.data!;
                  return _buildProductItem(product);
                } else {
                  return const Center(child: Text('No product data available'));
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductItem(Product product) {
    return Container(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 270,
            decoration: BoxDecoration(
              color: Colors.grey,
              image: DecorationImage(
                image: NetworkImage(product.productImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            // padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(children: [
              Row(
                children: [_whereContainer(product.mallImage)],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    product.productName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: "subfont",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${product.price.toInt()}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'subfont',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    '원',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'subfont',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 32,
                    height: 32,
                  ),
                  const SizedBox(width: 16)
                ],
              ),
              SizedBox(height: 15),
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
                          color:
                              isReview ? Color(0xFF949494) : Color(0xFF555555),
                          fontSize: 16,
                          fontFamily: 'subfont',
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
                          color:
                              isReview ? Color(0xFF949494) : Color(0xFF555555),
                          fontSize: 16,
                          fontFamily: 'subfont',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )),
                  ],
                ),
              ),
              SizedBox(height: 15),
              isReview
                  ? Container(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              //padding: const EdgeInsets.only(left: 16, top: 16),
                              child: Row(
                                children: [
                                  Text(
                                    '리뷰',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'subfont',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    '32',
                                    style: TextStyle(
                                      color: Color(0xFF5EA152),
                                      fontSize: 16,
                                      fontFamily: 'subfont',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Text(
                                    '별점',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'subfont',
                                      fontWeight: FontWeight.w500,
                                    )
                                  ),
                                  SizedBox(width:4),
                                  Text(
                                    '${product.reviewScoreAvg}',
                                    style: TextStyle(
                                      color: Color(0xFF5EA152),
                                      fontSize: 16,
                                      fontFamily: 'subfont',
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
                                    builder: (context) => ReviewWrite(),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.edit_outlined,
                                        size: 24, color: Colors.white),
                                    SizedBox(width: 4),
                                    Text(
                                      '리뷰쓰기',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'subfont',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ]),
                            ),
                          ),
                          SizedBox(height: 24),
                          Divider(
                            color: Colors.grey,
                            height: 1,
                            thickness: 1,
                          ),
                          SizedBox(height: 16),
                          Container(
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width, // 또는 다른 원하는 너비
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: product.reviewList.length,
                              itemBuilder: (context, index) {
                                var review = product.reviewList[index];
                                return _reviewContainer(review);
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      width: MediaQuery.sizeOf(context).width,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: product.productDetail.length,
                        itemBuilder: (context, index) {
                          String imageUrl = product.productDetail[index];
                          return Container(
                            child: Image.network(
                              imageUrl,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    )
            ]),
          ),
        ]));
  }

  Widget _whereContainer(String url) {
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
                BoxDecoration(image: DecorationImage(image: NetworkImage(url))),
          ),
          SizedBox(width: 8),
          //Text(name),
        ],
      ),
    );
  }

  Widget _reviewContainer(Review review) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      width: MediaQuery.sizeOf(context).width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 13),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: const ShapeDecoration(
                  color: Color(0xFFF7F7F7),
                  shape: OvalBorder(),
                ),
              ),
              SizedBox(width: 15),
              Column(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    child:
                        Icon(Icons.person, size: 30, color: Colors.grey[800]),
                  ),
                  Text(
                    '닉네임',
                    style: TextStyle(
                      color: Color(0xFF414141),
                      fontSize: 14,
                      fontFamily: 'subfont',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 15),
              Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.amberAccent,
                        ),
                        SizedBox(width: 4),
                        Text(
                          '${review.score}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'subfont',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                    '${review.comment}',
                        maxLines: 2,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'subfont',
                      fontWeight: FontWeight.w300,
                    ),)
                  ])
            ],
          ),
        ],
      ),
    );
  }
}

class Product {
  final String productId;
  final String productName;
  final String productImage;
  final String mallImage;
  final List<String> productDetail;
  final double reviewScoreAvg;
  final List<Review> reviewList;

  //final String mallName;
  final double price;

  Product({
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.mallImage,
    //required this.mallName,
    required this.productDetail,
    required this.reviewScoreAvg,
    required this.reviewList,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['productId'],
      productImage: json['productImage'],
      mallImage: json['mallImage'],
      //mallName: json['mallName'],
      productName: json['productName'],
      price: json['price'].toDouble(),
      productDetail: List<String>.from(json['productDetail']),
      reviewScoreAvg: json['reviewScoreAvg'].toDouble(),
      reviewList: (json['reviewList'] as List)
          .map((review) => Review.fromJson(review))
          .toList(),
    );
  }
}

class Review {
  final double score;
  final String comment;

  Review({
    required this.score,
    required this.comment,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      score: json['score'].toDouble(),
      comment: json['comment'],
    );
  }
}

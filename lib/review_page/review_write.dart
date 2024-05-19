import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../my_review_page.dart';

class ReviewWrite extends StatefulWidget {
  final String productId;

  ReviewWrite({required this.productId});

  @override
  State<ReviewWrite> createState() => _ReviewWriteState();
}

class _ReviewWriteState extends State<ReviewWrite> {
  int? selectedEmojiIndex; // For emoji selection
  String? selectedTag; // For tag selection
  final TextEditingController reviewController = TextEditingController(); // For review input
  double reviewScore = 0.0; // Example score, replace with actual user input if necessary

  String? productImage;
  String? productTitle;

  @override
  void initState() {
    super.initState();
    fetchProductDetails();
  }

  Future<void> fetchProductDetails() async {
    final response = await http.get(
      Uri.parse("http://54.180.89.118:8080/api/product-detail?productId=${widget.productId}"),
    );
    ////"http://54.180.89.118:8080/api/product-detail?productId=${widget.productId}"

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        productImage = data['productImage'];
        productTitle = data['productTitle'];
      });
    } else {
      // Handle the error accordingly
      throw Exception('Failed to load product details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      appBar: AppBar(
        backgroundColor: Color(0xFFF7F7F7),
        elevation: 0,
        centerTitle: true,
        title: Text("리뷰 쓰기", style: TextStyle(color: Color(0xFF2C2C2C),fontSize: 16.0)),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Color(0xFF5EA152),
            height: 1.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProductHeader(),
            SizedBox(height: 8),
            _buildReviewInput(),
            SizedBox(height: 16),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildProductHeader() {
    return Container(
      height: 96,
      width: double.infinity,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 15, bottom: 15),
        child: Row(
          children: [
            productImage != null
                ? Image.network(productImage!)
                : CircularProgressIndicator(),
            SizedBox(width: 8),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Text("라라스윗", style: TextStyle(fontSize: 14, color: Color(0xFF6B6B6B))),
                    Text(productTitle ?? "Loading...", style: TextStyle(fontSize: 14, color: Color(0xFF2C2C2C))),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildReviewInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: 134,
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 15),
          Row(
            children: [
              Text(
                "한 줄 리뷰를 작성해 주세요*",
                style: TextStyle(fontSize: 16.0,color: Color(0xFF2C2C2C)),
              ),
              SizedBox(width: 5.0,),
              Text(
                "(최대 50자)",
                style: TextStyle(fontSize: 12.0,color: Color(0xFF6B6B6B)),

    ),
            ],
          ),
          TextField(
            controller: reviewController,
            maxLength: 50,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "리뷰를 입력하세요 (50자 이내)",
              hintStyle: TextStyle(
                fontSize: 12,
                color: Color(0xFF6B6B6B),
              ),
            ),
            ),
        ],
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        width: double.infinity, // Makes the button stretch to fill the width
        height: 52,
        child: ElevatedButton(
          onPressed: submitReview,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF5EA152),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Text("등록", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  Future<void> submitReview() async {
    final response = await http.post(
      //http://54.180.89.118:8080/api/product-detail/review
      Uri.parse('http://54.180.89.118:8080/api/product-detail/review'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'productId': widget.productId,
        'score': reviewScore, // Replace with actual user input if necessary
        'comment': reviewController.text,
      }),
    );

    if (response.statusCode == 200) {
      // Data sent successfully, navigate to MyReview page
      Navigator.push(context, MaterialPageRoute(builder: (context) => MyReview()));
    } else {
      // Handle the error accordingly
      throw Exception('Failed to submit review');
    }
  }
}
//   void submitReview() {
//     // 여기서 서버로 리뷰 데이터를 전송하는 로직을 구현합니다.
//     // 데이터 전송이 성공하면 아래의 페이지 전환 코드를 실행합니다.
//     print('Emoji Index: $selectedEmojiIndex, Tag: $selectedTag, Review: ${reviewController.text}');
//
//     // 데이터 전송 후 MyReview 페이지로 이동
//     Navigator.push(context, MaterialPageRoute(builder: (context) => MyReview()));
//   }
// }

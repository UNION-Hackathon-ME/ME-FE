import 'package:flutter/material.dart';
import 'package:zzero/fav_page.dart';
import 'package:zzero/my_review_page.dart';

class UserInfo {
  final String userName;

  UserInfo(this.userName);
}

class MyPage extends StatelessWidget {
  final UserInfo userInfo;

  const MyPage({super.key, required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      appBar: AppBar(
        backgroundColor: Color(0xFFF7F7F7),
        elevation: 0,
        centerTitle: true,
        title: Text("마이페이지", style: TextStyle(color: Color(0xFF2C2C2C), fontSize: 16.0)),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Color(0xFFFF6D2C),
            height: 1.0,
          ),
        ),
      ),
      body: Column(
        children: [
          _buildUserProfile(userInfo),
          _buildInteractiveRow(context),
          _buildInformationSection(context),
        ],
      ),
    );
  }

  Widget _buildUserProfile(UserInfo userInfo) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, left: 16.0, right: 16.0),
      child: Container(
        height: 76,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey[200],  // Optional background color
                child: Icon(Icons.person, size: 30, color: Colors.grey[800]),  // Person icon
              ),
            ),
            SizedBox(width: 10),
            Text(
              userInfo.userName,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInteractiveRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, left: 16.0, right: 16.0),
      child: Container(
        height: 76,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCategoryItem(context, "찜한 상품", Icons.favorite, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => FavPage()));
            }),
            Container(
              width: 1,
              color: Color(0xFFC0C0C0),
              margin: EdgeInsets.symmetric(vertical: 0.5),
            ),
            _buildCategoryItem(context, "작성한 리뷰", Icons.comment, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyReview()));
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildInformationSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, left: 16.0, right: 16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        child: Column(
          children: [
            _buildInfoButton("공지사항", onPressed: () {}),
            _buildInfoButton("FAQ", onPressed: () {}),
            _buildInfoButton("문의사항", onPressed: () {}),
            _buildInfoButton("이용약관", onPressed: () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoButton(String title, {required VoidCallback onPressed}) {
    return TextButton(
      onPressed: onPressed,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(title, style: TextStyle(color: Colors.black)),
      ),
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        foregroundColor: Colors.black,
        textStyle: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(title, style: TextStyle(fontSize: 14, color: Color(0xFF2C2C2C))),
            SizedBox(height: 8),
            Icon(icon, color: Color(0xFFFF6D2C), size: 24),
          ],
        ),
      ),
    );
  }
}

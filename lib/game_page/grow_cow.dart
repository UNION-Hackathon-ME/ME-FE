import 'dart:async';
import 'package:flutter/material.dart';

class GrowCow extends StatefulWidget {
  @override
  _GrowCowState createState() => _GrowCowState();
}

class _GrowCowState extends State<GrowCow> {
  Timer? _timer;
  double _waterLevel = 0; // 물통의 물 레벨
  double _growthPercent = 0; // 소의 성장 퍼센트 (0%에서 시작)
  double _cowSize = 140; // 소의 초기 크기
  String _bucketImage = 'assets/images/empty_basket.png'; // 물통 이미지
  int _remainingSeconds = 9; // 남은 시간 (초 단위)

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _waterLevel = 100;
          _bucketImage = 'assets/images/full_basket.png';
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _feedCow() {
    if (_waterLevel == 100 && _growthPercent < 100) {
      setState(() {
        _growthPercent += 10; // 소 성장률 10% 증가
        _waterLevel = 0;
        _bucketImage = 'assets/images/empty_basket.png';
        _remainingSeconds = 9;
        _cowSize = 140 + (_growthPercent / 100) * 60; // 소 크기 계산 (140에서 최대 200까지)
        if (_growthPercent >= 100) {
          _cowSize = 200; // 성장률이 100%에 도달하면 크기를 200으로 설정
          _growthPercent = 100; // 성장률을 100%로 고정
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grow Your Cow',),
        titleTextStyle: TextStyle(fontFamily: 'mainfont',color: Colors.black,fontSize: 20),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 100), // 바닥에서 위로 올림
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/images/cow_character.png', width: _cowSize),
                  Text('Growth: ${_growthPercent.toInt()}%', style: TextStyle(fontFamily:'subfont',fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black)),
                ],
              ),
            ),
          ),
          Positioned(
            right: 16,
            bottom: 16,
            child: GestureDetector(
              onTap: _feedCow,
              child: Column(
                children: [
                  Text('${_remainingSeconds ~/ 60}:${_remainingSeconds % 60}',style: TextStyle(fontSize: 15,fontFamily: 'mainfont',color: Colors.black)),
                  Image.asset(_bucketImage, width: 90, height: 90),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

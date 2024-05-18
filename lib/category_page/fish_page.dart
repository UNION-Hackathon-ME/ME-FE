import 'package:flutter/material.dart';
import 'dart:convert'; // For JSON processing
import 'package:http/http.dart' as http; // For HTTP requests

import '../components/search_box.dart';

class SeafoodPage extends StatefulWidget {
  const SeafoodPage({Key? key}) : super(key: key);

  @override
  State<SeafoodPage> createState() => _SeafoodPageState();
}

class _SeafoodPageState extends State<SeafoodPage> {
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> products = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      var response = await http.get(Uri.parse('http://13.125.255.90:8080/api/product-list/seafood'));
      if (response.statusCode == 200) {
        setState(() {
          products = json.decode(response.body);
        });
      } else {
        throw Exception('Failed to load seafood products with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching seafood products: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF5EA152),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Seafood', style: TextStyle(fontSize: 20, fontFamily: 'mainfont', color: Colors.black)),
            Container(
              height: 35,
              child: Image.asset('assets/images/fish.png'),
            ),
            const SizedBox(width: 23),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: const Color(0xFF5EA152),
            height: 1.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            SearchBox(controller: _searchController),
            products.isNotEmpty
                ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 한 줄에 3개의 제품을 표시합니다.
                childAspectRatio: 1 / 1.5, // 각 그리드 아이템의 가로 세로 비율
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(), // 스크롤을 비활성화합니다.
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                var product = products[index];
                return Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Image.network(
                          product['productImage'] as String? ?? 'assets/default.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        product['productName'] as String? ?? 'Unknown Product',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text('\₩${(product['price'] as num? ?? 0).toString()}'),
                      Text('⭐ ${(product['reviewScoreAvg'] as num? ?? 0).toString()}'),
                    ],
                  ),
                );
              },
            )
                : const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}

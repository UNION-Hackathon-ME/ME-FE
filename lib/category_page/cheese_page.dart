import 'package:flutter/material.dart';
import 'dart:convert'; // For JSON processing
import 'package:http/http.dart' as http; // For HTTP requests

import '../components/search_box.dart';

class CheesePage extends StatefulWidget {
  const CheesePage({super.key});

  @override
  State<CheesePage> createState() => _CheesePageState();
}

class _CheesePageState extends State<CheesePage> {
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> products = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    // Placeholder for fetching data
    var response = await http.get(Uri.parse('your-api-url'));
    if (response.statusCode == 200) {
      setState(() {
        products = json.decode(response.body);
      });
    } else {
      // Handle error
      print('Failed to load products');
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
            const Text('치즈'),
            Container(height: 35, child: Image.asset('assets/images/cheese.png')),
            const SizedBox(width: 23),
          ],
        ),
        titleTextStyle: const TextStyle(fontSize: 20, fontFamily: 'mainfont', color: Colors.black),
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
                crossAxisCount: 3,
                childAspectRatio: 1 / 1.5,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                var product = products[index];
                return Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Image.network(product['productImage'], fit: BoxFit.cover),
                      ),
                      Text(product['productName'], style: const TextStyle(fontSize: 16)),
                      Text('\₩${product['price'].toString()}'),
                      Text('⭐ ${product['reviewScoreAvg'].toString()}'),
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

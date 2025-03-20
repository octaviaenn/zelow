import 'package:flutter/material.dart';
import 'dart:async';
import 'package:zelow/components/constant.dart';
import 'package:zelow/components/flashsale_container.dart';
import 'package:zelow/components/flassale_button.dart';
import 'package:zelow/components/navbar.dart';

class FlashsalePage extends StatefulWidget {
  const FlashsalePage({super.key});

  @override
  State<FlashsalePage> createState() => _FlashsalePageState();
}

class _FlashsalePageState extends State<FlashsalePage> {
  int _selectedCategory = 0;
  Duration _remainingTime = const Duration(hours: 1);

  final List<Map<String, dynamic>> _categories = [
    {"icon": Icons.flash_on, "text": "All"},
    {"icon": Icons.access_time, "text": "Segera \nHabis"},
    {"icon": Icons.local_attraction, "text": "Ramadhan \nSale"},
    {"icon": Icons.location_on, "text": "Terdekat"},
    {"icon": Icons.sell_rounded, "text": "Termurah"},
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime.inSeconds > 0) {
        setState(() {
          _remainingTime -= const Duration(seconds: 1);
        });
      } else {
        timer.cancel();
      }
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    return "${twoDigits(duration.inHours)}:${twoDigits(duration.inMinutes.remainder(60))}:${twoDigits(duration.inSeconds.remainder(60))}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: zelow,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Image.asset(
          'assets/images/Zeflash.png',
          height: 30,
        ),
        actions: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.notifications, color: white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.shopping_bag_rounded, color: white),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Lagi pengen makan apa',
                hintStyle: greyTextStyle,
                prefixIcon: Icon(Icons.search, color: zelow),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: zelow, width: 1),
                ),
              ),
            ),
          ),
          
          // Box Button Kategori
          SizedBox(
            height: 100,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  _categories.length,
                  (index) => FlashSaleBoxButton(
                    icon: _categories[index]["icon"],
                    text: _categories[index]["text"],
                    isSelected: _selectedCategory == index,
                    onPressed: () {
                      setState(() {
                        _selectedCategory = index;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
          
          // Timer Flash Sale
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              "BERAKHIR DALAM ${_formatDuration(_remainingTime)}",
              style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return FoodSaleCard(
                  sold: (index + 1) * 5,
                  maxStock: 50,
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNav(selectedItem: 2),
    );
  }
}

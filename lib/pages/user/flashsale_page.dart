import 'package:flutter/material.dart';
import 'package:zelow/components/constant.dart';
import 'package:zelow/components/flash_sale_time.dart';
import 'package:zelow/components/flashsale_container.dart';
import 'package:zelow/components/flassale_button.dart';
import 'package:zelow/components/navbar.dart';

class FlashsalePage extends StatefulWidget {
  const FlashsalePage({super.key});

  @override
  State<FlashsalePage> createState() => _FlashsalePageState();
}

class _FlashsalePageState extends State<FlashsalePage> {
  int _currentTab = 0; // Indeks tab yang dipilih
  int _selectedCategory = 0; // Indeks kategori yang dipilih

  void _onTabSelected(int index) {
    setState(() {
      _currentTab = index;
    });
  }

  final List<Map<String, dynamic>> _categories = [
    {"icon": Icons.flash_on, "text": "All"},
    {"icon": Icons.access_time, "text": "Segera \nHabis"},
    {"icon": Icons.local_attraction, "text": "Ramadhan \nSale"},
    {"icon": Icons.location_on, "text": "Terdekat"},
    {"icon": Icons.sell_rounded, "text": "Termurah"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: zelow,
        elevation: 0,
        centerTitle: false, 
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: CircleAvatar(
                  backgroundColor: white,
                  child: IconButton(
                    icon: Icon(Icons.notifications, color: zelow),
                    onPressed: () {
                      // Aksi untuk notifikasi
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: CircleAvatar(
                  backgroundColor: white,
                  child: IconButton(
                    icon: Icon(Icons.shopping_bag_rounded, color: zelow),
                    onPressed: () {
                      // Aksi untuk shopping bag
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: zelow, width: 1),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Lagi pengen makan apa',
                  hintStyle: greyTextStyle,
                  prefixIcon: Icon(Icons.search, color: zelow),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 11),
                ),
              ),
            ),
          ),
          FlashSaleTabs(onTabSelected: _onTabSelected),
          // Jarak 12px

          // Scrollable Flash Sale Categories
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

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(1),
              itemCount: 5,
              itemBuilder: (context, index){
                return FoodSaleCard(
                  sold: (index + 1) * 5, // Contoh jumlah terjual dinamis
                  maxStock: 50,
                );
              }
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNav(selectedItem: 2),
    );
  }
}

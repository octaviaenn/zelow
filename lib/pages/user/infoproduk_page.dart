import 'package:flutter/material.dart';
import 'package:zelow/components/info_produk_card.dart';

class ProductInfoPage extends StatelessWidget {
  final Map<String, dynamic> productData;

  const ProductInfoPage({Key? key, required this.productData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Produk'),
        leading: BackButton(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Komponen InfoProdukCard
            InfoProdukCard(
              title: productData['title'] ?? "Nasi Padang Ayam Kari",
              imageUrl: productData['imageUrl'] ?? "https://example.com/nasi-padang.jpg",
              rating: productData['rating'] ?? 4.9,
              reviewCount: productData['reviewCount'] ?? 689,
              likeCount: productData['likeCount'] ?? 342,
              price: productData['price'] ?? 20000,
              reviews: _buildReviews(productData['reviews'] ?? []),
              onSavePressed: () {
                // Implementasi aksi simpan
              },
              onSharePressed: () {
                // Implementasi aksi bagikan
              },
              onAddPressed: () {
                // Implementasi aksi tambah ke keranjang
              },
            ),
          ],
        ),
      ),
    );
  }

  List<ReviewItem> _buildReviews(List<dynamic> reviewsData) {
    return reviewsData.map((review) => ReviewItem(
      reviewerName: review['name'] ?? '',
      reviewerImageUrl: review['imageUrl'] ?? '',
      rating: review['rating'] ?? 5.0,
    )).toList();
  }
}
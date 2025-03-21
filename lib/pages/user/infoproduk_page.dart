import 'package:flutter/material.dart';
import 'package:zelow/components/info_produk_card.dart';

class ProductInfoPage extends StatelessWidget {
  final Map<String, dynamic> productData;

  const ProductInfoPage({super.key, required this.productData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Produk'), leading: BackButton()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Komponen InfoProdukCard
            InfoProdukCard(
              title: productData['title'] ?? "Nasi Padang Ayam Kari",
              imageUrl:
                  productData['imageUrl'] ??
                  "https://example.com/nasi-padang.jpg",
              rating:
                  (productData['rating'] as num)
                      .toDouble(), // Ensure it's double
              reviewCount:
                  (productData['reviewCount'] as num).toInt(), // Convert to int
              likeCount: (productData['likeCount'] as num).toInt(),
              price:
                  (productData['price'] as num)
                      .toDouble(), // Ensure it's double
              reviews: _buildReviews(productData['reviews'] ?? []),
              onSavePressed: () {},
              onSharePressed: () {},
              onAddPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  List<ReviewItem> _buildReviews(List<dynamic> reviewsData) {
    return reviewsData
        .map(
          (review) => ReviewItem(
            reviewerName: review['name'] ?? '',
            reviewerImageUrl: review['imageUrl'] ?? '',
            rating: review['rating'] ?? 5.0,
          ),
        )
        .toList();
  }
}

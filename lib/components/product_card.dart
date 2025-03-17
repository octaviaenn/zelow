import 'package:flutter/material.dart';
import 'package:zelow/components/constant.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final double rating; // Rating produk
  final String restaurantName; // Nama resto
  final String distance; // Jarak resto
  final String estimatedTime; // Estimasi waktu pengantaran
  final int stock; // Total stok
  final int sold; // Jumlah terjual
  final VoidCallback onTap;

  const ProductCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.rating,
    required this.restaurantName,
    required this.distance,
    required this.estimatedTime,
    required this.stock,
    required this.sold,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double progress = stock > 0 ? sold / stock : 0.0;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              spreadRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stack untuk gambar dan rating di pojok kiri bawah
            Stack(
              children: [
                // Gambar Produk
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imageUrl,
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                // Badge Rating di pojok kiri bawah
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Colors.yellow, size: 14),
                        const SizedBox(width: 4),
                        Text(
                          rating.toStringAsFixed(1), // Menampilkan rating dengan 1 desimal
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Nama Produk
            Text(
              title,
              style: blackTextStyle.copyWith(
                fontSize: MediaQuery.of(context).size.width * 0.035,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),

            // Box kecil untuk nama resto, jarak, dan estimasi waktu pengantaran
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.storefront, size: 14, color: Colors.green),
                  const SizedBox(width: 4),
                  Text(
                    restaurantName,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.location_on, size: 14, color: Colors.red),
                  const SizedBox(width: 4),
                  Text(
                    distance,
                    style: const TextStyle(fontSize: 12),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.access_time, size: 14, color: Colors.blue),
                  const SizedBox(width: 4),
                  Text(
                    estimatedTime,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),

            // Harga Produk
            Text(
              price,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),

            // Stok Flash Sale (Progress Bar)
          ],
        ),
      ),
    );
  }
}

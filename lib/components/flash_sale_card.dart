import 'package:flutter/material.dart';
import 'package:zelow/components/constant.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final int stock; // Total stok
  final int sold; // Jumlah terjual
  final VoidCallback onTap;

  const ProductCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.price,
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

            // Harga Produk
            Text(
              price,
              style: greenTextStyle.copyWith(
                  fontSize: MediaQuery.of(context).size.width * 0.025,
                  fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 6),

            // Stok Flash Sale
           Stack(
            children: [
              // Progress Bar
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey[300], // Warna latar belakang
                  color: zelow,  // Warna progress yang berjalan
                  minHeight: 20, // Tinggi progress bar lebih besar agar teks terlihat
                ),
              ),

              // Teks di atas Progress Bar
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center, // Teks di tengah progress bar
                  child: Text(
                    "Stok Flash Sale: $sold/$stock", 
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Warna putih agar kontras dengan progress bar
                    ),
                  ),
                ),
              ),
            ],
          ),

          ],
        ),
      ),
    );
  }
}

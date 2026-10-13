
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/product.dart';
import '../controllers/cart_controller.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int jumlah = 1;

  final CartController cart = Get.find<CartController>();

  double get hargaProduk {
    if (widget.product is DiscountedProduct) {
      return (widget.product as DiscountedProduct)
          .getHargaSetelahDiskon();
    }
    return widget.product.price;
  }

  String rupiah(double harga) => 'Rp ${harga.toStringAsFixed(0)}';

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
        leading: IconButton(
          onPressed: Get.back,
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                product.imageUrl,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: 250,
                    color: Colors.grey.shade300,
                    child: const Icon(
                      Icons.image_not_supported,
                      size: 60,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            if (product is DiscountedProduct) ...[
              Text(
                rupiah(product.price),
                style: const TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${product.discountPercent.toStringAsFixed(0)}% diskon',
                style: const TextStyle(color: Colors.green),
              ),
            ],
            Text(
              rupiah(hargaProduk),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF9B6875),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Kategori: ${product.category}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Stok: ${product.stock}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Deskripsi',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              'Jumlah',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                  onPressed: jumlah > 1
                      ? () => setState(() => jumlah--)
                      : null,
                  icon: const Icon(Icons.remove),
                ),
                Text(
                  '$jumlah',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: jumlah < product.stock
                      ? () => setState(() => jumlah++)
                      : null,
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: product.stock <= 0
                    ? null
                    : () {
                        cart.addToCart(product, quantity: jumlah);
                        Get.back(result: true);
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF9B6875),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text('Tambah ke Keranjang'),
              ),
            ),
            const SizedBox(height: 10),

            // KODE LAMA TOMBOL KEMBALI
            // SizedBox(
            //   width: double.infinity,
            //   child: ElevatedButton(
            //     onPressed: () {
            //       Navigator.pop(context);
            //     },
            //     child: const Text('Kembali'),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
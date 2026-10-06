import 'package:flutter/material.dart';
import '../models/product.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                widget.product.imageUrl,
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
              widget.product.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'Rp ${widget.product.price}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            Text(
              'Kategori: ${widget.product.category}',
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 8),

            Text(
              'Stok: ${widget.product.stock}',
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
              widget.product.description,
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 24),

            // JUMLAH PRODUK
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
                      ? () {
                          setState(() {
                            jumlah--;
                          });
                        }
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
                  onPressed: jumlah < widget.product.stock
                      ? () {
                          setState(() {
                            jumlah++;
                          });
                        }
                      : null,
                  icon: const Icon(Icons.add),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // TOMBOL TAMBAH KE KERANJANG
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, jumlah);
                },
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
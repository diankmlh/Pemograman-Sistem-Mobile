
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'main_page.dart';
import '../controllers/cart_controller.dart';

class CheckoutPage extends StatelessWidget {
  final double totalHarga;

  const CheckoutPage({
    super.key,
    required this.totalHarga,
  });

  String rupiah(double harga) {
    return 'Rp ${harga.toStringAsFixed(0)}';
  }

  @override
  Widget build(BuildContext context) {
    final CartController cart = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Icon(
                Icons.receipt_long,
                size: 65,
                color: Color(0xFF9B6875),
              ),
            ),
            const SizedBox(height: 12),
            const Center(
              child: Text(
                'Ringkasan Pesanan',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              'Detail Produk',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            ...cart.cartItems.map((product) {
              final int quantity = cart.quantityOf(product);
              final double subtotal =
                  cart.subtotal(product);

              return Card(
                margin: const EdgeInsets.only(bottom: 10),
                child: ListTile(
                  title: Text(product.name),
                  subtitle: Text(
                    '${rupiah(cart.hargaSatuan(product))} x $quantity',
                  ),
                  trailing: Text(
                    rupiah(subtotal),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }),

            const SizedBox(height: 12),
            const Divider(thickness: 1),
            const SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Pembayaran',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  rupiah(totalHarga),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF9B6875),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  cart.clearCart();

                  Get.offAll(
                    () => const MainPage(),
                  );

                  Get.snackbar(
                    'Pesanan Berhasil',
                    'Terima kasih, pesanan Anda berhasil dikonfirmasi.',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
                icon: const Icon(Icons.check_circle_outline),
                label: const Text('Konfirmasi Pesanan'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  backgroundColor: const Color(0xFF9B6875),
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
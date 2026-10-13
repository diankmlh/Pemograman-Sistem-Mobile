import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';
import 'checkout_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  String rupiah(double harga) => 'Rp ${harga.toStringAsFixed(0)}';

  @override
  Widget build(BuildContext context) {
    final CartController cart = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang Belanja'),
        actions: [
          Obx(
            () => cart.cartItems.isEmpty
                ? const SizedBox.shrink()
                : IconButton(
                    tooltip: 'Kosongkan keranjang',
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () {
                      Get.dialog(
                        AlertDialog(
                          title: const Text('Kosongkan keranjang?'),
                          content: const Text(
                            'Semua produk akan dihapus dari keranjang.',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Get.back(),
                              child: const Text('Batal'),
                            ),
                            TextButton(
                              onPressed: () {
                                cart.clearCart();
                                Get.back();
                              },
                              child: const Text('Kosongkan'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      body: Obx(() {
        if (cart.cartItems.isEmpty) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 70,
                    color: Color(0xFF9B6875),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Keranjang masih kosong',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('Yuk, pilih produk dari halaman Beranda.'),
                ],
              ),
            ),
          );
        }

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ...cart.cartItems.map((product) {
              final quantity = cart.quantityOf(product);

              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          product.imageUrl,
                          width: 75,
                          height: 85,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            width: 75,
                            height: 85,
                            color: const Color(0xFFF1E1E4),
                            child: const Icon(
                              Icons.image_not_supported,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(rupiah(cart.hargaSatuan(product))),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () =>
                                      cart.decreaseQuantity(product),
                                  icon: const Icon(
                                    Icons.remove_circle_outline,
                                  ),
                                ),
                                Text('$quantity'),
                                IconButton(
                                  onPressed: () =>
                                      cart.increaseQuantity(product),
                                  icon: const Icon(
                                    Icons.add_circle_outline,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'Subtotal: ${rupiah(cart.subtotal(product))}',
                              style: const TextStyle(
                                color: Color(0xFF9B6875),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        tooltip: 'Hapus produk',
                        onPressed: () => cart.removeFromCart(product),
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 12),
            Text(
              'Total: ${rupiah(cart.totalHarga)}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF9B6875),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(15),
              ),
              onPressed: () {
                final total = cart.totalHarga;

                // Jangan kosongkan keranjang di sini.
                // Data produk masih diperlukan oleh halaman Checkout.
                Get.off(
                  () => CheckoutPage(totalHarga: total),
                );
              },
              child: const Text('Checkout'),
            ),
          ],
        );
      }),
    );
  }
}
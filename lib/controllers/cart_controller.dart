
import 'package:get/get.dart';
import '../models/product.dart';

class CartController extends GetxController {
  final RxList<Product> cartItems = <Product>[].obs;
  final RxMap<String, int> quantities = <String, int>{}.obs;

  int get totalItem =>
      quantities.values.fold(0, (total, quantity) => total + quantity);

  double hargaSatuan(Product product) {
    if (product is DiscountedProduct) {
      return product.getHargaSetelahDiskon();
    }
    return product.price;
  }

  int quantityOf(Product product) => quantities[product.id] ?? 1;

  double subtotal(Product product) =>
      hargaSatuan(product) * quantityOf(product);

  double get totalHarga {
    return cartItems.fold(
      0.0,
      (total, product) => total + subtotal(product),
    );
  }

  void addToCart(Product product, {int quantity = 1}) {
    if (product.stock <= 0 || quantity <= 0) return;

    final index = cartItems.indexWhere((item) => item.id == product.id);

    if (index >= 0) {
      final currentQuantity = quantityOf(product);
      final newQuantity = currentQuantity + quantity;

      quantities[product.id] =
          newQuantity > product.stock ? product.stock : newQuantity;
    } else {
      cartItems.add(product);
      quantities[product.id] =
          quantity > product.stock ? product.stock : quantity;
    }

    quantities.refresh();
    cartItems.refresh();
  }

  void increaseQuantity(Product product) {
    final currentQuantity = quantityOf(product);

    if (currentQuantity < product.stock) {
      quantities[product.id] = currentQuantity + 1;
      quantities.refresh();
    }
  }

  void decreaseQuantity(Product product) {
    final currentQuantity = quantityOf(product);

    if (currentQuantity > 1) {
      quantities[product.id] = currentQuantity - 1;
      quantities.refresh();
    } else {
      removeFromCart(product);
    }
  }

  void removeFromCart(Product product) {
    cartItems.removeWhere((item) => item.id == product.id);
    quantities.remove(product.id);
    quantities.refresh();
    cartItems.refresh();
  }

  void clearCart() {
    cartItems.clear();
    quantities.clear();
    quantities.refresh();
  }
}
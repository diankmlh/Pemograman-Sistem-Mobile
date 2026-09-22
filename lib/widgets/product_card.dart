import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard>
    with AutomaticKeepAliveClientMixin {
  bool isFavorite = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    print(
      '[initState] ProductCard "${widget.product.name}" dibuat',
    );
  }

  @override
  void dispose() {
    print(
      '[dispose] ProductCard "${widget.product.name}" dihapus',
    );

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    print(
      '[build] ProductCard "${widget.product.name}" dirender',
    );

    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 5,
      shadowColor: const Color(0xFF9B6875).withOpacity(0.18),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      clipBehavior: Clip.antiAlias,
      color: const Color(0xFFFFFCFA),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // BAGIAN GAMBAR PRODUK
          Stack(
            children: [
              Container(
                height: 190,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFF1E1E4),
                      Color(0xFFE3C8CE),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.checkroom_rounded,
                    size: 82,
                    color: Color(0xFF9B6875),
                  ),
                ),
              ),

              // BADGE STATUS STOK
              Positioned(
                top: 14,
                left: 14,
                child: StockBadge(
                  stock: widget.product.stock,
                ),
              ),

              // TOMBOL FAVORIT
              Positioned(
                top: 12,
                right: 12,
                child: Material(
                  color: const Color(0xFFFFFCFA),
                  shape: const CircleBorder(),
                  elevation: 3,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;

                        print(
                          '[setState] Favorit "${widget.product.name}" = $isFavorite',
                        );
                      });
                    },
                    icon: Icon(
                      isFavorite
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                      color: isFavorite
                          ? const Color(0xFFC75B72)
                          : const Color(0xFF8B7378),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // INFORMASI PRODUK
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 17, 18, 19),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // NAMA PRODUK
                Text(
                  widget.product.name,
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF33282B),
                  ),
                ),

                const SizedBox(height: 7),

                // WIDGET LABEL HARGA
                PriceLabel(
                  price: widget.product.price,
                ),

                const SizedBox(height: 13),

                // WIDGET TAG KATEGORI
                CategoryTag(
                  category: widget.product.category,
                ),

                /*
                // KODE KATEGORI LAMA
                // Tetap disimpan sebagai komentar.

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4E9EC),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.local_offer_outlined,
                        size: 16,
                        color: Color(0xFF9B6875),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        widget.product.category,
                        style: const TextStyle(
                          color: Color(0xFF9B6875),
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                */
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// WIDGET LABEL HARGA
class PriceLabel extends StatelessWidget {
  final double price;

  const PriceLabel({
    super.key,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Rp ${price.toStringAsFixed(0)}',
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Color(0xFF8A3D4D),
      ),
    );
  }
}

// WIDGET BADGE STATUS STOK
class StockBadge extends StatelessWidget {
  final int stock;

  const StockBadge({
    super.key,
    required this.stock,
  });

  @override
  Widget build(BuildContext context) {
    String status;
    Color background;
    Color textColor;

    if (stock > 5) {
      status = 'Stok Tersedia';
      background = const Color(0xFFE5EEE7);
      textColor = const Color(0xFF4F735A);
    } else if (stock > 0) {
      status = 'Stok Terbatas';
      background = const Color(0xFFF7EBD8);
      textColor = const Color(0xFF9A6B32);
    } else {
      status = 'Stok Habis';
      background = const Color(0xFFF6E0E2);
      textColor = const Color(0xFFB04D5D);
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 11,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// WIDGET TAG KATEGORI
/*
class CategoryTag extends StatelessWidget {
  final String category;

  const CategoryTag({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF4E9EC),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.local_offer_outlined,
            size: 16,
            color: Color(0xFF9B6875),
          ),
          const SizedBox(width: 6),
          Text(
            category,
            style: const TextStyle(
              color: Color(0xFF9B6875),
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
*/

// TAMBAHAN: CategoryTag dengan warna berbeda berdasarkan kategori
class CategoryTag extends StatelessWidget {
  final String category;

  const CategoryTag({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;

    if (category == 'Fashion') {
      backgroundColor = const Color(0xFFF1E1E4);
      textColor = const Color(0xFF9B6875);
    } else if (category == 'Kecantikan') {
      backgroundColor = const Color(0xFFEAE3F2);
      textColor = const Color(0xFF75608C);
    } else if (category == 'Aksesoris') {
      backgroundColor = const Color(0xFFF7EBD8);
      textColor = const Color(0xFF9A6B32);
    } else {
      backgroundColor = const Color(0xFFF4E9EC);
      textColor = const Color(0xFF9B6875);
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.local_offer_outlined,
            size: 16,
            color: textColor,
          ),
          const SizedBox(width: 6),
          Text(
            category,
            style: TextStyle(
              color: textColor,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
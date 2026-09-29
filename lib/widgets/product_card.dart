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

    // return Card(
    //   margin: const EdgeInsets.all(16),
    //   elevation: 5,
    //   shadowColor: const Color(0xFF9B6875).withOpacity(0.18),
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(22),
    //   ),
    //   clipBehavior: Clip.antiAlias,
    //   color: const Color(0xFFFFFCFA),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Stack(
    //         children: [
    //           Container(
    //             height: 190,
    //             width: double.infinity,
    //             decoration: const BoxDecoration(
    //               gradient: LinearGradient(
    //                 colors: [
    //                   Color(0xFFF1E1E4),
    //                   Color(0xFFE3C8CE),
    //                 ],
    //                 begin: Alignment.topLeft,
    //                 end: Alignment.bottomRight,
    //               ),
    //             ),
    //             child: const Center(
    //               child: Icon(
    //                 Icons.checkroom_rounded,
    //                 size: 82,
    //                 color: Color(0xFF9B6875),
    //               ),
    //             ),
    //           ),

    //           Positioned(
    //             top: 14,
    //             left: 14,
    //             child: StockBadge(
    //               stock: widget.product.stock,
    //             ),
    //           ),

    //           Positioned(
    //             top: 12,
    //             right: 12,
    //             child: Material(
    //               color: const Color(0xFFFFFCFA),
    //               shape: const CircleBorder(),
    //               elevation: 3,
    //               child: IconButton(
    //                 onPressed: () {
    //                   setState(() {
    //                     isFavorite = !isFavorite;

    //                     print(
    //                       '[setState] Favorit "${widget.product.name}" = $isFavorite',
    //                     );
    //                   });
    //                 },
    //                 icon: Icon(
    //                   isFavorite
    //                       ? Icons.favorite_rounded
    //                       : Icons.favorite_border_rounded,
    //                   color: isFavorite
    //                       ? const Color(0xFFC75B72)
    //                       : const Color(0xFF8B7378),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),

    //       Padding(
    //         padding: const EdgeInsets.fromLTRB(18, 17, 18, 19),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text(
    //               widget.product.name,
    //               style: const TextStyle(
    //                 fontSize: 21,
    //                 fontWeight: FontWeight.bold,
    //                 color: Color(0xFF33282B),
    //               ),
    //             ),

    //             const SizedBox(height: 7),

    //             PriceLabel(
    //               price: widget.product.price,
    //             ),

    //             const SizedBox(height: 13),

    //             CategoryTag(
    //               category: widget.product.category,
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );

    return Container(
      height: 180,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFCFA),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF9B6875).withOpacity(0.18),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      // PRODUCT CARD
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        clipBehavior: Clip.antiAlias,
        color: const Color(0xFFFFFCFA),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // GAMBAR PRODUK
            Expanded(
              flex: 50,
              child: SizedBox(
                height: 172,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
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
                          size: 52,
                          color: Color(0xFF9B6875),
                        ),
                      ),
                    ),

                    // BADGE STATUS STOK
                    Positioned(
                      top: 8,
                      left: 8,
                      child: StockBadge(
                        stock: widget.product.stock,
                      ),
                    ),

                    // BADGE DISKON
                    if (widget.product is DiscountedProduct)
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 7,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFC75B72),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'Diskon',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                    // TOMBOL FAVORIT
                    Positioned(
                      bottom: 6,
                      right: 6,
                      child: Material(
                        color: const Color(0xFFFFFCFA),
                        shape: const CircleBorder(),
                        elevation: 3,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(
                            minWidth: 32,
                            minHeight: 32,
                          ),
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
                            size: 18,
                            color: isFavorite
                                ? const Color(0xFFC75B72)
                                : const Color(0xFF8B7378),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // INFORMASI PRODUK
            Expanded(
              flex: 50,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  8,
                  14,
                  8,
                  12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Expanded pada Column nama dan harga
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.product.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF33282B),
                            ),
                          ),

                          const SizedBox(height: 5),

                          PriceLabel(
                            price: widget.product.price,
                          ),
                        ],
                      ),
                    ),

                    // KATEGORI PRODUK
                    SizedBox(
                      width: double.infinity,
                      child: FittedBox(
                        alignment: Alignment.centerLeft,
                        fit: BoxFit.scaleDown,
                        child: CategoryTag(
                          category: widget.product.category,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontSize: 11,
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
        horizontal: 6,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: textColor,
          fontSize: 7,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// WIDGET TAG KATEGORI
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
        horizontal: 7,
        vertical: 4,
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
            size: 10,
            color: textColor,
          ),
          const SizedBox(width: 3),
          Text(
            category,
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: textColor,
              fontSize: 9,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
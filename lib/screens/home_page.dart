import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // DATA PRODUK
  List<Product> get daftarProduk => [
        Product(
          id: 'DF001',
          name: 'Shirt dress',
          price: 150000,
          imageUrl: 'https://girlsfashion.com/shirt.jpg',
          category: 'Fashion',
          stock: 10,
          description:
              'Shirt dress wanita ukuran M, L, XL. Bahan katun sejuk dan nyaman dipakai',
        ),

        Product(
          id: 'DF002',
          name: 'Skinny Jeans',
          price: 170000,
          imageUrl: 'https://girlsfashion.com/jeans.jpg',
          category: 'Fashion',
          stock: 10,
          description: 'Skinny jeans fashion.',
        ),

        // Product(
        //   id: 'DA001',
        //   name: 'Pearl Bracelet',
        //   price: 240000,
        //   imageUrl: 'https://girlsfashion.com/bracelet.jpg',
        //   category: 'Aksesoris',
        //   stock: 8,
        //   description: 'Gelang mutiara elegan.',
        // ),

        DiscountedProduct(
          id: 'DA001',
          name: 'Pearl Bracelet',
          price: 240000,
          imageUrl: 'https://girlsfashion.com/bracelet.jpg',
          category: 'Aksesoris',
          stock: 8,
          description: 'Gelang mutiara elegan.',
          discountPercent: 15,
        ),

        Product(
          id: 'DK001',
          name: 'Lip Tint',
          price: 75000,
          imageUrl: 'https://girlsfashion.com/lip_tint.jpg',
          category: 'Kecantikan',
          stock: 6,
          description: 'Lip tint.',
        ),

        Product(
          id: 'DK002',
          name: 'Face Wash',
          price: 65000,
          imageUrl: 'https://girlsfashion.com/face_wash.jpg',
          category: 'Kecantikan',
          stock: 12,
          description: 'Face wash.',
        ),

        // Product(
        //   id: 'DA002',
        //   name: 'Sling Bag',
        //   price: 100000,
        //   imageUrl: 'https://girlsfashion.com/slingbag.jpg',
        //   category: 'Aksesoris',
        //   stock: 5,
        //   description: 'Tas sling praktis untuk aktivitas sehari-hari.',
        // ),

        DiscountedProduct(
          id: 'DA002',
          name: 'Sling Bag',
          price: 100000,
          imageUrl: 'https://girlsfashion.com/slingbag.jpg',
          category: 'Aksesoris',
          stock: 5,
          description: 'Tas sling praktis untuk aktivitas sehari-hari.',
          discountPercent: 15,
        ),

        Product(
          id: 'DK003',
          name: 'Hair Serum',
          price: 90000,
          imageUrl: '',
          category: 'Kecantikan',
          stock: 15,
          description: 'Hair serum.',
        ),

        // Product(
        //   id: 'DA003',
        //   name: 'Kalung Matinee',
        //   price: 280000,
        //   imageUrl: 'https://girlsfashion.com/matanee.jpg',
        //   category: 'Aksesoris',
        //   stock: 7,
        //   description: 'Kalung matinee yang elegan.',
        // ),

        DiscountedProduct(
          id: 'DA003',
          name: 'Kalung Matinee',
          price: 280000,
          imageUrl: 'https://girlsfashion.com/matanee.jpg',
          category: 'Aksesoris',
          stock: 7,
          description: 'Kalung model matinee yang elegan.',
          discountPercent: 15,
        ),

        Product(
          id: 'DF003',
          name: 'Kemeja Denim',
          price: 55000,
          imageUrl: 'https://girlsfashion.com/denim_shirt.jpg',
          category: 'Fashion',
          stock: 4,
          description: 'Kemeja denim.',
        ),

        Product(
          id: 'DF004',
          name: 'Blouse Casual',
          price: 120000,
          imageUrl: 'https://girlsfashion.com/blouse.jpg',
          category: 'Fashion',
          stock: 9,
          description: 'Blouse casual wanita.',
        ),

        Product(
          id: 'DF005',
          name: 'Jaket Denim',
          price: 220000,
          imageUrl: 'https://girlsfashion.com/jeans.jpg',
          category: 'Fashion',
          stock: 6,
          description: 'Jaket denim casual.',
        ),

        Product(
          id: 'DK004',
          name: 'Moisturizer',
          price: 85000,
          imageUrl: 'https://girlsfashion.com/moisturizer.jpg',
          category: 'Kecantikan',
          stock: 10,
          description: 'Moisturizer untuk perawatan kulit.',
        ),

        Product(
          id: 'DK005',
          name: 'Sunscreen',
          price: 95000,
          imageUrl: 'https://girlsfashion.com/sunscreen.jpg ',
          category: 'Kecantikan',
          stock: 11,
          description: 'Sunscreen untuk perlindungan kulit.',
        ),

        DiscountedProduct(
          id: 'DA004',
          name: 'Anting Hoop',
          price: 80000,
          imageUrl: 'https://girlsfashion.com/hoop_earrings.jpg',
          category: 'Aksesoris',
          stock: 10,
          description: 'Anting hoop sederhana dan elegan.',
          discountPercent: 15,
        ),

        DiscountedProduct(
          id: 'DA005',
          name: 'Cincin Minimalis',
          price: 110000,
          imageUrl: 'https://girlsfashion.com/minimalist_ring.jpg',
          category: 'Aksesoris',
          stock: 8,
          description: 'Cincin minimalis untuk penggunaan sehari-hari.',
          discountPercent: 15,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TokoKita',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Belanja jadi lebih mudah',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart_outlined,
              ),
            ),
          ],
        ),
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {
          int jumlahKolom;

          if (constraints.maxWidth >= 1200) {
            jumlahKolom = 4;
          } else if (constraints.maxWidth >= 900) {
            jumlahKolom = 3;
          } else if (constraints.maxWidth >= 600) {
            jumlahKolom = 2;
            } else {
                jumlahKolom = 1;
          }

          final jumlahBaris =
              (daftarProduk.length / jumlahKolom).ceil();

          return ListView.builder(
            padding: const EdgeInsets.all(4),
            itemCount: jumlahBaris,
            itemBuilder: (context, index) {
              final int startIndex = index * jumlahKolom;
              final int endIndex =
                  (startIndex + jumlahKolom > daftarProduk.length)
                      ? daftarProduk.length
                      : startIndex + jumlahKolom;

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int i = startIndex; i < endIndex; i++)
                    Expanded(
                      child: ProductCard(
                        key: ValueKey(daftarProduk[i].id),
                        product: daftarProduk[i],
                      ),
                    ),

                  if (endIndex - startIndex < jumlahKolom)
                    ...List.generate(
                      jumlahKolom - (endIndex - startIndex),
                      (_) => const Expanded(
                        child: SizedBox(),
                      ),
                    ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
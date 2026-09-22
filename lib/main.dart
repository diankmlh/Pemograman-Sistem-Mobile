import 'package:flutter/material.dart';
import 'models/product.dart';
import 'widgets/product_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> daftarProduk = [
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
        imageUrl: '',
        category: 'Fashion',
        stock: 10,
        description: 'Skinny jeans fashion.',
      ),
      Product(
        id: 'DA001',
        name: 'Pearl Bracelet',
        price: 240000,
        imageUrl: '',
        category: 'Aksesoris',
        stock: 8,
        description: 'Gelang mutiara.',
      ),
      Product(
        id: 'DK001',
        name: 'Lip Tint',
        price: 75000,
        imageUrl: '',
        category: 'Kecantikan',
        stock: 6,
        description: 'Lip tint.',
      ),
      Product(
        id: 'DK002',
        name: 'Face Wash',
        price: 65000,
        imageUrl: '',
        category: 'Kecantikan',
        stock: 12,
        description: 'Face wash.',
      ),
      Product(
        id: 'DA002',
        name: 'Sling Bag',
        price: 100000,
        imageUrl: '',
        category: 'Aksesoris',
        stock: 5,
        description: 'Sling bag.',
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
      Product(
        id: 'DA003',
        name: 'Kalung Matinee',
        price: 280000,
        imageUrl: '',
        category: 'Aksesoris',
        stock: 7,
        description: 'Kalung matinee.',
      ),
      Product(
        id: 'DF003',
        name: 'Kemeja Denim',
        price: 55000,
        imageUrl: '',
        category: 'Fashion',
        stock: 4,
        description: 'Kemeja denim.',
      ),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TokoKita',

      // Tampilan utama TokoKita
      home: Scaffold(
        appBar: AppBar(
          title: const Text('TokoKita'),
        ),
        body: ListView(
          children: daftarProduk.map((product) {
            return ProductCard(
              key: ValueKey(product.id),
              product: product,
            );
          }).toList(),
        ),
      ),
    );
  }
}

// Kode ini digunakan untuk testing dispose()
// Tidak dihapus, hanya dinonaktifkan sementara.

// class TokoKitaPage extends StatefulWidget {
//   const TokoKitaPage({super.key});

//   @override
//   State<TokoKitaPage> createState() => _TokoKitaPageState();
// }

// class _TokoKitaPageState extends State<TokoKitaPage> {
//   bool showProduct = true;

//   final Product product = Product(
//     id: 'DF001',
//     name: 'Shirt dress',
//     price: 150000,
//     imageUrl: 'https://girlsfashion.com/shirt.jpg',
//     category: 'Fashion',
//     stock: 10,
//     description:
//         'Shirt dress wanita ukuran M, L, XL. Bahan katun sejuk dan nyaman dipakai',
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('TokoKita'),
//       ),
//       body: Column(
//         children: [
//           if (showProduct)
//             ProductCard(
//               product: product,
//             ),
//           const SizedBox(height: 10),
//           ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 showProduct = !showProduct;
//               });
//             },
//             child: Text(
//               showProduct ? 'Hapus Produk' : 'Tampilkan Produk',
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
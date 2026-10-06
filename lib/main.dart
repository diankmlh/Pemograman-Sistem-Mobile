import 'package:flutter/material.dart';
import 'models/product.dart';
import 'screens/main_page.dart';
import 'screens/product_detail_page.dart';

// LoginPage
// import 'screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TokoKita',

      
      // home: const LoginPage(),

      // MainPage halaman awal apk
      home: const MainPage(),

      // Named Routes
      routes: {
        '/detail': (context) {
          final arguments = ModalRoute.of(context)!.settings.arguments;

          if (arguments is Product) {
            return ProductDetailPage(
              product: arguments,
            );
          }

          return const Scaffold(
            body: Center(
              child: Text('Data produk tidak ditemukan'),
            ),
          );
        },
      },
    );
  }
}

// final List<Product> daftarProduk = [
//   ...
// ];

// home: Scaffold(
//   appBar: AppBar(
//     title: const Text('TokoKita'),
//   ),
//   body: ListView(
//     children: daftarProduk.map((product) {
//       return ProductCard(
//         key: ValueKey(product.id),
//         product: product,
//       );
//     }).toList(),
//   ),
// );


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
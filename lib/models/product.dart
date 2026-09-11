// Step 4 - Function
// Function parameter biasa
double hitungHargaSetelahDiskonBiasa(double harga, double persenDiskon) {
  return harga - (harga * persenDiskon / 100);
}

// Function named parameter + default value
double hitungHargaSetelahDiskon(
  double harga, {
  double persenDiskon = 10,
}) {
  return harga - (harga * persenDiskon / 100);
}

// Arrow function
String formatRupiah(double harga) =>
    'Rp ${harga.toStringAsFixed(0)}';

// Step 5 - OOP
class Product {
  String id;
  String name;
  double price;
  String imageUrl;
  String category;
  int stock;
  String description;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.stock,
    required this.description,
  });

  // Tugas Mandiri No. 1
  String getStatusStok() {
    if (stock > 5) {
      return 'Tersedia';
    } else if (stock > 0) {
      return 'Stok Terbatas';
    } else {
      return 'Habis';
    }
  }
}

// Tugas Mandiri No. 3
double hitungTotalBelanja(List<Product> keranjang) {
  double total = 0;

  for (Product produk in keranjang) {
    total += produk.price;
  }

  return total;
}

class DiscountedProduct extends Product {
  double discountPercent;

  DiscountedProduct({
    required super.id,
    required super.name,
    required super.price,
    required super.imageUrl,
    required super.category,
    required super.stock,
    required super.description,
    required this.discountPercent,
  });

  double getHargaSetelahDiskon() {
    return price - (price * discountPercent / 100);
  }
}

void main() {
  // STEP 1 - VARIABEL & TIPE DATA
  var productName = 'Shirt dress';
  final productId = 'DF001';
  const discount = 10;

  int stock = 10;
  double price = 150000;
  String category = 'Fashion';
  bool isAvailable = true;

  List<String> categories = [
    'Fashion',
    'Kecantikan',
    'Aksesoris',
  ];

  Map<String, dynamic> rawProduct = {
    'id': 'DF001',
    'name': 'Shirt dress',
    'price': 150000,
    'stock': 10,
    'category': 'Fashion',
  };

  print('STEP 1 - VARIABEL & TIPE DATA');
  print('Nama Produk: $productName');
  print('ID Produk: $productId');
  print('Diskon: $discount%');
  print('Stok: $stock');
  print('Harga: $price');
  print('Kategori: $category');
  print('Tersedia: $isAvailable');
  print('Daftar Kategori: $categories');
  print('Data Produk: $rawProduct');

}

  // STEP 2 - OPERATOR
  double hargaSetelahDiskon = price - (price * discount / 100);
  double hargaDuaProduk = price * 2;
  double hargaPerProduk = price / 2;
  int sisaStok = stock % 3;

  print('STEP 2 - OPERATOR');
  print('Harga setelah diskon: $hargaSetelahDiskon');
  print('Harga 2 produk: $hargaDuaProduk');
  print('Harga dibagi 2: $hargaPerProduk');
  print('Sisa stok: $sisaStok');

  print('Harga sama dengan 150000: ${price == 150000}');
  print('Harga tidak sama dengan 100000: ${price != 100000}');
  print('Harga lebih dari 100000: ${price > 100000}');
  print('Stok kurang dari 20: ${stock < 20}');
  print('Harga lebih dari atau sama dengan 150000: ${price >= 150000}');
  print('Stok kurang dari atau sama dengan 10: ${stock <= 10}');

  print(
    'Produk tersedia dan stok lebih dari 0: ${isAvailable && stock > 0}',
  );

  print(
    'Kategori Fashion, Kecantikan, atau Aksesoris: '
    '${category == 'Fashion' || category == 'Kecantikan' || category == 'Aksesoris'}',
  );

  print('Produk tidak tersedia: ${!isAvailable}');

}

  // STEP 3 - CONTROL FLOW
  print('STEP 3 - CONTROL FLOW');

  if (stock > 5) {
    print('Status Stok: Tersedia');
  } else if (stock > 0) {
    print('Status Stok: Stok Terbatas');
  } else {
    print('Status Stok: Habis');
  }

  double totalHarga = 0;

  for (int i = 1; i <= 3; i++) {
    totalHarga += price;
  }

  print('Total harga 3 produk: $totalHarga');

  int stokSementara = stock;

  while (stokSementara > 0) {
    print('Stok tersisa: $stokSementara');
    stokSementara--;
  }

  print('Stok setelah dikurangi: $stokSementara');

  double diskonKategori;

  switch (category) {
    case 'Fashion':
      diskonKategori = 10;
      break;
    case 'Kecantikan':
      diskonKategori = 15;
      break;
    case 'Aksesoris':
      diskonKategori = 5;
      break;
    default:
      diskonKategori = 0;
  }

  print('Diskon berdasarkan kategori $category: $diskonKategori%');

}

  // STEP 4 - FUNCTION
  double harga = 150000;

  // Function dengan named parameter
  double hasilDiskon = hitungHargaSetelahDiskon(
    harga,
    persenDiskon: 15,
  );

  print('STEP 4 - FUNCTION');

  print('Harga awal: ${formatRupiah(harga)}');

  print(
    'Harga setelah diskon 15%: ${formatRupiah(hasilDiskon)}',
  );

  // Default parameter
  double hasilDiskonDefault = hitungHargaSetelahDiskon(harga);

   print(
    'Harga setelah diskon default 10%: '
    '${formatRupiah(hasilDiskonDefault)}',
  );
}

  // STEP 5 - OOP
  Product product = Product(
    id: 'DF001',
    name: 'Shirt dress',
    price: 150000,
    imageUrl: 'https://girlsfashion.com/shirt.jpg',
    category: 'Fashion',
    stock: 10,
    description:
        'Shirt dress wanita ukuran M, L, XL. Bahan katun sejuk dan nyaman dipakai',
  );

  // Tugas Mandiri No. 2
List<Product> daftarProduk = [
  product, Product(
    id: 'DF002',
    name: 'Skinny Jeans',
    price: 170000,
    imageUrl: 'https://girlsfashion.com/Skinny.jpg',
    category: 'Fashion',
    stock: 10,
    description: 'Skinny jeans wanita ukuran M, L, XL. Bahan denim yang nyaman dipakai',
  ),
  Product(
    id: 'DA001',
    name: 'Pearl Bracelet',
    price: 240000,
    imageUrl: 'https://girlsfashion.com/Pearl.jpg',
    category: 'Aksesoris',
    stock: 8,
    description: "Pearl bracelet dengan desain sederhana yang elegan.",
  ),
  Product(
    id: 'DK001',
    name: 'Lip Tint',
    price: 75000,
    imageUrl: 'https://girlsfashion.com/LipTint.jpg',
    category: 'Kecantikan',
    stock: 6,
    description: 'Lip tint dengan warna natural yang cocok disemua bibir.',
  ),
  Product(
    id: 'DK002',
    name: 'Face Wash',
    price: 65000,
    imageUrl: 'https://girlsfashion.com/FaceWash.jpg',
    category: 'Kecantikan',
    stock: 12,
    description: 'Sabun wajah yanng berfungsi mencerahkan untuk penggunaan sehari-hari.',
  ),
  Product(
    id: 'DA002',
    name: 'Sling Bag',
    price: 100000,
    imageUrl: 'https://girlsfashion.com/Bag.jpg',
    category: 'Aksesoris',
    stock: 5,
    description: 'Tas selempang simple, ringan dan nyaman dipakai.',
  ),
  Product(
    id: 'DK003',
    name: 'Hair Serum',
    price: 90000,
    imageUrl: 'https://girlsfashion.com/HairSerum.jpg',
    category: 'Kecantikan',
    stock: 15,
    description: 'Hair serum untuk perawatan rambut agar lebih bercahaya.',
  ),
  Product(
    id: 'DA003',
    name: 'Kalung Matinee',
    price: 280000,
    imageUrl: 'https://girlsfashion.com/Kalung.jpg',
    category: 'Aksesoris',
    stock: 7,
    description: 'Kalung dengan desain elegan ukuran 50-60cm.',
  ),
  Product(
    id: 'DF003',
    name: 'Kemeja Denim',
    price: 55000,
    imageUrl: 'https://girlsfashion.com/DenimShirt.jpg',
    category: 'Fashion',
    stock: 4,
    description: 'Kemeja denim dengan bahan nyaman dan stylish.',
  ),
];

print('DAFTAR PRODUK');

for (Product p in daftarProduk) {
  print('${p.id} - ${p.name} - ${p.category} - Rp ${p.price.toStringAsFixed(0)} - Stok: ${p.stock}');
}

double totalBelanja = hitungTotalBelanja(daftarProduk);

print('Total Belanja: Rp ${totalBelanja.toStringAsFixed(0)}');

  print('STEP 5 - OOP');
  print('ID: ${product.id}');
  print('Nama: ${product.name}');
  print('Harga: ${product.price}');
  print('Kategori: ${product.category}');
  print('Stok: ${product.stock}');
  print('Status Stok: ${product.getStatusStok()}');
  print('Deskripsi: ${product.description}');

  DiscountedProduct discountedProduct = DiscountedProduct(
    id: 'DF002',
    name: 'Dress Casual',
    price: 200000,
    imageUrl: 'https://girlsfashion.com/shirt.jpg',
    category: 'Fashion',
    stock: 5,
    description: 'Dress casual wanita',
    discountPercent: 15,
  );

  print(
    'Harga setelah diskon: '
    '${discountedProduct.getHargaSetelahDiskon()}',
  );

  // Null safety
  String? deskripsiTambahan = null;

  print('Deskripsi tambahan: $deskripsiTambahan');
}
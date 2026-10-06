import 'package:flutter/material.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    const HomePage(),
    const _CartPage(),
    const _ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Keranjang',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

// Halaman Keranjang
class _CartPage extends StatelessWidget {
  const _CartPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Color(0xFFF1E1E4),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  size: 50,
                  color: Color(0xFF9B6875),
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                'Keranjang Belanja',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF33282B),
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Belum ada produk di keranjang.\n'
                'Yuk, pilih produk yang ingin kamu beli.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF8B7378),
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 24),

              ElevatedButton.icon(
                onPressed: () {
                  final state =
                      context.findAncestorStateOfType<_MainPageState>();

                  state?.setState(() {
                    state.selectedIndex = 0;
                  });
                },
                icon: const Icon(Icons.shopping_bag_outlined),
                label: const Text('Mulai Belanja'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF9B6875),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 13,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Halaman Profil
class _ProfilePage extends StatelessWidget {
  const _ProfilePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 15),

            // Foto profil
            Container(
              width: 95,
              height: 95,
              decoration: const BoxDecoration(
                color: Color(0xFFF1E1E4),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.person,
                size: 50,
                color: Color(0xFF9B6875),
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              'Pengguna TokoKita',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF33282B),
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'user@tokokita.com',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF8B7378),
              ),
            ),

            const SizedBox(height: 30),

            // Menu profil
            const _ProfileMenu(
              icon: Icons.person_outline,
              title: 'Akun Saya',
            ),

            const SizedBox(height: 12),

            const _ProfileMenu(
              icon: Icons.receipt_long_outlined,
              title: 'Pesanan Saya',
            ),

            const SizedBox(height: 12),

            const _ProfileMenu(
              icon: Icons.settings_outlined,
              title: 'Pengaturan',
            ),
          ],
        ),
      ),
    );
  }
}

// Widget menu profil
class _ProfileMenu extends StatelessWidget {
  final IconData icon;
  final String title;

  const _ProfileMenu({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 17,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFCFA),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF9B6875).withOpacity(0.12),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFFF1E1E4),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF9B6875),
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Color(0xFF33282B),
              ),
            ),
          ),

          const Icon(
            Icons.chevron_right,
            color: Color(0xFF8B7378),
          ),
        ],
      ),
    );
  }
}
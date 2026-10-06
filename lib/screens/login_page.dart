import 'package:flutter/material.dart';
import 'main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signIn() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email dan password harus diisi'),
        ),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const MainPage(),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1E1E4),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(height: 25),

                // ICON TOKOKITA
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFCFA),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF9B6875).withOpacity(0.20),
                        blurRadius: 18,
                        offset: const Offset(0, 7),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.shopping_bag_rounded,
                    size: 48,
                    color: Color(0xFF9B6875),
                  ),
                ),

                const SizedBox(height: 22),

                const Text(
                  'TokoKita',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF33282B),
                  ),
                ),

                const SizedBox(height: 6),

                const Text(
                  'Belanja jadi lebih mudah',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF8B7378),
                  ),
                ),

                const SizedBox(height: 35),

                // LOGIN CARD
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFCFA),
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF9B6875).withOpacity(0.18),
                        blurRadius: 18,
                        offset: const Offset(0, 7),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF33282B),
                        ),
                      ),

                      const SizedBox(height: 6),

                      const Text(
                        'Masuk untuk melanjutkan belanja',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF8B7378),
                        ),
                      ),

                      const SizedBox(height: 25),

                      const Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF33282B),
                        ),
                      ),

                      const SizedBox(height: 8),

                      TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Masukkan email',
                          hintStyle: const TextStyle(
                            color: Color(0xFFB49CA1),
                          ),
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: Color(0xFF9B6875),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF4E9EC),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      const Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF33282B),
                        ),
                      ),

                      const SizedBox(height: 8),

                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Masukkan password',
                          hintStyle: const TextStyle(
                            color: Color(0xFFB49CA1),
                          ),
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: Color(0xFF9B6875),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF4E9EC),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: signIn,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF9B6875),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 22),

                const Text(
                  'Selamat datang di TokoKita',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF8B7378),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
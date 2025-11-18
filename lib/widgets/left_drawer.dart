import 'package:flutter/material.dart';
import 'package:football_shop/screens/menu.dart'; // IMPORTS ARE CRITICAL
import 'package:football_shop/screens/list_product.dart'; 
import 'package:football_shop/screens/login.dart'; 
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF388E3C),
            ),
            child: Column(
              children: [
                Text(
                  'Football Shop',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(8.0)),
                Text(
                  "Find your gear here!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          // --- Home Button ---
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home Page'),
            onTap: () {
              // Navigate to Home (Menu)
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            },
          ),
          // --- Product List Button ---
          ListTile(
            leading: const Icon(Icons.shopping_bag_outlined),
            title: const Text('Product List'),
            onTap: () {
              // Navigate to Product List
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductListPage()),
              );
            },
          ),
          // --- Logout Button (FIXED) ---
          if (request.loggedIn)
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () async {
                // 1. Use the new logout-ajax endpoint
                // 2. Use 127.0.0.1 for Chrome
                final response = await request.logout("http://127.0.0.1:8000/logout-ajax/"); 
                
                String message = response["message"];
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(message)),
                  );
                  // Redirect to Login Page after logout
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                }
              },
            ),
        ],
      ),
    );
  }
}
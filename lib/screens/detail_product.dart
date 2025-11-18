import 'package:flutter/material.dart';
import 'package:football_shop/models/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;
  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.fields.name), backgroundColor: const Color(0xFF388E3C), foregroundColor: Colors.white),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                if (product.fields.thumbnail != null && product.fields.thumbnail!.isNotEmpty)
                    Image.network(product.fields.thumbnail!, width: double.infinity, fit: BoxFit.cover)
                else
                    Container(height: 250, color: Colors.grey[200], child: const Center(child: Icon(Icons.sports_soccer, size: 100, color: Colors.grey))),
                
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Text(product.fields.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            Text("Price: Rp ${product.fields.price}", style: const TextStyle(fontSize: 20, color: Color(0xFF388E3C), fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            Text("Category: ${product.fields.category}"),
                            const SizedBox(height: 20),
                            const Text("Description", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 5),
                            Text(product.fields.description, style: const TextStyle(fontSize: 16)),
                            const SizedBox(height: 30),
                            ElevatedButton(
                                onPressed: () => Navigator.pop(context),
                                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF388E3C), foregroundColor: Colors.white),
                                child: const Text("Back to List"),
                            )
                        ],
                    ),
                )
            ],
        ),
      ),
    );
  }
}
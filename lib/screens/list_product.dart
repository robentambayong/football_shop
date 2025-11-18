import 'package:flutter/material.dart';
import 'package:football_shop/models/product.dart';
import 'package:football_shop/widgets/left_drawer.dart';
import 'package:football_shop/screens/detail_product.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});
  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  Future<List<Product>> fetchProduct(CookieRequest request) async {
    // NOTE: We use ?filter=my to satisfy the assignment requirement
    // CHANGE TO YOUR DEPLOYMENT URL
    final response = await request.get('http://127.0.0.1:8000/get-products/?filter=my'); 
    var data = response;
    List<Product> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(Product.fromJson(d));
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(title: const Text('Product List'), backgroundColor: const Color(0xFF388E3C), foregroundColor: Colors.white),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProduct(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Center(child: Text('No products found.'));
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) {
                  Product product = snapshot.data![index];
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    elevation: 4,
                    child: InkWell(
                      onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(product: product)));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            // Display thumbnail if available, else default icon
                            if (product.fields.thumbnail != null && product.fields.thumbnail!.isNotEmpty)
                                ClipRRect(
                                    borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                                    child: Image.network(product.fields.thumbnail!, height: 200, width: double.infinity, fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) => Container(height: 200, color: Colors.grey, child: const Icon(Icons.broken_image)),)
                                )
                            else
                                Container(height: 200, color: Colors.grey[200], child: const Center(child: Icon(Icons.sports_soccer, size: 50, color: Colors.grey))),
                            
                            Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Text(product.fields.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                        const SizedBox(height: 8),
                                        Text("Rp ${product.fields.price}", style: const TextStyle(fontSize: 16, color: Color(0xFF388E3C), fontWeight: FontWeight.w600)),
                                        if(product.fields.isFeatured)
                                            Container(
                                                margin: const EdgeInsets.only(top: 8),
                                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                                decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(12)),
                                                child: const Text("FEATURED", style: TextStyle(color: Colors.white, fontSize: 10)),
                                            )
                                    ],
                                ),
                            )
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';

void main() {
  runApp(const TechProductsApp());
}

const String dartLogo = "assets/dart.png";
const String flutterLogo = "assets/flutter.png";
const String firebaseLogo = "assets/firebase.png";

enum TechProduct {
  Dart("Dart", "An optimized language for building mobile and web apps.", dartLogo),
  Flutter("Flutter", "A framework for building natively compiled apops.", flutterLogo),
  Firebase("Firebase", "A cloud platform for building and managing apps.", firebaseLogo);

  final String title;
  final String description;
  final String imagePath;

  const TechProduct(this.title, this.description, this.imagePath);
}

class TechProductsApp extends StatelessWidget {
  const TechProductsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Tech Products"),
          backgroundColor: Colors.blueAccent[100],
        ),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProductCard(
                product: TechProduct.Dart,
              ),
              const SizedBox(height: 12),
              ProductCard(
                product: TechProduct.Flutter,
              ),
              const SizedBox(height: 12),
              ProductCard(
                product: TechProduct.Firebase,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final TechProduct product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product.imagePath, width: 100),
            const SizedBox(height: 10),
            Text(
              product.title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product.description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:ffi';

class Product {
  final String name;
  final String image;
  final String designer;
  final String color;
  final List<String> sizes;
  final int price;
  final int discount;
  final String description;


  Product({
    required this.name,
    required this.image,
    required this.designer,
    required this.color,
    required this.sizes,
    required this.price,
    required this.discount,
    required this.description,
  });

  factory Product.fromFirestore(Map<String, dynamic> data) {
    return Product(
      name: data['name'],
      image: data['image'],
      designer: data['designer'],
      color: data['color'],
      sizes: List<String>.from(data['sizes']),
      price: data['price'],
      discount: data['discount'],
      description: data['description'],
    );
  }
}
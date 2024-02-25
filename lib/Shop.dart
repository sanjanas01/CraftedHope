import 'package:flutter/material.dart';
import 'top.dart';
import 'bottom.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: shop(),
    );
  }
}

class shop extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Dress 1',
      'image': 'assets/dress1.png',
      'designer': 'Designer 1',
      'color': 'White and Red',
      'sizes': ['S', 'M', 'L']
    },
    {
      'name': 'Dress 2',
      'image': 'assets/dress2.png',
      'designer': 'Designer 2',
      'color': 'Blue',
      'sizes': ['M', 'L']
    },
    // Add more products here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(), // Using the custom app bar widget
      backgroundColor: Colors.black, // Set background color to black
      body: GridView.builder(
        padding: EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.7,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(product: products[index]),
                ),
              );
            },
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 160,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                      child: Image.asset(
                        products[index]['image'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          products[index]['name'],
                          style: TextStyle(
                            fontFamily: 'Gabriela-Regular',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Designer: ${products[index]['designer']}',
                          style: TextStyle(
                            fontFamily: 'Gabriela-Regular',
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(), // Using the custom app bar widget
      backgroundColor: Colors.black, // Set background color to black
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image on the left
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  product['image'],
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 16), // Add some spacing between the image and details
            // Details on the right
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Designer: ${product['designer']}',
                    style: TextStyle(
                      fontFamily: 'Gabriela-Regular',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Color: ${product['color']}',
                    style: TextStyle(
                      fontFamily: 'Gabriela-Regular',
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Sizes Available: ${product['sizes'].join(', ')}',
                    style: TextStyle(
                      fontFamily: 'Gabriela-Regular',
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  // Add more details as needed
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

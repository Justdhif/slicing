import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
        title: const Text('Cart Page'),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryItem(
                    imagePath:
                        'assets/bakso.jpg', // Replace with your image path
                    label: 'All',
                    selected: true,
                  ),
                  CategoryItem(
                    imagePath: 'assets/bakso.jpg',
                    label: 'Makanan',
                    selected: false,
                  ),
                  CategoryItem(
                    imagePath: 'assets/teh.jpeg',
                    label: 'Minuman',
                    selected: false,
                  ),
                ],
              ),
            ),
          ),
          // Food Grid Section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'All Food',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                itemCount: 6, // Number of items in the grid
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75, 
                ),
                itemBuilder: (context, index) {
                  return const ProductCard(
                    imagePath: 'assets/bakso.jpg',
                    name: 'Bakso',
                    price: 'Rp. 100,000.00',
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Icon(Icons.shopping_cart),
                 Positioned(
                  right: 0,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Color.fromARGB(255, 255, 0, 0),
                    child: Text(
                      '3',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: '',
          ),
        ],
      ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String imagePath;
  final String label;
  final bool selected;

  const CategoryItem({super.key, 
    required this.imagePath,
    required this.label,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: selected ? Colors.blue : Colors.grey[300],
              // color: Colors.amber,
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              border: Border.all(width: 5, color: const Color.fromARGB(255, 50, 63, 255)),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          const SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String price;

  const ProductCard({super.key, 
    required this.imagePath,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                Text(price),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_circle, color: Colors.green),
          ),

                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
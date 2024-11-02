import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        title: const Text('Checkout Page'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Cart',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: const [
                  CheckoutItem(
                      imagePath: 'assets/burger.jpeg',
                      name: 'Burger King Medium',
                      price: 'Rp. 50,000.00',
                      quantity: 1),
                  CheckoutItem(
                      imagePath: 'assets/burger.jpeg',
                      name: 'Burger King Small',
                      price: 'Rp. 25,000.00',
                      quantity: 2),
                  CheckoutItem(
                      imagePath: 'assets/teh.jpeg',
                      name: 'Teh Botol',
                      price: 'Rp. 10,000.00',
                      quantity: 1),
                ],
              ),
            ),
            
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Ringkasan Belanja'),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('PPN 11%'),
                Text('Rp.10.000,00')
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Belanja'),
                Text('Rp.94.000,00')
              ],
            ),
            const Divider(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('Rp. 104,000.00',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 242, 126, 165),
                  padding: const EdgeInsets.symmetric(vertical: 15)),
              child: const Center(
                  child: Text('Checkout', style: TextStyle(fontSize: 16))),
            ),
          ],
        ),
      ),
      )
    );
  }
}

class CheckoutItem extends StatelessWidget {
  final String imagePath;
  final String name;
  final String price;
  final int quantity;

  const CheckoutItem(
      {super.key, required this.imagePath,
      required this.name,
      required this.price,
      required this.quantity,
      });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Image.asset(imagePath, width: 80, height: 80, fit: BoxFit.cover),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(price),
                Text('Quantity: $quantity'),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
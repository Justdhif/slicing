import 'package:flutter/material.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
        title: const Text('Tambah Produk'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Nama Produk',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Harga',
              ),
              keyboardType: TextInputType.number,
            ),
            DropdownButtonFormField(
              items: const [
                DropdownMenuItem(value: 'Makanan', child: Text('Makanan')),
                DropdownMenuItem(value: 'Minuman', child: Text('Minuman')),
              ],
              onChanged: (value) {},
              decoration: const InputDecoration(labelText: 'Kategori Produk'),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Gambar Produk',
                suffixIcon: Icon(Icons.file_upload),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
      ),
    );
  }
}

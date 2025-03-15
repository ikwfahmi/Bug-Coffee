import 'package:bug_coffee/pembayaran.dart';
import 'package:flutter/material.dart';


class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  final List<Map<String, dynamic>> _cartItems = [
    {
      'name': 'Rice Bowl',
      'price': 16000,
      'quantity': 1,
      'checked': true,
    },
    {
      'name': 'Nasi Goreng',
      'price': 20000,
      'quantity': 1,
      'checked': true,
    },
    {
      'name': 'Coffee Latte',
      'price': 18000,
      'quantity': 1,
      'checked': true,
    },
    {
      'name': 'Red Velvet',
      'price': 23000,
      'quantity': 1,
      'checked': true,
    },
  ];
  double getTotalPrice() {
    double total = 0.0;
    for (var item in _cartItems) {
      if (item['checked']) {
        total += item['price'] * item['quantity'];
      }
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        titleTextStyle: const TextStyle(
          color: Color.fromARGB(255, 182, 137, 91),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: const Color.fromARGB(255, 182, 137, 91),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView(
              children: [
                for (var item in _cartItems) _buildCartItem(item),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey[300],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Belanja (${_cartItems.where((item) => item['checked']).length} item)',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Rp ${getTotalPrice().toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 182, 137, 91),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) =>
                      const PembayaranScreen()), 
                    );
                  },
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Color.fromARGB(255, 182, 137, 91),
                    size: 24.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem(Map<String, dynamic> item) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Checkbox(
              value: item['checked'],
              onChanged: (value) {
                setState(() {
                  item['checked'] = value;
                });
              },
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['name'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Rp ${item['price'].toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 182, 137, 91),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  color: Color.fromARGB(255, 182, 137, 91),
                  onPressed: () {
                    setState(() {
                      if (item['quantity'] > 1) {
                        item['quantity']--;
                      }
                    });
                  },
                ),
                Text(
                  '${item['quantity']}',
                  style: const TextStyle(fontSize: 16),
                ),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  color: Color.fromARGB(255, 182, 137, 91),
                  onPressed: () {
                    setState(() {
                      item['quantity']++;
                    });
                  },
                ),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                setState(() {
                  _cartItems.remove(item);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

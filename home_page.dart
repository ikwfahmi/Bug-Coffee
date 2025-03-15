import 'dart:async';
import 'package:bug_coffee/shopping_cart.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int totalProducts = 0;
  double totalPrice = 0.0;
  final PageController _pageController = PageController();
  Timer? _autoSwipeTimer;
  bool _isTouching = false;
  int currentPage = 0;

  List<String> imagePaths = [
    "res/images/card_diskon1.jpg",
    "res/images/card_diskon2.jpg",
  ];

  void addToCart(double price) {
    setState(() {
      totalProducts += 1;
      totalPrice += price;
    });
  }

  @override
  void initState() {
    super.initState();
    _startAutoSwipe();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _autoSwipeTimer?.cancel();
    super.dispose();
  }

  void _startAutoSwipe() {
    _autoSwipeTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (!_isTouching) {
        if (currentPage < imagePaths.length - 1) {
          _pageController.nextPage(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        } else {
          _pageController.animateToPage(0,
              duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
        }
      }
    });
  }

  Widget _buildHeroImage() {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: GestureDetector(
            onPanDown: (_) {
              setState(() {
                _isTouching = true;
              });
              _autoSwipeTimer?.cancel();
            },
            onPanEnd: (_) {
              setState(() {
                _isTouching = false;
              });
              _startAutoSwipe();
            },
            child: SizedBox(
              width: double.infinity,
              height: 150,
              child: PageView.builder(
                controller: _pageController,
                itemCount: imagePaths.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Image.asset(
                    imagePaths[index],
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCoffeeSection(String sectionTitle, String name1, double price1, String imagePath1, String name2, double price2, String imagePath2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Row(
            children: [
              Text(
                sectionTitle,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 5),
              const Icon(
                Icons.arrow_drop_down,
                size: 30,
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildCoffeeCard(name1, price1, imagePath1),
            _buildCoffeeCard(name2, price2, imagePath2),
          ],
        ),
      ],
    );
  }

  Widget _buildCoffeeCard(String name, double price, String imagePath) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color.fromARGB(255, 182, 137, 91),
              width: 4,
            ),
          ),
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(imagePath),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              Text(name),
              Text(
                "Rp ${price.toStringAsFixed(0)}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 1),
              ElevatedButton(
                onPressed: () {
                  addToCart(price);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 182, 137, 91),
                ),
                child: const Icon(
                  Icons.shopping_cart,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTotalContainer() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Total Produk: $totalProducts PCS",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "Total Uang: Rp ${totalPrice.toStringAsFixed(0)}",
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ShoppingCartScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 182, 137, 91),
              padding: const EdgeInsets.symmetric(vertical: 10),
            ),
            child: const Center(
              child: Text(
                "Checkout",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: const Text(
          "BugCoffee",
          style: TextStyle(
            color: Color.fromARGB(255, 182, 137, 91),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildHeroImage(),
                  _buildCoffeeSection('MAKANAN', 'Rice Bowl', 16000, 'res/images/rice_bowl.jpg', 'Nasi Goreng', 20000, 'res/images/nasi_goreng.jpg'),
                  const SizedBox(height: 10),
                  _buildCoffeeSection('COFFEE', 'Coffee Latte', 18000, 'res/images/coffee_latte.jpg', 'Espresso', 18000, 'res/images/kopi_espresso.jpg'),
                  const SizedBox(height: 10),
                  _buildCoffeeSection('NON COFFEE', 'Matcha', 23000, 'res/images/matcha_latte.png', 'Red Velvet', 23000, 'res/images/red_velvet.jpg'),
                ],
              ),
            ),
          ),
          _buildTotalContainer(),
        ],
      ),
    );
  }
}

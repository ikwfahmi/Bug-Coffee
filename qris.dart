import 'package:flutter/material.dart';

class Qris extends StatelessWidget {
  const Qris({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Scan kode QR'),
        titleTextStyle: const TextStyle(
          color: Color.fromARGB(255, 182, 137, 91),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: const Color.fromARGB(255, 182, 137, 91),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment
                  .center, 
              mainAxisAlignment: MainAxisAlignment
                  .start,
              children: [
                Text(
                  'Rp10.000',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Pembeli scan kode QR ini',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black, 
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    Text(
                      'QRIS',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 3),
                    Container(
                      width: 100,
                      height: 2, 
                      color: Color.fromARGB(255, 182, 137, 91), 
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 250, 
                      height: 250, 
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'res/images/kode_qr.png'), 
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top:
                          10,
                      left:
                          10,
                      child: Container(
                        width: 40,
                        height: 5,
                        color: Color.fromARGB(255, 182, 137, 91), 
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        width: 5,
                        height: 40,
                        color: Color.fromARGB(255, 182, 137, 91),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        width: 40,
                        height: 5,
                        color: Color.fromARGB(255, 182, 137, 91),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        width: 5,
                        height: 40,
                        color: Color.fromARGB(255, 182, 137, 91),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Container(
                        width: 40,
                        height: 5,
                        color: Color.fromARGB(255, 182, 137, 91),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Container(
                        width: 5,
                        height: 40,
                        color: Color.fromARGB(255, 182, 137, 91),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Container(
                        width: 40,
                        height: 5,
                        color: Color.fromARGB(255, 182, 137, 91),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Container(
                        width: 5,
                        height: 40,
                        color: Color.fromARGB(255, 182, 137, 91),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'warkop :',
                        style: TextStyle(
                          fontSize: 17, 
                          color: Colors.black, 
                        ),
                      ),
                      TextSpan(
                        text: ' BugCoffee',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold, 
                          color:
                              Color.fromARGB(255, 182, 137, 91), 
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0), 
                        child: Image.asset(
                          'res/images/shopee_food.jpeg',
                          width: 60, 
                          height: 60, 
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0), 
                        child: Image.asset(
                          'res/images/gofood.png', 
                          width: 80, 
                          height: 80,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0), 
                        child: Image.asset(
                          'res/images/grab_food.jpeg',
                          width: 60,
                          height: 60, 
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

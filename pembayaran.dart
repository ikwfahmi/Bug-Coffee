import 'package:bug_coffee/cash.dart';
import 'package:bug_coffee/qris.dart';
import 'package:flutter/material.dart';

class PembayaranScreen extends StatelessWidget {
  const PembayaranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Payment",
          style: TextStyle(
            color: Color.fromARGB(255, 182, 137, 91),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Nilai Transaksi',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              const SizedBox(height: 1),
              const Padding(
                padding: EdgeInsets.only(
                    left: 16.0),
                child: Text(
                  'Rp10.000',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(
                        255, 182, 137, 91), 
                  ),
                ),
              ),
              const SizedBox(
                  height: 5),
              const Divider(
                color: Colors.grey,
                thickness: 1.0, 
              ),

              const SizedBox(height: 10),
              const Text(
                'Pilih metode pembayaran',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                height: 400,
                child: ListView(
                  children: [
                    ListTile(
                      leading: Image.asset(
                        "res/images/cash.png",
                        width: 30, 
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                      title: const Text(
                        'CASH',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => KirimUangScreen()),
                        );
                      },
                    ),
                    ListTile(
                      leading: Image.asset(
                        "res/images/dana.png",
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                      title: const Text(
                        'DANA - QRIS',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Qris()),
                        );
                      },
                    ),
                    ListTile(
                      leading: Image.asset(
                        "res/images/shopeepay.png",
                        width: 30,
                        height: 30, 
                        fit: BoxFit.cover,
                      ),
                      title: const Text(
                        'ShopeePay - QRIS',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Qris()),
                        );
                      },
                    ),
                    ListTile(
                      leading: Image.asset(
                        "res/images/gopay.png",
                        width: 30, 
                        height: 30, 
                        fit: BoxFit.cover, 
                      ),
                      title: const Text(
                        'GoPay - QRIS',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Qris()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

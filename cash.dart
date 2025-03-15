import 'package:bug_coffee/order.dart';
import 'package:flutter/material.dart';

class KirimUangApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: KirimUangScreen(),
    );
  }
}

class KirimUangScreen extends StatefulWidget {
  @override
  _KirimUangScreenState createState() => _KirimUangScreenState();
}

class _KirimUangScreenState extends State<KirimUangScreen> {
  String selectedNominal = '';
  String selectedOrderType = '';
  
  void updateNominal(String nominal) {
    setState(() {
      selectedNominal = nominal;
    });
  }

  void updateOrderType(String orderType) {
    setState(() {
      selectedOrderType = orderType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cash",
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
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nama :',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        SizedBox(height: 8),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'No Meja :',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        SizedBox(height: 8),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                'Catatan :',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 8),
              Text(
                'Masukkan Nominal :',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Text('Rp', style: TextStyle(color: Colors.grey[700])),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: selectedNominal == '' ? '0' : selectedNominal,
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 2.5,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      updateNominal('16000');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedNominal == '16000'
                          ? Color.fromARGB(255, 182, 137, 91)
                          : Colors.white,
                      side: BorderSide(color: Colors.grey),
                    ),
                    child: Text('Rp16.000', style: TextStyle(color: Colors.black)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      updateNominal('25000');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedNominal == '25000'
                          ? Color.fromARGB(255, 182, 137, 91)
                          : Colors.white,
                      side: BorderSide(color: Colors.grey),
                    ),
                    child: Text('Rp25.000', style: TextStyle(color: Colors.black)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      updateNominal('50000');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedNominal == '50000'
                          ? Color.fromARGB(255, 182, 137, 91)
                          : Colors.white,
                      side: BorderSide(color: Colors.grey),
                    ),
                    child: Text('Rp50.000', style: TextStyle(color: Colors.black)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      updateNominal('100000');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedNominal == '100000'
                          ? Color.fromARGB(255, 182, 137, 91)
                          : Colors.white,
                      side: BorderSide(color: Colors.grey),
                    ),
                    child: Text('Rp100.000', style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Pilih Tipe Pesanan :',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 2.5,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      updateOrderType('Dine In');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedOrderType == 'Dine In'
                          ? Color.fromARGB(255, 182, 137, 91)
                          : Colors.white,
                      side: BorderSide(color: Colors.grey),
                    ),
                    child: Text('Dine In', style: TextStyle(color: Colors.black)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      updateOrderType('Take Away');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedOrderType == 'Take Away'
                          ? Color.fromARGB(255, 182, 137, 91)
                          : Colors.white,
                      side: BorderSide(color: Colors.grey),
                    ),
                    child: Text('Take Away', style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),
              SizedBox(height: 100),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Order()), // Ensure OrderPage() is defined in order.dart
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 182, 137, 91),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      'Lanjut',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}

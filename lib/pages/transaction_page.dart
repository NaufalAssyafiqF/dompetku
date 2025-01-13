import 'package:flutter/material.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, // Mengatur warna icon menjadi putih
        ),
        backgroundColor:
            Colors.green, // Mengatur warna latar belakang menjadi hijau
        title: Text(
          "Add transaction",
          style: TextStyle(
            color: Colors.white, // Mengatur warna teks menjadi putih
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [],
        )),
      ),
    );
  }
}

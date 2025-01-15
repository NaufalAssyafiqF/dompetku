import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  bool isExpense = true;
  List<String> list = ["Makan & Jajan", "Transportation", "Nonton Film"];
  TextEditingController dateController = TextEditingController();
  late String dropdownValue = list.first;
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Switch(
                  value: isExpense,
                  onChanged: (bool value) {
                    setState(() {
                      isExpense = value;
                    });
                  },
                  inactiveTrackColor: Colors.green[200],
                  inactiveThumbColor: Colors.green,
                  activeTrackColor: Colors.red[200],
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  isExpense ? "Expense" : "Income",
                  style: GoogleFonts.montserrat(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  enabledBorder: UnderlineInputBorder(),
                  focusedBorder: UnderlineInputBorder(),
                  labelText: "Amount",
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Category",
                style: GoogleFonts.montserrat(
                    fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: DropdownButton<String>(
                  isExpanded: true,
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_downward),
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                  onChanged: (String? value) {}),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                readOnly: true,
                controller: dateController,
                decoration: InputDecoration(
                  labelText: "Enter date",
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2099));
                  if (pickedDate != null) {
                    String formatedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    dateController.text = formatedDate;
                  }
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: FilledButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.green),
                  foregroundColor: WidgetStateProperty.all(Colors.white),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Text("Save"),
              ),
            )
          ],
        )),
      ),
    );
  }
}

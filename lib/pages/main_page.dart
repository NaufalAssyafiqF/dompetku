import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:dompetku_/pages/category_page.dart';
import 'package:dompetku_/pages/home_page.dart';
import 'package:dompetku_/pages/transaction_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _children = [HomePage(), CategoryPage()];
  int currentIndex = 0;

  void onTapTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (currentIndex == 0)
          ? CalendarAppBar(
              accent: Colors.green,
              backButton: false,
              locale: "id",
              onDateChanged: (value) => print(value),
              firstDate: DateTime.now().subtract(const Duration(days: 140)),
              lastDate: DateTime.now(),
            )
          : PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
                child: Text(
                  "Categories",
                  style: GoogleFonts.montserrat(fontSize: 20),
                ),
              )),
      floatingActionButton: Visibility(
        visible: (currentIndex == 0 ? true : false),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(
              builder: (context) => TransactionPage(),
            ))
                .then((value) {
              setState(() {});
            });
          },
          backgroundColor: Colors.green,
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: _children[currentIndex],
      bottomNavigationBar: BottomAppBar(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed: () {
                onTapTapped(0);
              },
              icon: const Icon(
                CupertinoIcons.house_fill,
              )),
          const SizedBox(
            width: 20,
          ),
          IconButton(
              onPressed: () {
                onTapTapped(1);
              },
              icon: const Icon(
                CupertinoIcons.list_dash,
              ))
        ],
      )),
    );
  }
}

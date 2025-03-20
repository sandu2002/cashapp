import 'package:cashapp/pages/add_cash_page.dart';
import 'package:cashapp/pages/home_screen.dart';
import 'package:cashapp/pages/send_money_screen.dart';
import 'package:cashapp/utils/colors.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //current page index
  int _selectedIndex = 0;

  //int number = 0
  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [HomeScreen(), SendMoney(), AddCash()];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,

        backgroundColor:
            _selectedIndex == 1 ? AppColors.gButton : AppColors.bgColor,
        selectedItemColor:
            _selectedIndex == 1 ? AppColors.bgColor : AppColors.mainTxtColor,
        unselectedItemColor:
            _selectedIndex == 1
                ? Colors.white.withOpacity(0.45)
                : Colors.grey.withOpacity(0.6),
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 26),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.wallet_rounded, size: 26),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.attach_money_rounded, size: 26),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 26),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.access_time, size: 26),
            label: "",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: pages[_selectedIndex],
    );
  }
}

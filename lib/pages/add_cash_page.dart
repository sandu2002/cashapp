import 'package:cashapp/pages/home_screen.dart';
import 'package:cashapp/utils/colors.dart';
import 'package:cashapp/utils/constants.dart';
import 'package:cashapp/utils/text_style.dart';
import 'package:flutter/material.dart';

class AddCash extends StatefulWidget {
  const AddCash({super.key});

  @override
  State<AddCash> createState() => _AddCashState();
}

class _AddCashState extends State<AddCash> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AddCashPage(),
    );
  }
}

class AddCashPage extends StatefulWidget {
  const AddCashPage({super.key});

  @override
  _AddCashPageState createState() => _AddCashPageState();
}

class _AddCashPageState extends State<AddCashPage> {
  String amount = "";

  void _onKeyboardTap(String value) {
    setState(() {
      if (value == "<") {
        if (amount.isNotEmpty) {
          amount = amount.substring(0, amount.length - 1);
        }
      } else if (!(value == "." && amount.contains("."))) {
        amount += value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor.withOpacity(0.96),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(
                        AppConstants.kDefaultPadding,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                          },
                          child: Icon(
                            Icons.close,
                            size: 30,
                            color: AppColors.gButton,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Add Cash",
                      style: AppTextStyles.appTitle.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.mainTxtColor,
                      ),
                    ),
                    const SizedBox(height: 70),
                    Text(
                      "\$${amount.isEmpty ? "0" : amount}",
                      style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.w500,
                        color: AppColors.gButton,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              _buildKeypad(),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.gButton,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      "Add",
                      style: AppTextStyles.appTitle.copyWith(
                        fontSize: 18,
                        color: AppColors.bgColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildKeypad() {
    List<List<String>> keys = [
      ["1", "2", "3"],
      ["4", "5", "6"],
      ["7", "8", "9"],
      [".", "0", "<"],
    ];

    return Column(
      children:
          keys
              .map(
                (row) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: row.map((text) => _keyboardButton(text)).toList(),
                ),
              )
              .toList(),
    );
  }

  Widget _keyboardButton(String text) {
    return GestureDetector(
      onTap: () => _onKeyboardTap(text),
      child: Container(
        margin: const EdgeInsets.all(10),
        width: 80,
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Text(
          text,
          style: const TextStyle(fontSize: 24, color: Colors.black54),
        ),
      ),
    );
  }
}

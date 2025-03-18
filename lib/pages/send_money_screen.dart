import 'package:cashapp/utils/colors.dart';
import 'package:cashapp/utils/constants.dart';
import 'package:cashapp/utils/text_style.dart';
import 'package:cashapp/widget/custom_button.dart';
import 'package:flutter/material.dart';

class SendMoney extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PaymentScreen(),
    );
  }
}

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String amount = "";

  void _onKeyboardTap(String value) {
    setState(() {
      if (value == "<") {
        if (amount.isNotEmpty) {
          amount = amount.substring(0, amount.length - 1);
        }
      } else if (value == "." && amount.contains(".")) {
        // Prevent multiple decimal points
      } else {
        amount += value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gButton.withOpacity(0.96),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(AppConstants.kDefaultPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.qr_code_scanner_outlined,
                          size: 35,
                          color: AppColors.bgColor,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            'assets/472099408_615134204220348_5951965978403894225_n.jpg',
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(height: 30),
                      Text(
                        "\$${amount.isEmpty ? "0" : amount}",
                        style: TextStyle(
                          fontSize: 90,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 50),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.26,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: AppColors.gButton,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 28, right: 15),
                          child: DropdownButton<String>(
                            value: "USD",
                            dropdownColor: Colors.green,
                            style: TextStyle(color: Colors.white, fontSize: 18),
                            underline: SizedBox(),
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white,
                            ),
                            items: [
                              DropdownMenuItem(
                                value: "USD",
                                child: Text("USD"),
                              ),
                            ],
                            onChanged: (value) {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  for (var row in [
                    ["1", "2", "3"],
                    ["4", "5", "6"],
                    ["7", "8", "9"],
                    [".", "0", "<"],
                  ])
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:
                          row.map((text) => _keyboardButton(text)).toList(),
                    ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          bgColor: AppColors.gButton,
                          title: "Request",
                          titleColor: AppColors.bgColor,
                        ),
                        CustomButton(
                          bgColor: AppColors.gButton,
                          title: "Pay",
                          titleColor: AppColors.bgColor,
                        ),
                        // _actionButton("Request"),
                        // _actionButton("Pay"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _keyboardButton(String text) {
    return GestureDetector(
      onTap: () => _onKeyboardTap(text),
      child: Container(
        margin: EdgeInsets.all(10),
        width: 80,
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          //color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(text, style: TextStyle(fontSize: 24, color: Colors.white)),
      ),
    );
  }

  Widget _actionButton(String text) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(text, style: TextStyle(fontSize: 18, color: Colors.green)),
    );
  }
}

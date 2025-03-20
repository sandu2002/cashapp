import 'package:cashapp/utils/colors.dart';
import 'package:cashapp/utils/constants.dart';
import 'package:cashapp/widget/coustom_msg.dart';
import 'package:flutter/material.dart';

class SendMoney extends StatefulWidget {
  const SendMoney({super.key});

  @override
  State<SendMoney> createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
  String amount = "";

  void _onKeyboardTap(String value) {
    setState(() {
      if (value == "<" && amount.isNotEmpty) {
        amount = amount.substring(0, amount.length - 1);
      } else if (!(value == "." && amount.contains("."))) {
        amount += value;
      }
    });
  }

  void _showPaymentPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Payment"),
          content: Text(
            "You need to pay a \$50 fee to send \$${amount.isEmpty ? "0" : amount}. Proceed?",
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Add payment logic here
              child: const Text("Confirm"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gButton.withOpacity(0.96),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildHeader(),
            _buildKeypad(),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppConstants.kDefaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.qr_code_scanner_outlined, size: 35, color: Colors.white),
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
          const SizedBox(height: 10),
          Text(
            "\$${amount.isEmpty ? "0" : amount}",
            style: const TextStyle(fontSize: 80, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          const SizedBox(height: 50),
          _buildCurrencyDropdown(),
        ],
      ),
    );
  }

  Widget _buildCurrencyDropdown() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.26,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color.fromARGB(255, 20, 225, 98).withOpacity(0.9),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 28),
        child: DropdownButton<String>(
          value: "USD",
          dropdownColor: Colors.green,
          style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.w500),
          underline: SizedBox(),
          icon: Icon(Icons.arrow_drop_down, color: Colors.white),
          items: [DropdownMenuItem(value: "USD", child: Text("USD"))],
          onChanged: null, // Disabled as there's only one currency
        ),
      ),
    );
  }

  Widget _buildKeypad() {
    const List<List<String>> keys = [
      ["1", "2", "3"],
      ["4", "5", "6"],
      ["7", "8", "9"],
      [".", "0", "<"],
    ];

    return Column(
      children: keys
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
        child: Text(text, style: const TextStyle(fontSize: 24, color: Colors.white)),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomMsgButton(
            bgColor: AppColors.glowButton,
            title: "Request",
            titleColor: AppColors.bgColor,
            onTap: () {}, // Define action if needed
          ),
          CustomMsgButton(
            bgColor: AppColors.glowButton,
            title: "Pay",
            titleColor: AppColors.bgColor,
            onTap: _showPaymentPopup,
          ),
        ],
      ),
    );
  }
}

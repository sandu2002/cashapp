import 'package:cashapp/pages/send_money_screen.dart';
import 'package:cashapp/utils/colors.dart';
import 'package:cashapp/utils/constants.dart';
import 'package:cashapp/utils/text_style.dart';
import 'package:cashapp/widget/custom_button.dart';
import 'package:cashapp/widget/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      //

      //
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Money", style: AppTextStyles.appTitle),
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
            SizedBox(height: 35),

            // Cash Balance Section
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.all(AppConstants.kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Cash Balance',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.mainTxtColor,
                          ).copyWith(fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            Text(
                              'Account & Routing',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.subTxtColor,
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: const Color.fromARGB(255, 212, 210, 210),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      '\$4,235,500.44',
                      style: TextStyle(
                        color: Color(0xff343434),
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                          GoRouter.of(context).go("/sendmoney");
                          },
                          child: CustomButton(
                            bgColor: const Color(0xffF5F5F5),
                            title: "Add Cash",
                            titleColor: AppColors.mainTxtColor,
                            
                          ),
                        ),
                        CustomButton(
                          bgColor: const Color(0xffF5F5F5),
                          title: "Cash Out",
                          titleColor: AppColors.mainTxtColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 35),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomCard(
                      bgColor: AppColors.bWhiteColor,
                      title: "Saving",
                      img: 'assets/saving.png',
                      description: "\$100.00",
                      subDescription: "Save for a goal",
                    ),
                    CustomCard(
                      bgColor: AppColors.bWhiteColor,
                      title: "Bitcoin",
                      img: 'assets/Vector 12.png',
                      description: "\$92.54",
                      subDescription: "0.50% today",
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomCard(
                      bgColor: AppColors.bWhiteColor,
                      title: "Stock",
                      img: 'assets/Vector 13.png',
                      description: "\$1992.54",
                      subDescription: "0.50% today",
                    ),
                    CustomCard(
                      bgColor: AppColors.bWhiteColor,
                      title: "Free tax",
                      img: 'assets/file.png',
                      description: "\$0.00",
                      subDescription: "No taxes",
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:exams_app1/custom.dart';
import 'package:flutter/material.dart';

class Plans extends StatefulWidget {
  const Plans({super.key});

  @override
  State<Plans> createState() => _PlansState();
}

class _PlansState extends State<Plans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(), 
      endDrawer: CustomDrawer(),
      backgroundColor: const Color(0xFFEBFCFD),
      body: Column(
        children: [
          const SizedBox(height: 32),
          const Text(
            "Ready for Unlimited Practice?",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Get More Attempts Now!",
            style: TextStyle(
              color: Color(0x60094647),
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
              child: Column(
                children: [
                  Expanded(child: buildPlanContainer("Economy Plan", "10 Attempts", "50 EGP")),
                  const SizedBox(height: 16),
                  Expanded(child: buildPlanContainer("Gold Plan", "40 Attempts", "150 EGP")),
                  const SizedBox(height: 16),
                  Expanded(child: buildPlanContainer("Premium Plan", "100 Attempts", "299 EGP")),
                ],
              ),
            ),
          ),
          CustomBottomNavBar(), 
        ],
      ),
    );
  }

  Widget buildPlanContainer(String title, String details, String price) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFF094647),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                details,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right:16),
                child: Text(
                  price,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: 132,
            height: 32,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF914C),
              ),
              onPressed: () {},
              child: const Text(
                "Get it",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

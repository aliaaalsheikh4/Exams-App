import 'package:exams_app1/custom.dart';
import 'package:flutter/material.dart';

class Reviews extends StatefulWidget {
  const Reviews({super.key});

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  
  final List<Widget> reviews = [
    const ReviewWidget(
      image: AssetImage('lib/assets/Profile.png'),
      name: 'Lia',
      review: 'This app is amazing! Totally love it.',
    ),
    const ReviewWidget(
      image: AssetImage('lib/assets/Profile.png'),
      name: 'Lia',
      review: 'Great experience using this app!',
    ),
    const ReviewWidget(
      image: AssetImage('lib/assets/Profile.png'),
      name: 'Lia',
      review: 'Great experience using this app!',
    ),
    const ReviewWidget(
      image: AssetImage('lib/assets/Profile.png'),
      name: 'Lia',
      review: 'Great experience using this app!',
    ),
    const ReviewWidget(
      image: AssetImage('lib/assets/Profile.png'),
      name: 'Lia',
      review: 'Great experience using this app!',
    ),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      endDrawer: CustomDrawer(),
      backgroundColor: const Color(0xFFEBFCFD),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            "Coders' Reviews",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          
          Expanded(
            child: ListView(
              children: reviews, 
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: CustomBottomNavBar(),
          ),
        ],
      ),
    );
  }
}

class ReviewWidget extends StatelessWidget {
  final ImageProvider image;
  final String name;
  final String review;

  const ReviewWidget({
    super.key,
    required this.image,
    required this.name,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        height: 144,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 24, 
              backgroundImage: image, 
            ),
            const SizedBox(height: 8), 
            Text(
              name, 
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14, 
              ),
            ),
            const SizedBox(height: 8),
            Text(
              review,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

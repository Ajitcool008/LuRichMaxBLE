import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lurichmaxble/core/constants/app_colors.dart';

class ProfessionalsProfileScreen extends StatelessWidget {
  const ProfessionalsProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appColor,
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        title: const Text('Profile', style: TextStyle(color: Colors.white)),
      ),
      floatingActionButton: Container(
        color: Colors.transparent,
        width: Get.width * 0.5, // Take complete width of the screen
        padding: const EdgeInsets.symmetric(horizontal: 20), // Optional padding
        child: FloatingActionButton(
          heroTag: "draft event",
          onPressed: () async {},
          backgroundColor: AppColors.appColor, // Yellow background color
          child: Text(
            "Book Now",
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/image (1).png'),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Jackson Una',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Plumber, Electrician',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text('Available for', style: TextStyle(color: Colors.grey)),
              const Text(
                'Onsite Task',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                'About',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const Text(
                'An electrician is a tradesperson specializing in electrical wiring of buildings, transmission lines, stationary machines, and related equipment. Electricians may be employed in the installation of new electrical components or the maintenance.',
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Gallery',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    'View all',
                    style: TextStyle(color: Colors.blue, fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              CarouselSlider(
                items:
                    [
                      'assets/images/image (1).png',
                      'assets/images/image (1).png',
                      'assets/images/image (1).png',
                    ].map((imgPath) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(imgPath, fit: BoxFit.cover),
                      );
                    }).toList(),
                options: CarouselOptions(
                  height: 100,
                  enableInfiniteScroll: false,
                  viewportFraction: 0.4,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Reviews & Rating',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 10),
              ...List.generate(3, (index) => const ReviewTile()),
            ],
          ),
        ),
      ),
    );
  }
}

class ReviewTile extends StatelessWidget {
  const ReviewTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/image (1).png'),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Vivek Kumar',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Icon(Icons.star, color: Colors.orange, size: 16),
                  const Text(
                    'Looking for Best Electrician Near you? Get lowest prices for electrician services in Delhi.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

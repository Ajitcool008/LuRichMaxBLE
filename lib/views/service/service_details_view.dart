// lib/views/service/service_details_view.dart (For viewing service provider details)
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';

class ServiceDetailsView extends StatelessWidget {
  const ServiceDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = Get.arguments;
    final Map<String, dynamic> provider = args['provider'];

    return Scaffold(
      appBar: AppBar(title: const Text('Provider Details')),
      floatingActionButton: SizedBox(
        width: 150,
        child: FloatingActionButton.extended(
          onPressed: () {
            Get.toNamed(AppRoutes.formList);
          },
          label: const Text('Book Now'),
          icon: const Icon(Icons.calendar_today),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Provider header
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey.shade200,
              child: Center(
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: const Icon(
                    Icons.person,
                    size: 70,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Provider name and rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        provider['name'],
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber),
                          const SizedBox(width: 4),
                          Text(
                            '${provider['rating']}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Text(
                    provider['profession'],
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                  ),

                  const SizedBox(height: 16),

                  // Available for
                  const Text(
                    'Available for',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 8),

                  Chip(
                    label: Text(provider['available_for'] ?? 'Onsite Service'),
                    backgroundColor: Colors.blue.shade100,
                  ),

                  const SizedBox(height: 16),

                  // About
                  const Text(
                    'About',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    provider['description'],
                    style: const TextStyle(fontSize: 16),
                  ),

                  const SizedBox(height: 16),

                  // Services & Pricing
                  const Text(
                    'Services & Pricing',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 8),

                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Hourly Rate'),
                          Text(
                            provider['hourly_rate'] ?? '\$0/hr',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Reviews & Ratings
                  const Text(
                    'Reviews & Ratings',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 8),

                  _buildReviewCard(
                    name: 'John Smith',
                    rating: 4.5,
                    comment: 'Great service, very professional and timely.',
                  ),

                  _buildReviewCard(
                    name: 'Sarah Johnson',
                    rating: 5.0,
                    comment: 'Excellent work! Would highly recommend.',
                  ),

                  const SizedBox(height: 80), // Space for the FAB
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewCard({
    required String name,
    required double rating,
    required String comment,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '$rating',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(comment),
          ],
        ),
      ),
    );
  }
}

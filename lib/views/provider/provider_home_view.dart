// lib/views/provider/provider_home_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/service_request_controller.dart';
import '../../models/service_request_model.dart';
import '../../routes/app_routes.dart';

class ProviderHomeView extends StatelessWidget {
  const ProviderHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final ServiceRequestController controller =
        Get.find<ServiceRequestController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Jobs'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => controller.loadServiceRequests(),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.serviceRequests.isEmpty) {
          return const Center(
            child: Text('No service requests available at the moment'),
          );
        }

        return ListView.builder(
          itemCount: controller.serviceRequests.length,
          itemBuilder: (context, index) {
            ServiceRequestModel request = controller.serviceRequests[index];
            return _buildRequestCard(context, request);
          },
        );
      }),
    );
  }

  Widget _buildRequestCard(BuildContext context, ServiceRequestModel request) {
    return Card(
      child: InkWell(
        onTap: () {
          Get.toNamed(
            AppRoutes.requestDetails,
            arguments: {'request': request, 'isProvider': true},
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                request.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                request.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.location_on, size: 16),
                  const SizedBox(width: 4),
                  Expanded(child: Text(request.location)),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.calendar_today, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    '${request.dateTime.day}/${request.dateTime.month}/${request.dateTime.year}',
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(
                        AppRoutes.requestDetails,
                        arguments: {'request': request, 'isProvider': true},
                      );
                    },
                    child: const Text('Send Proposal'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

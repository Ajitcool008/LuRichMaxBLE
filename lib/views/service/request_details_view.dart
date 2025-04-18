// lib/views/service/request_details_view.dart (For viewing service request details)
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/proposal_controller.dart';
import '../../models/proposal_model.dart';
import '../../models/service_request_model.dart';

class RequestDetailsView extends StatelessWidget {
  const RequestDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProposalController controller = Get.find<ProposalController>();
    final Map<String, dynamic> args = Get.arguments;
    final ServiceRequestModel request = args['request'];
    final bool isProvider = args['isProvider'] ?? false;

    final TextEditingController proposalDescController =
        TextEditingController();
    final TextEditingController priceController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Request Details')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Request title and details
              Text(
                request.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              // Description
              const Text(
                'Description:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              Text(request.description, style: const TextStyle(fontSize: 16)),

              const SizedBox(height: 16),

              // Location
              Row(
                children: [
                  const Icon(Icons.location_on),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      request.location,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // Date and time
              Row(
                children: [
                  const Icon(Icons.calendar_today),
                  const SizedBox(width: 8),
                  Text(
                    '${request.dateTime.day}/${request.dateTime.month}/${request.dateTime.year} at ${request.dateTime.hour}:${request.dateTime.minute}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Additional details
              const Text(
                'Additional Details:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              // Display any additional details as key-value pairs
              ...request.additionalDetails.entries.map(
                (entry) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${entry.key}: ',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Expanded(child: Text('${entry.value}')),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // If provider is viewing, show form to submit proposal
              if (isProvider) ...[
                const Text(
                  'Submit Your Proposal',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 16),

                TextField(
                  controller: proposalDescController,
                  decoration: const InputDecoration(
                    labelText: 'Proposal Description',
                    hintText: 'Describe how you can help with this request',
                  ),
                  maxLines: 4,
                ),

                const SizedBox(height: 16),

                TextField(
                  controller: priceController,
                  decoration: const InputDecoration(
                    labelText: 'Your Price (\$)',
                    hintText: 'Enter your price',
                  ),
                  keyboardType: TextInputType.number,
                ),

                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  child: Obx(
                    () => ElevatedButton(
                      onPressed:
                          controller.isLoading.value
                              ? null
                              : () async {
                                if (proposalDescController.text.isEmpty ||
                                    priceController.text.isEmpty) {
                                  Get.snackbar(
                                    'Error',
                                    'Please fill in all fields',
                                    snackPosition: SnackPosition.BOTTOM,
                                  );
                                  return;
                                }

                                double price;
                                try {
                                  price = double.parse(priceController.text);
                                } catch (e) {
                                  Get.snackbar(
                                    'Error',
                                    'Please enter a valid price',
                                    snackPosition: SnackPosition.BOTTOM,
                                  );
                                  return;
                                }

                                ProposalModel proposal = ProposalModel(
                                  id: '',
                                  serviceRequestId: request.id,
                                  providerId: '', // Will be set in controller
                                  userId: request.userId,
                                  description: proposalDescController.text,
                                  price: price,
                                  status: 'pending',
                                  createdAt: DateTime.now(),
                                );

                                bool success = await controller.createProposal(
                                  proposal,
                                );
                                if (success) {
                                  Get.back();
                                }
                              },
                      child:
                          controller.isLoading.value
                              ? const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              )
                              : const Text('Submit Proposal'),
                    ),
                  ),
                ),
              ],

              // If consumer is viewing their own request
              if (!isProvider) ...[
                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      // Edit request
                    },
                    child: const Text('Edit Request'),
                  ),
                ),

                const SizedBox(height: 16),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // View proposals for this request
                    },
                    child: const Text('View Proposals'),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

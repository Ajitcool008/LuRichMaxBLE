// lib/views/consumer/consumer_proposals_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_constants.dart';
import '../../controllers/proposal_controller.dart';
import '../../models/proposal_model.dart';
import '../../routes/app_routes.dart';

class ConsumerProposalsView extends StatelessWidget {
  const ConsumerProposalsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProposalController controller = Get.find<ProposalController>();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Proposals'),
          bottom: const TabBar(tabs: [Tab(text: 'New'), Tab(text: 'Accepted')]),
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          List<ProposalModel> pendingProposals =
              controller.proposals
                  .where((p) => p.status == AppConstants.statusPending)
                  .toList();

          List<ProposalModel> acceptedProposals =
              controller.proposals
                  .where((p) => p.status == AppConstants.statusAccepted)
                  .toList();

          return TabBarView(
            children: [
              _buildProposalsList(pendingProposals, 'pending'),
              _buildProposalsList(acceptedProposals, 'accepted'),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildProposalsList(List<ProposalModel> proposals, String type) {
    if (proposals.isEmpty) {
      return Center(child: Text('No $type proposals found'));
    }

    return ListView.builder(
      itemCount: proposals.length,
      itemBuilder: (context, index) {
        ProposalModel proposal = proposals[index];
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Proposal from Provider',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  proposal.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.attach_money, size: 16),
                    const SizedBox(width: 4),
                    Text('\$${proposal.price.toStringAsFixed(2)}'),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '${proposal.createdAt.day}/${proposal.createdAt.month}/${proposal.createdAt.year}',
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (type == 'pending') ...[
                      TextButton(
                        onPressed: () {
                          // Reject proposal
                        },
                        child: const Text('Reject'),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          // Accept proposal
                        },
                        child: const Text('Accept'),
                      ),
                    ],
                    if (type == 'accepted') ...[
                      OutlinedButton(
                        onPressed: () {
                          // Navigate to chat with provider
                          Get.toNamed(AppRoutes.chat);
                        },
                        child: const Text('Message Provider'),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          // View proposal details
                        },
                        child: const Text('View Details'),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

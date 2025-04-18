// lib/views/provider/provider_contracts_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_constants.dart';
import '../../controllers/proposal_controller.dart';
import '../../models/proposal_model.dart';

class ProviderContractsView extends StatelessWidget {
  const ProviderContractsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProposalController controller = Get.find<ProposalController>();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Contracts'),
          bottom: const TabBar(
            tabs: [Tab(text: 'Active'), Tab(text: 'Completed')],
          ),
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          List<ProposalModel> activeProposals =
              controller.proposals
                  .where((p) => p.status == AppConstants.statusAccepted)
                  .toList();

          List<ProposalModel> completedProposals =
              controller.proposals
                  .where((p) => p.status == AppConstants.statusCompleted)
                  .toList();

          return TabBarView(
            children: [
              _buildProposalsList(activeProposals, 'active'),
              _buildProposalsList(completedProposals, 'completed'),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildProposalsList(List<ProposalModel> proposals, String type) {
    if (proposals.isEmpty) {
      return Center(child: Text('No $type contracts found'));
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
                  'Contract #${proposal.id.substring(0, 8)}',
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
                    if (type == 'active')
                      ElevatedButton(
                        onPressed: () {
                          // Show dialog to mark as completed
                        },
                        child: const Text('Mark as Completed'),
                      ),
                    if (type == 'completed')
                      OutlinedButton(
                        onPressed: () {
                          // Show contract details
                        },
                        child: const Text('View Details'),
                      ),
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

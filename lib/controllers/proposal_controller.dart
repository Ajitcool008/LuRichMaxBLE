// lib/controllers/proposal_controller.dart
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/proposal_model.dart';
import '../services/firebase/firebase_service.dart';
import 'auth_controller.dart';
import 'user_controller.dart';

class ProposalController extends GetxController {
  final FirebaseService _firebaseService = FirebaseService();
  final AuthController _authController = Get.find<AuthController>();
  final UserController _userController = Get.find<UserController>();

  RxList<ProposalModel> proposals = <ProposalModel>[].obs;
  RxBool isLoading = false.obs;

  StreamSubscription? _proposalSubscription;

  @override
  void onInit() {
    super.onInit();
    setupProposalStream();
  }

  Future<bool> createProposal(ProposalModel proposal) async {
    if (_authController.user.value == null) return false;

    try {
      isLoading.value = true;

      // Prepare the proposal data
      Map<String, dynamic> proposalData = proposal.toMap();

      // Set the provider ID to current user's ID
      proposalData['providerId'] = _authController.user.value!.uid;

      // Use the FirebaseService method instead of direct Firestore access
      await _firebaseService.createProposal(proposalData);

      isLoading.value = false;
      Get.snackbar('Success', 'Proposal submitted successfully');
      return true;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', 'Failed to submit proposal: ${e.toString()}');
      return false;
    }
  }

  void setupProposalStream() {
    if (_authController.user.value == null) return;

    // Cancel existing subscription
    _proposalSubscription?.cancel();

    try {
      // Get correct query based on user type
      Stream<QuerySnapshot> stream;
      if (_userController.currentUser.value?.userType == 'provider') {
        stream = _firebaseService.getProposalsForProvider(
          _authController.user.value!.uid,
        );
      } else {
        stream = _firebaseService.getProposalsForUser(
          _authController.user.value!.uid,
        );
      }

      _proposalSubscription = stream.listen(
        (QuerySnapshot snapshot) {
          proposals.value =
              snapshot.docs.map((doc) {
                Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
                data['id'] = doc.id;
                return ProposalModel.fromMap(data);
              }).toList();
        },
        onError: (error) {
          print('Error in proposal stream: $error');
          // Clear data on error
          proposals.clear();
        },
      );
    } catch (e) {
      print('Failed to setup proposal stream: $e');
    }
  }

  void clearStreams() {
    _proposalSubscription?.cancel();
    _proposalSubscription = null;
    proposals.clear();
  }

  @override
  void onClose() {
    clearStreams();
    super.onClose();
  }
}

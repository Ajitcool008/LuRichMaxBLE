// lib/controllers/auth_controller.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:lurichmaxble/controllers/chat_controller.dart';
import 'package:lurichmaxble/controllers/proposal_controller.dart';
import 'package:lurichmaxble/routes/app_routes.dart';

import '../models/user_model.dart';
import '../services/firebase/firebase_service.dart';

class AuthController extends GetxController {
  final FirebaseService _firebaseService = FirebaseService();

  Rx<User?> user = Rx<User?>(null);
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    user.value = FirebaseAuth.instance.currentUser;

    // Listen to auth state changes
    FirebaseAuth.instance.authStateChanges().listen((User? newUser) {
      // If user logged out
      if (user.value != null && newUser == null) {
        // User just logged out, make sure to clean up
        try {
          // Get controller references safely
          if (Get.isRegistered<ChatController>()) {
            Get.find<ChatController>().clearStreams();
          }
          if (Get.isRegistered<ProposalController>()) {
            Get.find<ProposalController>().clearStreams();
          }
        } catch (e) {
          print('Error clearing streams: $e');
        }
      }

      // Update user value
      user.value = newUser;
    });
  }

  Future<bool> signUp(
    String email,
    String password,
    String name,
    String phone,
    String userType,
  ) async {
    try {
      isLoading.value = true;
      UserCredential userCredential = await _firebaseService.signUp(
        email,
        password,
      );

      await _firebaseService.createUserProfile(userCredential.user!.uid, {
        'id': userCredential.user!.uid,
        'email': email,
        'name': name,
        'phone': phone,
        'userType': userType,
        'createdAt': DateTime.now(),
      });

      isLoading.value = false;
      return true;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', e.toString());
      return false;
    }
  }

  Future<bool> signIn(String email, String password) async {
    try {
      isLoading.value = true;
      await _firebaseService.signIn(email, password);
      isLoading.value = false;
      return true;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', e.toString());
      return false;
    }
  }

  Future<void> signOut() async {
    try {
      // Get references to controllers that have active streams
      final ChatController chatController = Get.find<ChatController>();
      final ProposalController proposalController =
          Get.find<ProposalController>();

      // Cancel all active streams before logging out
      chatController.clearStreams();
      proposalController.clearStreams();

      // Now sign out
      await _firebaseService.signOut();

      // Clear user data
      user.value = null;

      // Navigate to login screen
      Get.offAllNamed(AppRoutes.login);
    } catch (e) {
      Get.snackbar('Error', 'Failed to sign out: ${e.toString()}');
    }
  }

  Future<UserModel?> getUserProfile() async {
    if (user.value == null) return null;

    try {
      Map<String, dynamic>? userData = await _firebaseService.getUserProfile(
        user.value!.uid,
      );
      if (userData == null) return null;

      return UserModel.fromMap(userData);
    } catch (e) {
      Get.snackbar('Error', e.toString());
      return null;
    }
  }
}

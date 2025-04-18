// lib/controllers/user_controller.dart
import 'package:get/get.dart';

import '../models/user_model.dart';
import '../services/firebase/firebase_service.dart';
import 'auth_controller.dart';

class UserController extends GetxController {
  final FirebaseService _firebaseService = FirebaseService();
  final AuthController _authController = Get.find<AuthController>();

  Rx<UserModel?> currentUser = Rx<UserModel?>(null);
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserProfile();
  }

  Future<void> loadUserProfile() async {
    if (_authController.user.value == null) return;

    try {
      isLoading.value = true;
      Map<String, dynamic>? userData = await _firebaseService.getUserProfile(
        _authController.user.value!.uid,
      );

      if (userData != null) {
        currentUser.value = UserModel.fromMap(userData);
      }

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', 'Failed to load user profile');
    }
  }

  Future<void> updateUserProfile(Map<String, dynamic> data) async {
    if (_authController.user.value == null) return;

    try {
      isLoading.value = true;
      await _firebaseService.createUserProfile(
        _authController.user.value!.uid,
        data,
      );
      await loadUserProfile();
      isLoading.value = false;
      Get.snackbar('Success', 'Profile updated successfully');
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', 'Failed to update profile');
    }
  }
}

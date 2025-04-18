// lib/controllers/service_request_controller.dart
import 'package:get/get.dart';

import '../models/service_request_model.dart';
import '../services/firebase/firebase_service.dart';
import 'auth_controller.dart';

class ServiceRequestController extends GetxController {
  final FirebaseService _firebaseService = FirebaseService();
  final AuthController _authController = Get.find<AuthController>();

  RxList<ServiceRequestModel> serviceRequests = <ServiceRequestModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadServiceRequests();
  }

  Future<void> loadServiceRequests() async {
    try {
      isLoading.value = true;
      List<Map<String, dynamic>> requests =
          await _firebaseService.getServiceRequests();

      serviceRequests.value =
          requests
              .map((request) => ServiceRequestModel.fromMap(request))
              .toList();

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', 'Failed to load service requests');
    }
  }

  Future<bool> createServiceRequest(ServiceRequestModel request) async {
    if (_authController.user.value == null) return false;

    try {
      isLoading.value = true;

      Map<String, dynamic> requestData = request.toMap();
      requestData['userId'] = _authController.user.value!.uid;

      await _firebaseService.createServiceRequest(requestData);

      await loadServiceRequests();
      isLoading.value = false;
      Get.snackbar('Success', 'Service request created successfully');
      return true;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', 'Failed to create service request');
      return false;
    }
  }
}

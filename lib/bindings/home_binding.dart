// lib/bindings/home_binding.dart
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../controllers/chat_controller.dart';
import '../controllers/proposal_controller.dart';
import '../controllers/service_request_controller.dart';
import '../controllers/user_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // Make sure AuthController is already injected
    if (!Get.isRegistered<AuthController>()) {
      Get.put<AuthController>(AuthController());
    }

    Get.put<UserController>(UserController());
    Get.put<ServiceRequestController>(ServiceRequestController());
    Get.put<ProposalController>(ProposalController());
    Get.put<ChatController>(ChatController());
  }
}

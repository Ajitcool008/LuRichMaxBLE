import 'package:get/get_state_manager/get_state_manager.dart';

class CreateFormsController extends GetxController {
  final List<String> _forms = [
    "Requesting for Service",
    "Choose a Task",
    "Date and Time",
    "Wages and Charges",
    "Work Services",
  ];

  List<String> get forms => _forms;
}

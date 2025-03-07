import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lurichmaxble/components/app_colors.dart';
import 'package:lurichmaxble/components/common_button.dart';
import 'package:lurichmaxble/src/modules/create_request/views/form_detail_page.dart';

class FormsListScreen extends StatelessWidget {
  FormsListScreen({super.key});

  final List<String> _forms = [
    "Requesting for Service",
    "Choose a Task",
    "Date and Time",
    "Wages and Charges",
    "Work Services",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Forms',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff283891),
      ),
      body: ListView.builder(
        itemCount: _forms.length,
        padding: const EdgeInsets.only(
          bottom: 80.0,
        ), // Add padding to avoid overlap with FAB
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(_forms[index]),
              trailing: const Icon(Icons.check_box),
              onTap: () {
                Get.to(() => FormDetailScreen(formTitle: _forms[index]));
              },
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: Get.width * 0.91,
        height: 60,
        child: CommonButton(
          buttonTextColor: Colors.white,
          buttonColor: AppColors.appColor,
          buttonText: "POST",
          onTap: () {},
          buttonWidth: Get.width * 0.91,
        ),
      ),
    );
  }
}

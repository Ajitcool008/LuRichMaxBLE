import 'package:flutter/material.dart';
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
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(_forms[index]),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => FormDetailScreen(formTitle: _forms[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

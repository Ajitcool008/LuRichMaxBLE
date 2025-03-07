import 'package:flutter/material.dart';
import 'package:lurichmaxble/components/app_colors.dart';
import 'package:lurichmaxble/components/common_button.dart';
import 'package:lurichmaxble/src/modules/home_screen/views/home_view.dart';

class ServiceRequestScreen extends StatefulWidget {
  const ServiceRequestScreen({Key? key}) : super(key: key);

  @override
  _ServiceRequestScreenState createState() => _ServiceRequestScreenState();
}

class _ServiceRequestScreenState extends State<ServiceRequestScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _serviceController = TextEditingController();

  final List<String> _services = [
    'Plumbing service(s)',
    'Painter service(s)',
    'Electrician service(s)',
    'Carpenter service(s)',
    'Mechanic service(s)',
    'Gardener service(s)',
    'House service(s) Cleaning',
    'Driver service(s)',
    'Mason service(s)',
    'Welder service(s)',
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Service Request',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff283891),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Editable Dropdown
                Autocomplete<String>(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text.isEmpty) {
                      return const Iterable<String>.empty();
                    }
                    return _services.where((String option) {
                      return option.toLowerCase().contains(
                        textEditingValue.text.toLowerCase(),
                      );
                    });
                  },
                  onSelected: (String selection) {
                    _serviceController.text = selection;
                  },
                  fieldViewBuilder: (
                    BuildContext context,
                    TextEditingController fieldTextEditingController,
                    FocusNode fieldFocusNode,
                    VoidCallback onFieldSubmitted,
                  ) {
                    return TextFormField(
                      controller: fieldTextEditingController,
                      focusNode: fieldFocusNode,
                      decoration: const InputDecoration(
                        labelText: 'Select or Enter Service',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select or enter a service';
                        }
                        return null;
                      },
                    );
                  },
                ),
                const SizedBox(height: 50),
                // Next Button
                SizedBox(
                  width: double.infinity,
                  child: CommonButton(
                    buttonTextColor: Colors.white,
                    buttonColor: AppColors.appColor,
                    buttonText: "Next",
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        // Handle the next action, e.g., navigate to another screen
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomeView()),
                          (route) => false,
                        );
                      }
                    },
                    buttonWidth: width * 0.91,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

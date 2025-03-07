import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lurichmaxble/components/input_text_field.dart';

class FormDetailScreen extends StatefulWidget {
  final String formTitle;
  const FormDetailScreen({Key? key, required this.formTitle}) : super(key: key);

  @override
  _FormDetailScreenState createState() => _FormDetailScreenState();
}

class _FormDetailScreenState extends State<FormDetailScreen> {
  final TextEditingController _requestingForController =
      TextEditingController();
  final TextEditingController _tradeProfessionController =
      TextEditingController();
  final TextEditingController _roleSpecialityController =
      TextEditingController();

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

  final List<String> _trades = [
    'Trade(s)',
    'Profession(s)',
    'Role(s)',
    'Speciality(s)',
  ];

  final List<String> _roles = [
    'Painter',
    'Plasterer',
    'Brick Layer',
    'Plumber',
  ];

  final List<String> _tasksChoose = [
    'Services(s) to render',
    'Service(s) required',
    'Task(s)',
    'Duty(s)',
    'Item(s) photo Image',
  ];

  final List<String> _adultChoose = [
    'Kid(s)',
    'Adult(s)',
    'Senior(s)',
    'Teen(s)',
    'people(s)',
  ];

  final List<String> _itemsNames = ['Advert(s)', 'Items(s) for Advert'];

  String? _selectedTrade;
  String? _selectedItemName;
  String? _selectedTask;
  String? _selectedadult;

  bool _isButtonEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.formTitle,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff283891),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.formTitle == "Requesting for Service") ...[
              const Text(
                "Requesting for:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
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
                  setState(() {
                    _requestingForController.text = selection;
                  });
                },
                fieldViewBuilder: (
                  BuildContext context,
                  TextEditingController fieldTextEditingController,
                  FocusNode fieldFocusNode,
                  VoidCallback onFieldSubmitted,
                ) {
                  return TextField(
                    controller: fieldTextEditingController,
                    focusNode: fieldFocusNode,
                    decoration: InputDecoration(
                      hintText: 'Search or enter manually',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),

              DropdownButton<String>(
                value: _selectedTrade,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedTrade = newValue!;
                  });
                },
                hint: const Text('Choose for profession:'),
                items:
                    _trades.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
              ),
              const SizedBox(height: 8),
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text.isEmpty) {
                    return const Iterable<String>.empty();
                  }
                  return _roles.where((String option) {
                    return option.toLowerCase().contains(
                      textEditingValue.text.toLowerCase(),
                    );
                  });
                },
                onSelected: (String selection) {
                  setState(() {
                    _roleSpecialityController.text = selection;
                  });
                },
                fieldViewBuilder: (
                  BuildContext context,
                  TextEditingController fieldTextEditingController,
                  FocusNode fieldFocusNode,
                  VoidCallback onFieldSubmitted,
                ) {
                  return TextField(
                    controller: fieldTextEditingController,
                    focusNode: fieldFocusNode,
                    decoration: InputDecoration(
                      hintText: 'Search or enter manually',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),

              DropdownButton<String>(
                value: _selectedItemName,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItemName = newValue!;
                  });
                },
                hint: const Text('Choose e.g: item(s) or Advert(s)'),
                items:
                    _itemsNames.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
              ),
              InputTextField(hintText: "Enter Item Name e.g: truck or advert"),
            ] else if (widget.formTitle == "Choose a Task") ...[
              DropdownButton<String>(
                value: _selectedTask,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedTask = newValue!;
                  });
                },
                hint: const Text('Choose e.g: Task(s) or Service(s)'),
                items:
                    _tasksChoose.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
              ),
              InputTextField(hintText: "Enter manually the task or service"),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text("Number of"),
                  SizedBox(width: 8),
                  DropdownButton<String>(
                    value: _selectedadult,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedadult = newValue!;
                      });
                    },
                    hint: const Text('Choose from options e.g: adults'),
                    items:
                        _adultChoose.map<DropdownMenuItem<String>>((
                          String value,
                        ) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                  ),
                ],
              ),
              InputTextField(hintText: "Enter manually the task or service"),
            ] else
              ...[],

            const Spacer(),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed:
                        _isButtonEnabled
                            ? () {
                              // Submit form action
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    '${widget.formTitle} submitted successfully!',
                                  ),
                                ),
                              );
                              Get.back();
                            }
                            : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isButtonEnabled = !_isButtonEnabled;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          _isButtonEnabled ? Colors.red : Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(
                      _isButtonEnabled ? 'Disable' : 'Enable',
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lurichmaxble/components/app_colors.dart';
import 'package:lurichmaxble/components/common_button.dart';
import 'package:lurichmaxble/components/input_text_field.dart';
import 'package:lurichmaxble/src/modules/create_request/controllers/form_controller.dart';
import 'package:lurichmaxble/src/utils/date_selector.dart';

class FormsListScreen extends StatefulWidget {
  const FormsListScreen({super.key});

  @override
  State<FormsListScreen> createState() => _FormsListScreenState();
}

class _FormsListScreenState extends State<FormsListScreen> {
  final List<String> _forms = [
    "Enter Service(s) / provider(s) required or items name to Hire",
    "Enter number of persons or animals etc, in need of Service(s) or number of Service(s) providers required",
    "Enter the number of Iteme(s) type(s) to deliver, install, hire, fix, post, test, stock or store etc, Make(s) & model(s) of device(s) to operate, or Fix etc. item(s) & type(s) to stock, deliver, post, hire, install, fix, test, make, or distribute, etc.",
    "Service(s) location address or area(s), home location Address(s) or area(s), Site location address(s) or area(s), delivery Location address(s) or area(s), service(s) location choice area(s) etc.",
    "Enter Service(s) date / time, Service(s) dates/times, delivery date/time, pickup & delivery dates/times, or starting & finishing dates/times, etc. or enter, service(s) date/time contact me let's agree on date & time, etc.",
    "Enter Service(s) Charges, wages or, Salaries etc, you are offering to pay per hour, or per month, etc. Or enter, Services Charges Contact me for consent, etc.",
    "Enter Service(s) duration, Shift duration, hiring duration, logging duration, project duration of employment duration etc, It applies to your request. Such as 8h, 11h, temporary, part time, or permament, etc.",
    "Enter request latest date & time",
    "Enter Advert(s)",
  ];

  // Track which sections are expanded
  final Map<int, bool> _expandedSections = {};

  // Controllers for form sections
  final TextEditingController _requestingForController =
      TextEditingController();
  final TextEditingController _tradeProfessionController =
      TextEditingController();
  final TextEditingController _roleSpecialityController =
      TextEditingController();

  // Lists for autocomplete and dropdowns
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

  final List<String> _toAttend = [
    'Needed',
    'Required',
    'To attend to',
    'To need of service(s)',
  ];

  final List<String> _toContact = [
    "Let's discuss on date",
    'Contact me to discuss on date and time',
  ];

  final List<String> _itemsNames = ['Advert(s)', 'Items(s) for Advert'];

  String? _selectedTrade;
  String? _selectedItemName;
  String? _selectedTask;
  String? _selectedadult;

  bool _isButtonEnabled = true;

  List<Map<String, dynamic>> _formData = [];

  @override
  void initState() {
    super.initState();
    Get.put(CreateFormsController());
    // Add initial form data for date & time section
    _addNewSet();
  }

  void _addNewSet() {
    setState(() {
      _formData.add({'date': null, 'time': null, 'dropdown': null});
    });
  }

  void _removeSet(int index) {
    setState(() {
      _formData.removeAt(index);
    });
  }

  Future<void> _pickDate(int index) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _formData[index]['date'] ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _formData[index]['date'] = picked;
      });
    }
  }

  Future<void> _pickTime(int index) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _formData[index]['time'] ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _formData[index]['time'] = picked;
      });
    }
  }

  // Toggle section expansion
  void _toggleSection(int index) {
    setState(() {
      _expandedSections[index] = !(_expandedSections[index] ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Forms',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: const Color(0xff283891),
      ),
      body: ListView.builder(
        itemCount: _forms.length,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            elevation: 2.0,
            child: Column(
              children: [
                // Section Header
                InkWell(
                  onTap: () => _toggleSection(index),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.vertical(
                        top: const Radius.circular(8.0),
                        bottom:
                            (_expandedSections[index] ?? false)
                                ? Radius.zero
                                : const Radius.circular(8.0),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            'Section ${index + 1} - ${_forms[index]}',
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Icon(
                            (_expandedSections[index] ?? false)
                                ? Icons.keyboard_arrow_down
                                : Icons.keyboard_arrow_right,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Section Content
                if (_expandedSections[index] ?? false)
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    width: double.infinity,
                    child: _buildSectionContent(index),
                  ),
              ],
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
          buttonText: "SUBMIT",
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Form submitted successfully!')),
            );
          },
          buttonWidth: Get.width * 0.91,
        ),
      ),
    );
  }

  Widget _buildSectionContent(int index) {
    switch (index) {
      case 0: // Requesting for Service
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Request",
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
                return _trades.where((String option) {
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
                    hintText: 'Search for profession/trade or enter manually',
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
              isExpanded: true,
              items:
                  _itemsNames.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
            ),
            const SizedBox(height: 8),
            InputTextField(hintText: "Enter Item Name e.g: truck or advert"),
          ],
        );

      case 1: // Choose a Task
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              value: _selectedTask,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedTask = newValue!;
                });
              },
              isExpanded: true,
              hint: const Text('Choose e.g: Task(s) or Service(s)'),
              items:
                  _tasksChoose.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
            ),
            const SizedBox(height: 8),
            InputTextField(hintText: "Enter manually the task or service"),
            const SizedBox(height: 16),

            Row(
              children: [
                const Text("Number of"),
                const SizedBox(width: 8),
                Expanded(
                  child: Autocomplete<String>(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text.isEmpty) {
                        return const Iterable<String>.empty();
                      }
                      return _adultChoose.where((String option) {
                        return option.toLowerCase().contains(
                          textEditingValue.text.toLowerCase(),
                        );
                      });
                    },
                    onSelected: (String selection) {
                      // Handle selection
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
                          hintText: 'Choose from options',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Autocomplete<String>(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text.isEmpty) {
                        return const Iterable<String>.empty();
                      }
                      return _toAttend.where((String option) {
                        return option.toLowerCase().contains(
                          textEditingValue.text.toLowerCase(),
                        );
                      });
                    },
                    onSelected: (String selection) {
                      // Handle selection
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
                          hintText: 'Choose to attend',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            InputTextField(hintText: "Enter number"),
            const SizedBox(height: 16),
            InputTextField(hintText: "Enter the Race(s) (optional)"),
            const SizedBox(height: 16),
            InputTextField(hintText: "Enter the Gender(s) (optional)"),
            const SizedBox(height: 16),
            InputTextField(hintText: "Enter the Age(s) (optional)"),
            const SizedBox(height: 16),
            InputTextField(hintText: "Enter the Species (optional)"),
            const SizedBox(height: 16),
            InputTextField(hintText: "Enter the Breed(s) (optional)"),
          ],
        );

      case 2: // Date and Time
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputTextField(hintText: "Enter the Service"),
            const SizedBox(height: 16),

            CreateEventSecondPage(
              con: Get.find<CreateFormsController>(),
              kToday: Get.find<CreateFormsController>().kToday,
            ),
            const SizedBox(height: 12),

            // Contact options
            Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text.isEmpty) {
                  return const Iterable<String>.empty();
                }
                return _toContact.where((String option) {
                  return option.toLowerCase().contains(
                    textEditingValue.text.toLowerCase(),
                  );
                });
              },
              onSelected: (String selection) {
                // Handle selection
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
                    hintText: "Contact me let's discuss on date",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                );
              },
            ),
          ],
        );

      case 3: // Wages and Charges
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputTextField(hintText: "Enter Booking Services"),
            const SizedBox(height: 16),
            InputTextField(hintText: "Enter Wages Charges"),
            const SizedBox(height: 16),
            InputTextField(hintText: "Enter Wages for per hour"),
          ],
        );

      case 4: // Work Services
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputTextField(hintText: "Enter Work Services"),
            const SizedBox(height: 16),
            InputTextField(hintText: "Contact me to Let's agree"),
            const SizedBox(height: 16),
            InputTextField(hintText: "Contact me to Let me know"),
            const SizedBox(height: 16),
            InputTextField(hintText: "Notify me for consent"),
          ],
        );

      default:
        return const SizedBox.shrink();
    }
  }
}

// lib/src/modules/create_request/views/form_list_screen.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lurichmaxble/components/app_colors.dart';
import 'package:lurichmaxble/components/common_autocomplete_testfield.dart';
import 'package:lurichmaxble/components/common_button.dart';
import 'package:lurichmaxble/components/input_text_field.dart';
import 'package:lurichmaxble/controllers/auth_controller.dart';
import 'package:lurichmaxble/controllers/service_request_controller.dart';
import 'package:lurichmaxble/models/service_request_model.dart';
import 'package:lurichmaxble/src/modules/create_request/controllers/form_controller.dart';
import 'package:lurichmaxble/src/utils/date_selector.dart';

class FormsListScreen extends StatefulWidget {
  const FormsListScreen({super.key});

  @override
  State<FormsListScreen> createState() => _FormsListScreenState();
}

class _FormsListScreenState extends State<FormsListScreen> {
  // Form controller and service request controller
  late CreateFormsController _formController;
  late ServiceRequestController _serviceRequestController;

  final List<String> _forms = [
    "Enter Services type / providers required or items name to Hire",
    "Enter number of persons or animals etc, in need of Services or number of Services providers required",
    "Enter the number of Iteme(s) & type(s) to deliver, install, hire, fix, post, test, stock or store etc, Make(s) & model(s) of device(s) to operate, or Fix etc. item(s) & type(s) to stock, deliver, post, hire, install, fix, test, make, or distribute, etc.",
    "Service(s) location address or area(s), home location Address(s) or area(s), Site location address(s) or area(s), delivery Location address(s) or area(s), service(s) location choice area(s) etc.",
    "Enter Services date / time, Services dates/times, delivery date/time, pickup & delivery dates/times, or starting & finishing dates/times, etc. or enter, service(s) date/time contact me let's agree on date & time, etc.",
    "Enter Service(s) Charges, wages or, Salaries etc, you are offering to pay per hour, or per month, etc. Or enter, Services Charges Contact me for consent, etc.",
    "Enter Service(s) duration, Shift duration, hiring duration, logging duration, project duration of employment duration etc, as it applies to your request. Such as 8h, 11h, temporary, part time, or permament, etc.",
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

  // Additional controllers
  TextEditingController _genderController = TextEditingController();
  TextEditingController _languageController = TextEditingController();
  final TextEditingController _serviceDetailsController =
      TextEditingController();
  final TextEditingController _experienceDetailsController =
      TextEditingController();
  final TextEditingController _experienceSelectController =
      TextEditingController();
  final TextEditingController _serviceSelectController =
      TextEditingController();
  final TextEditingController _thirdPortalSelectController =
      TextEditingController();
  final TextEditingController _fourPortalSelectController =
      TextEditingController();
  final TextEditingController _durationController = TextEditingController();

  String? _selectedGender;
  final List<String> _genders = [
    'Male',
    'Female',
    'Non-binary',
    'Genderqueer',
    'Genderfluid',
    'Agender',
    'Bigender',
    'Transgender',
    'Two-Spirit',
    'Intersex',
    'Pangender',
    'Demiboy',
    'Demigirl',
    'Androgynous',
    'Neutrois',
  ];

  final List<String> _languages = [
    'English',
    'Spanish',
    'French',
    'German',
    'Mandarin',
    'Arabic',
    'Hindi',
    'Portuguese',
    'Russian',
    'Japanese',
  ];

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
    'In need of service(s)',
  ];

  final List<String> _toContact = [
    "Let's discuss on date",
    'Contact me to discuss on date and time',
  ];

  final List<String> professions = [
    'Plumber',
    'Electrician',
    'Painter',
    'Carpenter',
    'Mechanic',
  ];

  String? _selectedExperienceType;
  String? _selectedBookingOption;
  String? _selectedsixBookingOption;
  String? _selectedSalaryOption;
  String? _selectedPerOption;
  final List<String> _experienceTypes = [
    'The Item(s) Video image(s) to hire',
    'The Item(s) Photo image(s) to purchase',
    'The Item(s) Photo image(s) to hire',
    'The Item(s) Video image(s) to purchase',
    'Experience(s)/Qualification(s)',
    'Experience(s)',
  ];

  String? _selectedServiceType;
  String? _selectedDurationType;
  String? _selectedTimeOption;
  final List<String> _serviceTypes = [
    'Service(s) required',
    'Service(s) to render',
    'Task(s)',
    'Responsibility(s)',
    'Reason(s) for hiring item(s)',
  ];

  final List<String> _portalthirdNumber = [
    'Number of item(s) to deliver',
    'Number of item(s) to install',
    'Number of item(s) to hire',
    'Number of item(s) & type to deliver',
  ];

  String? _selectedThirdPortalOption;
  String? _selectedFourPortalOption;
  String? _selectedContactOption;

  final List<String> _portalfourNumber = [
    'Site location address(s)',
    'Home location address(s)',
    'Site location area(s)',
    'Home location area(s)',
    'Service(s) location address(s)',
    'Service(s) location choice area(s)',
  ];

  final List<String> _itemsNames = ['Advert(s)', 'Items(s) for Advert'];

  String? _selectedTrade;
  String? _selectedItemName;
  String? _selectedTask;
  String? _selectedadult;

  bool _isButtonEnabled = true;
  bool _isLoading = false;

  List<Map<String, dynamic>> _formData = [];

  @override
  void initState() {
    super.initState();

    // Get the form controller
    _formController = Get.put(CreateFormsController());

    // Try to find the service request controller or create a new one
    if (Get.isRegistered<ServiceRequestController>()) {
      _serviceRequestController = Get.find<ServiceRequestController>();
    } else {
      try {
        _serviceRequestController = Get.put(ServiceRequestController());
      } catch (e) {
        print("Error initializing ServiceRequestController: $e");
        // Handle the error gracefully
      }
    }

    // Add initial form data for date & time section
    _addNewSet();

    // Expand first section by default
    _expandedSections[0] = true;
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

  // Show dropdown for trades/professions
  void _showTradesDropdown(BuildContext context) {
    final List<String> professions = [
      'Plumber',
      'Electrician',
      'Painter',
      'Carpenter',
      'Mechanic',
      ..._trades,
    ];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select a Profession'),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: professions.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(professions[index]),
                  onTap: () {
                    setState(() {
                      _tradeProfessionController.text = professions[index];
                    });
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  // Toggle section expansion
  void _toggleSection(int index) {
    setState(() {
      _expandedSections[index] = !(_expandedSections[index] ?? false);
    });
  }

  // Method to handle form submission
  Future<void> _submitForm() async {
    try {
      setState(() {
        _isLoading = true;
      });

      // Basic validation - ensure we have at least the title and required info
      if (_tradeProfessionController.text.isEmpty &&
          _requestingForController.text.isEmpty) {
        _showErrorSnackbar('Please enter service type or profession');
        setState(() {
          _isLoading = false;
        });
        return;
      }

      // Create request data
      final Map<String, dynamic> requestData = {
        'title':
            _tradeProfessionController.text.isNotEmpty
                ? _tradeProfessionController.text
                : _requestingForController.text,
        'description':
            _serviceDetailsController.text.isNotEmpty
                ? _serviceDetailsController.text
                : 'No additional details provided',
        'location':
            _fourPortalSelectController.text.isNotEmpty
                ? _fourPortalSelectController.text
                : 'Location not specified',
        'dateTime': Timestamp.fromDate(
          DateTime.now(),
        ), // Default to now if no date specified
        'additionalDetails': {
          'service_type': _selectedServiceType ?? '',
          'gender': _genderController.text,
          'language': _languageController.text,
          'experience': _experienceDetailsController.text,
          'booking_option': _selectedBookingOption,
        },
        'status': 'open',
      };

      // Use Firebase service to create service request
      try {
        if (Get.isRegistered<AuthController>()) {
          final AuthController authController = Get.find<AuthController>();
          if (authController.user.value != null) {
            requestData['userId'] = authController.user.value!.uid;
          }
        }

        // If we have date schedule list, use the first date
        if (_formController.dateScheduleList.isNotEmpty) {
          requestData['dateTime'] = _formController.dateScheduleList[0].dateSel;
        }

        // Submit request
        if (Get.isRegistered<ServiceRequestController>()) {
          await _serviceRequestController.createServiceRequest(
            ServiceRequestModel.fromMap(requestData),
          );

          _showSuccessSnackbar('Service request submitted successfully!');

          // Go back to previous screen
          Future.delayed(const Duration(seconds: 2), () {
            Get.back();
          });
        } else {
          // Fallback if ServiceRequestController is not registered
          _showSuccessSnackbar('Form submitted successfully!');
          Get.back();
        }
      } catch (e) {
        print("Error creating service request: $e");
        _showErrorSnackbar('Error creating service request: ${e.toString()}');
      }

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      _showErrorSnackbar('An unexpected error occurred: ${e.toString()}');
    }
  }

  void _showSuccessSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );
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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            // Note container
            Container(
              color: Colors.white,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Note:',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: const Text(
                      "Please skip portal-sections that do not apply to your request. Enter information in portals of your choice as it applies to your request and skip if it does not apply to your request by leaving it blank.",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),

            // ListView builder
            Expanded(
              child: ListView.builder(
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
                        // Section Header (toggle)
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
                                    'Portal ${index + 1} - ${_forms[index]}',
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
            ),
            const SizedBox(height: 70), // Space for floating button
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: Get.width * 0.91,
        height: 60,
        child: CommonButton(
          buttonTextColor: Colors.white,
          buttonColor: AppColors.appColor,
          buttonText: _isLoading ? "SUBMITTING..." : "SUBMIT",
          onTap:
              _isLoading
                  ? () {}
                  : () {
                    _submitForm();
                  },
          buttonWidth: Get.width * 0.91,
        ),
      ),
    );
  }

  // Gender dropdown widget
  Widget _buildGenderDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Gender (optional)",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        CustomAutocompleteTextField(
          options: _genders,
          controller: _genderController,
          hintText: 'Select gender or enter manually',
          onSelected: (String selected) {
            _genderController.text = selected;
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildExperienceQualificationRow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Note:',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: const Text(
                  'Select experience(s), experience(s)/qualification(s), '
                  'item(s) Video, or photo image(s) to hire from the drop-down options '
                  '& enter the details manually',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        Center(child: Text("(Optional)")),
        const SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left side - either dropdown or text field
            DropdownButtonFormField<String>(
              value: _selectedExperienceType,
              decoration: InputDecoration(
                hintText: 'Enter experience, etc',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              isExpanded: true,
              items:
                  _experienceTypes.map<DropdownMenuItem<String>>((
                    String value,
                  ) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedExperienceType = newValue!;
                  _experienceSelectController.text = newValue;
                });
              },
            ),
            const SizedBox(height: 5),
            // Right side text field
            TextField(
              controller: _experienceDetailsController,
              decoration: InputDecoration(
                hintText: 'Enter details manually',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  // Second row with service/task dropdown
  Widget _buildServiceTaskRow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Note:',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: const Text(
                  'Select Service(s) required, service(s) to render, task(s), responsibility(s), or reason(s) for hiring item(s) from the drop-down options & enter the details manually',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
              Text(
                ' *',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left side - either dropdown or text field
            DropdownButtonFormField<String>(
              value: _selectedServiceType,
              decoration: InputDecoration(
                hintText: 'Enter services(s) required, etc',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              isExpanded: true,
              items:
                  _serviceTypes.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedServiceType = newValue!;
                  _serviceSelectController.text = newValue;
                });
              },
            ),
            const SizedBox(height: 5),
            // Right side text field
            TextField(
              controller: _serviceDetailsController,
              decoration: InputDecoration(
                hintText: 'Enter details manually',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  // Language field widget
  Widget _buildLanguageField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Preferred Language (optional)",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        CustomAutocompleteTextField(
          options: _languages,
          controller: _languageController,
          hintText: 'Select language or enter manually',
          onSelected: (String selected) {
            _languageController.text = selected;
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildSectionContent(int index) {
    switch (index) {
      case 0: // Requesting for Service
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Note:',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: const Text(
                      "Search or enter manually the service(s) type required",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              "(optional)",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  flex: 7,
                  child: CustomAutocompleteTextField(
                    options: _services,
                    controller: _requestingForController,
                    hintText: 'Search or enter manually',
                    onSelected: (selected) {
                      _requestingForController.text = selected;
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Request',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Note:',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: const Text.rich(
                      TextSpan(
                        text:
                            "Search or enter manually profession(s), trade(s) or item(s) name(s) to hire",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                        children: [
                          WidgetSpan(
                            child: Text(
                              '*',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                            alignment: PlaceholderAlignment.top,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              "Requesting for:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  flex: 6, // 70% width
                  child: CustomAutocompleteTextField(
                    options: professions,
                    controller: _tradeProfessionController,
                    hintText:
                        'Search service(s) or enter manually profession(s)/trade(s)',
                    onSelected: (String selected) {
                      _tradeProfessionController.text = selected;
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 4, // 30% width
                  child: DropdownButtonFormField<String>(
                    value: _selectedBookingOption,
                    decoration: InputDecoration(
                      hintText: 'To Hire',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    isExpanded: true,
                    items:
                        [
                          'To Hire',
                          'To Book',
                          'To Purchase',
                          'To Rent',
                          "Launge",
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedBookingOption = newValue;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            _buildLanguageField(),
            const SizedBox(height: 8),
            _buildGenderDropdown(),
            const SizedBox(height: 8),
            _buildExperienceQualificationRow(),
            _buildServiceTaskRow(),
          ],
        );

      // All other cases remain the same as in your original code
      case 1: // Choose a Task
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Note:',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: const Text(
                      "Enter genders for services that require knowing the client's or service provider's gender (e.g., massage services).\n\n"
                      "Enter ages for services that require knowing your age for service charges (e.g., charges for kids' barbering).\n\n"
                      "Enter races for services that require knowing the client's or service provider's race for good service delivery (e.g., hair and other beauty services).\n\n"
                      "Enter breeds for animal services.\n\n"
                      "Enter species for animal services.",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            InputTextField(hintText: "Enter manually the task or service"),
            const SizedBox(height: 16),

            Row(
              children: [
                const Text("Number of"),
                const SizedBox(width: 8),
                Expanded(
                  child: CustomAutocompleteTextField(
                    options: _adultChoose,
                    controller: TextEditingController(),
                    hintText: 'Persons',
                    onSelected: (String selected) {
                      // Handle selection
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CustomAutocompleteTextField(
                    options: _toAttend,
                    controller: TextEditingController(),
                    hintText: 'to attend to',
                    onSelected: (String selected) {
                      // Handle selection
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            InputTextField(hintText: "Enter number"),
            const SizedBox(height: 16),
            const Text(
              "Race(s) (optional)",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            InputTextField(hintText: "Enter the Race(s)"),
            const SizedBox(height: 16),
            const Text(
              "Gender(s) (optional)",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            InputTextField(hintText: "Enter the Gender(s)"),
            const SizedBox(height: 16),
            const Text(
              "Age(s) (optional)",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            InputTextField(hintText: "Enter the Age(s)"),
            const SizedBox(height: 16),
            const Text(
              "Species (optional)",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            InputTextField(hintText: "Enter the Species"),
            const SizedBox(height: 16),
            const Text(
              "Breed(s) (optional)",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            InputTextField(hintText: "Enter the Breed(s)"),
            const SizedBox(height: 16),
            const Text(
              "Additional info (optional)",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            InputTextField(hintText: "Enter additional info"),
          ],
        );

      case 2:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAutocompleteTextField(
              options: _portalthirdNumber,
              controller: _thirdPortalSelectController,
              hintText: 'Search or enter manually',
              onSelected: (String selected) {
                _thirdPortalSelectController.text = selected;
                _selectedThirdPortalOption = selected;
              },
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _serviceDetailsController,
              decoration: InputDecoration(
                hintText: 'Enter Manually',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        );

      case 3:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Note:',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: const Text(
                      "You can enter your choice location area(s) or address(s) of where you want service(s) to be given to you. By selecting from the options or creating your choice manually, & entering the area(s) or address(s) manually",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            CustomAutocompleteTextField(
              options: _portalfourNumber,
              controller: _fourPortalSelectController,
              hintText: 'Select an address or area',
              onSelected: (String selected) {
                _fourPortalSelectController.text = selected;
                _selectedFourPortalOption = selected;
              },
            ),
            const SizedBox(height: 8),
            TextField(
              controller:
                  TextEditingController(), // Using a separate controller to avoid conflicts
              decoration: InputDecoration(
                hintText: 'Enter Manually',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        );

      case 4: // Date and Time
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Note:',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: const Text(
                      "Choose a date or dates of your choice from the Calender, then select from the options or enter manually a purpose for the date. or enter your choice manually using the alternative date/time feature, to enter service(s) date/time, etc, contact me let's agree",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),

            CreateEventSecondPage(
              con: Get.find<CreateFormsController>(),
              kToday: Get.find<CreateFormsController>().kToday,
            ),
            const SizedBox(height: 12),
            Center(
              child: Text("OR", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  flex: 6,
                  child: CustomAutocompleteTextField(
                    options: [
                      'Service(s)',
                      'Delivery',
                      'Booking',
                      'Lauging',
                      'Pickup',
                      'Hiring',
                    ],
                    controller: TextEditingController(),
                    hintText: 'Service(s)',
                    onSelected: (String selected) {
                      // Handle selection
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 4,
                  child: CustomAutocompleteTextField(
                    options: ['Date', 'Time', 'Date/Time', 'Date(s)/Time(s)'],
                    controller: TextEditingController(),
                    hintText: 'Date/Time',
                    onSelected: (String selected) {
                      // Handle selection
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            // Contact options
            CustomAutocompleteTextField(
              options: _toContact,
              controller: TextEditingController(),
              hintText: "Contact me let's discuss on date",
              onSelected: (String selected) {
                // Handle selection
              },
            ),
          ],
        );

      case 5: // Wages and Charges
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Note:',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: const Text(
                      "Select from the options or enter your choice manually. For example, you can enter: Service(s) Charge(s) offering to pay £50 per hour, delivery, etc. or select from the options: Service(s) charge(s) contact me for consent, etc.",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            // First row of dropdowns
            Row(
              children: [
                Expanded(
                  child: CustomAutocompleteTextField(
                    options: [
                      'Booking',
                      'Service(s)',
                      'Rental',
                      'Consultation',
                    ],
                    controller: TextEditingController(),
                    hintText: 'Service(s)',
                    onSelected: (String selected) {
                      _selectedsixBookingOption = selected;
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomAutocompleteTextField(
                    options: ['Salary', 'Charges', 'Fees', 'Wages'],
                    controller: TextEditingController(),
                    hintText: 'Charges',
                    onSelected: (String selected) {
                      _selectedSalaryOption = selected;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Text field for entering price
            CustomAutocompleteTextField(
              options: [
                ...List.generate(10, (index) => '£${(index + 2) * 5}'),
                'Contact me for consent',
              ],
              controller: TextEditingController(),
              hintText: 'Enter manually or select price',
              onSelected: (String selected) {
                // Handle selection
              },
            ),
            const SizedBox(height: 16),

            // Second row of dropdowns
            Row(
              children: [
                Expanded(
                  child: CustomAutocompleteTextField(
                    options: ['Per', 'For', '/'],
                    controller: TextEditingController(),
                    hintText: 'Select Per/For',
                    onSelected: (String selected) {
                      _selectedPerOption = selected;
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomAutocompleteTextField(
                    options: ['h', 'Hour', 'Month', 'Course'],
                    controller: TextEditingController(),
                    hintText: 'Hour',
                    onSelected: (String selected) {
                      _selectedTimeOption = selected;
                    },
                  ),
                ),
              ],
            ),
          ],
        );

      case 6: // Work Services
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),

            // Row with dropdown and text field for duration
            Row(
              children: [
                Expanded(
                  flex: 7,
                  child: CustomAutocompleteTextField(
                    options: [
                      'Booking',
                      'Service(s)',
                      'Shift',
                      'Work',
                      'Contract',
                      'Course',
                      'Hiring',
                      'Lodging',
                      'Project(s)',
                      'Service(s)',
                    ],
                    controller: TextEditingController(),
                    hintText: 'Select Duration Type',
                    onSelected: (String selected) {
                      _selectedDurationType = selected;
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Duration',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Dropdown for "Contact me to let's agree"
            CustomAutocompleteTextField(
              options: [
                "11 Hours",
                "Part Time",
                "Parmanent",
                "Contract based",
                "Temporary Position",
                "Contact me let me know",
                "Contact me to let's agree",
              ],
              controller: TextEditingController(),
              hintText: "Contact me to let's agree",
              onSelected: (String selected) {
                _selectedContactOption = selected;
              },
            ),
            const SizedBox(height: 16),
          ],
        );
      case 7: // Request latest date & time
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),

            // Row with two fields: Request latest date & time and DateTime picker
            Row(
              children: [
                // First box with text
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Request latest date & time',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(width: 16),

                // Second box with DateTime picker
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );

                      if (pickedDate != null) {
                        TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );

                        if (pickedTime != null) {
                          setState(() {
                            _formData.add({
                              'date': pickedDate,
                              'time': pickedTime,
                            });
                          });
                        }
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        _formData.isNotEmpty && _formData.last['date'] != null
                            ? '${_formData.last['date']?.toLocal().toString().split(' ')[0]} ${_formData.last['time']?.format(context)}'
                            : 'Select Date & Time',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        );
      case 8:
        return Column(
          children: [
            CustomAutocompleteTextField(
              options: _itemsNames,
              controller: TextEditingController(),
              hintText: 'Choose e.g: item(s) or Advert(s)',
              onSelected: (String selected) {
                _selectedItemName = selected;
              },
            ),
            const SizedBox(height: 8),
            InputTextField(hintText: "Enter Item Name e.g: truck or advert"),
          ],
        );
      default:
        return const SizedBox.shrink();
    }
  }
}

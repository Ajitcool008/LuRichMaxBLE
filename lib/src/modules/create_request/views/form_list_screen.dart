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

  // Add these controllers to your state
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
  String? _selectedBookingOption; // Added definition for _selectedBookingOption
  String? _selectedSalaryOption; // Added definition for _selectedSalaryOption
  String? _selectedPerOption; // Added definition for _selectedPerOption
  final List<String> _experienceTypes = [
    'The Item(s) Video image(s) to hire',
    'The Item(s) Photo image(s) to hire',
    'Experience(s)/Qualification(s)',
    'Experience(s)',
  ];

  String? _selectedServiceType;
  String? _selectedDurationType; // Added definition for _selectedDurationType
  String? _selectedTimeOption; // Added definition for _selectedTimeOption
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
  String?
  _selectedFourPortalOption; // Added definition for _selectedFourPortalOption
  String? _selectedContactOption; // Added definition for _selectedContactOption

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
      body: Column(
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
                const SizedBox(
                  width: 5,
                ), // Spacing between "Note:" and the content
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
        ],
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
        DropdownButtonFormField<String>(
          value: _selectedGender,
          decoration: InputDecoration(
            hintText: 'Select gender',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
          isExpanded: true,
          items:
              _genders.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedGender = newValue;
            });
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
              const SizedBox(
                width: 5,
              ), // Spacing between "Note:" and the content
              Expanded(
                child: const Text(
                  'Select experience(s), experience(s)/qualification(s), '
                  'item(s) Video, or photo image(s) to hire from the drop-down options '
                  '& enter the details manually',
                  textAlign:
                      TextAlign
                          .left, // Aligns the rest of the text to the right
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
              isExpanded:
                  true, // Ensures the dropdown takes up the available width
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
                  _experienceSelectController.text =
                      newValue; // Update the controller if needed
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
              const SizedBox(
                width: 5,
              ), // Spacing between "Note:" and the content
              Expanded(
                child: const Text(
                  'Select Service(s) required, service(s) to render, task(s), responsibility(s), or reason(s) for hiring item(s) from the drop-down options & enter the details manually',
                  textAlign:
                      TextAlign
                          .left, // Aligns the rest of the text to the right
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
              isExpanded:
                  true, // Ensures the dropdown takes up the available width
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
                  _serviceSelectController.text =
                      newValue; // Update the controller if needed
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
        Autocomplete<String>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text.isEmpty) {
              return const Iterable<String>.empty();
            }
            return _languages.where((String option) {
              return option.toLowerCase().contains(
                textEditingValue.text.toLowerCase(),
              );
            });
          },
          onSelected: (String selection) {
            setState(() {
              _languageController.text = selection;
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
                hintText: 'Select language or enter manually',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            );
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
                  const SizedBox(
                    width: 5,
                  ), // Spacing between "Note:" and the content
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
                    suffixText: "| Request",
                    suffixStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              },
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
                  const SizedBox(
                    width: 5,
                  ), // Spacing between "Note:" and the content
                  Expanded(
                    child: const Text(
                      "Search or enter manually the profession(s), trade(s) or item(s) name(s) to hire",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 14, color: Colors.black),
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

            Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text.isEmpty) {
                  return const Iterable<String>.empty();
                }
                return professions.where((String option) {
                  return option.toLowerCase().contains(
                    textEditingValue.text.toLowerCase(),
                  );
                });
              },
              onSelected: (String selection) {
                setState(() {
                  _tradeProfessionController.text = selection;
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
                    hintText:
                        'Search service(s) or enter manually profession(s)/trade(s)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixText: "| to hire",
                    suffixStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),

            _buildLanguageField(),
            const SizedBox(height: 8),
            _buildGenderDropdown(),
            const SizedBox(height: 8),
            _buildExperienceQualificationRow(),
            _buildServiceTaskRow(),

            // DropdownButton<String>(
            //   value: _selectedItemName,
            //   onChanged: (String? newValue) {
            //     setState(() {
            //       _selectedItemName = newValue!;
            //     });
            //   },
            //   hint: const Text('Choose e.g: item(s) or Advert(s)'),
            //   isExpanded: true,
            //   items:
            //       _itemsNames.map<DropdownMenuItem<String>>((String value) {
            //         return DropdownMenuItem<String>(
            //           value: value,
            //           child: Text(value),
            //         );
            //       }).toList(),
            // ),
            // const SizedBox(height: 8),
            // InputTextField(hintText: "Enter Item Name e.g: truck or advert"),
          ],
        );
      case 1: // Choose a Task
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // DropdownButton<String>(
            //   value: _selectedTask,
            //   onChanged: (String? newValue) {
            //     setState(() {
            //       _selectedTask = newValue!;
            //     });
            //   },
            //   isExpanded: true,
            //   hint: const Text('Choose e.g: Task(s) or Service(s)'),
            //   items:
            //       _tasksChoose.map<DropdownMenuItem<String>>((String value) {
            //         return DropdownMenuItem<String>(
            //           value: value,
            //           child: Text(value),
            //         );
            //       }).toList(),
            // ),
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
                          hintText: 'Persons',
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
                          hintText: 'to attend to',
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
            DropdownButtonFormField<String>(
              value: _selectedThirdPortalOption,
              decoration: InputDecoration(
                hintText: 'Select an option',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              isExpanded:
                  true, // Ensures the dropdown takes up the available width
              items:
                  _portalthirdNumber.map<DropdownMenuItem<String>>((
                    String value,
                  ) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedThirdPortalOption = newValue!;
                  _thirdPortalSelectController.text =
                      newValue; // Update the controller if needed
                });
              },
            ),
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
            DropdownButton<String>(
              value: _selectedFourPortalOption,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedFourPortalOption = newValue!;
                  _fourPortalSelectController.text =
                      newValue; // Update the controller if needed
                });
              },
              hint: const Text('Select an address or area'),
              isExpanded:
                  true, // Ensures the dropdown takes up the available width
              items:
                  _portalfourNumber.map<DropdownMenuItem<String>>((
                    String value,
                  ) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
            ),
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

      case 4: // Date and Time
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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

      case 5: // Wages and Charges
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First row of dropdowns
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: _selectedBookingOption,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedBookingOption = newValue!;
                      });
                    },
                    hint: const Text('Select Booking/Service(s)'),
                    isExpanded: true,
                    items:
                        ['Booking', 'Service(s)'].map<DropdownMenuItem<String>>(
                          (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          },
                        ).toList(),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButton<String>(
                    value: _selectedSalaryOption,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedSalaryOption = newValue!;
                      });
                    },
                    hint: const Text('Select Salary/Charges'),
                    isExpanded: true,
                    items:
                        ['Salary', 'Charges'].map<DropdownMenuItem<String>>((
                          String value,
                        ) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Text field for entering price
            InputTextField(hintText: "Enter manually or enter price"),
            const SizedBox(height: 16),

            // Second row of dropdowns
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: _selectedPerOption,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedPerOption = newValue!;
                      });
                    },
                    hint: const Text('Select Per/For'),
                    isExpanded: true,
                    items:
                        ['Per', 'For'].map<DropdownMenuItem<String>>((
                          String value,
                        ) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButton<String>(
                    value: _selectedTimeOption,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedTimeOption = newValue!;
                      });
                    },
                    hint: const Text('Select Hour/Month/Course'),
                    isExpanded: true,
                    items:
                        [
                          'Hour',
                          'Month',
                          'Course',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
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
                  child: DropdownButton<String>(
                    value: _selectedDurationType,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedDurationType = newValue!;
                      });
                    },
                    hint: const Text('Select Duration Type'),
                    isExpanded: true,
                    items:
                        [
                          'Project(s)',
                          'Shift',
                          'Service(s)',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: _durationController,
                    decoration: InputDecoration(
                      hintText: 'Duration',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Dropdown for "Contact me to let's agree"
            DropdownButton<String>(
              value: _selectedContactOption,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedContactOption = newValue!;
                });
              },
              hint: const Text("Contact me to let's agree"),
              isExpanded: true,
              items:
                  ["Contact me to let's agree"].map<DropdownMenuItem<String>>((
                    String value,
                  ) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
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

      default:
        return const SizedBox.shrink();
    }
  }
}

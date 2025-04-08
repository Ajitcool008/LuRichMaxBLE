import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lurichmaxble/app/modules/authention/widgets/input_text_field.dart';

class FormDetailScreen extends StatefulWidget {
  final String formTitle;
  const FormDetailScreen({super.key, required this.formTitle});

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

  final List<Map<String, dynamic>> _formData = [];

  @override
  void initState() {
    super.initState();
    // Add initial form data
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
              // const SizedBox(height: 16),

              // DropdownButton<String>(
              //   value: _selectedTrade,
              //   onChanged: (String? newValue) {
              //     setState(() {
              //       _selectedTrade = newValue!;
              //     });
              //   },
              //   hint: const Text('Choose for profession:'),
              //   items:
              //       _trades.map<DropdownMenuItem<String>>((String value) {
              //         return DropdownMenuItem<String>(
              //           value: value,
              //           child: Text(value),
              //         );
              //       }).toList(),
              // ),
              // const SizedBox(height: 8),
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
                  SizedBox(width: 2),
                  SizedBox(
                    width: 140,
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
                            hintText: 'Choose from options',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: 140,
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
                            hintText: 'Choose to attend',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // DropdownButton<String>(
                  //   value: _selectedadult,
                  //   onChanged: (String? newValue) {
                  //     setState(() {
                  //       _selectedadult = newValue!;
                  //     });
                  //   },
                  //   hint: const Text('Choose from options e.g: adults'),
                  //   items:
                  //       _adultChoose.map<DropdownMenuItem<String>>((
                  //         String value,
                  //       ) {
                  //         return DropdownMenuItem<String>(
                  //           value: value,
                  //           child: Text(value),
                  //         );
                  //       }).toList(),
                  // ),
                ],
              ),

              InputTextField(hintText: "Enter number"),

              const SizedBox(height: 16),

              InputTextField(hintText: "Enter the Race(s) ( optional )"),

              const SizedBox(height: 16),

              InputTextField(hintText: "Enter the Gender(s)  ( optional )"),

              const SizedBox(height: 16),

              InputTextField(hintText: "Enter the Age(s)  ( optional )"),

              const SizedBox(height: 16),

              InputTextField(hintText: "Enter the Species  ( optional )"),

              const SizedBox(height: 16),

              InputTextField(hintText: "Enter the Breed(s)  ( optional )"),
            ] else if (widget.formTitle == "Date and Time") ...[
              SingleChildScrollView(
                child: Column(
                  children: [
                    InputTextField(hintText: "Enter the Service"),

                    const SizedBox(height: 16),

                    ..._formData.asMap().entries.map((entry) {
                      int index = entry.key;
                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Date Picker
                              TextFormField(
                                readOnly: true,
                                controller: TextEditingController(
                                  text:
                                      _formData[index]['date'] != null
                                          ? '${_formData[index]['date']!.day}/${_formData[index]['date']!.month}/${_formData[index]['date']!.year}'
                                          : '',
                                ),
                                decoration: InputDecoration(
                                  labelText: 'Date',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.calendar_today),
                                    onPressed: () => _pickDate(index),
                                  ),
                                ),
                                onTap: () => _pickDate(index),
                              ),

                              const SizedBox(height: 12),

                              // Time Picker
                              TextFormField(
                                readOnly: true,
                                controller: TextEditingController(
                                  text:
                                      _formData[index]['time'] != null
                                          ? _formData[index]['time']!.format(
                                            context,
                                          )
                                          : '',
                                ),
                                decoration: InputDecoration(
                                  labelText: 'Time',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.access_time),
                                    onPressed: () => _pickTime(index),
                                  ),
                                ),
                                onTap: () => _pickTime(index),
                              ),

                              const SizedBox(height: 12),

                              // Dropdown
                              Autocomplete<String>(
                                optionsBuilder: (
                                  TextEditingValue textEditingValue,
                                ) {
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
                                  setState(() {
                                    _roleSpecialityController.text = selection;
                                  });
                                },
                                fieldViewBuilder: (
                                  BuildContext context,
                                  TextEditingController
                                  fieldTextEditingController,
                                  FocusNode fieldFocusNode,
                                  VoidCallback onFieldSubmitted,
                                ) {
                                  return TextField(
                                    controller: fieldTextEditingController,
                                    focusNode: fieldFocusNode,
                                    decoration: InputDecoration(
                                      hintText:
                                          "Contact me let's discuss on date",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  );
                                },
                              ),

                              const SizedBox(height: 12),

                              // Remove Button
                              if (_formData.length > 1)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      onPressed: () => _removeSet(index),
                                      iconSize: 32,
                                    ),
                                    const SizedBox(width: 8),
                                    const Text(
                                      'Delete',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      );
                    }),

                    // Add Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.add_circle,
                            color: Colors.green,
                          ),
                          onPressed: _addNewSet,
                          iconSize: 32,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Add More',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
            ] else if (widget.formTitle == "Wages and Charges") ...[
              InputTextField(hintText: "Enter Booking Services"),

              const SizedBox(height: 16),

              InputTextField(hintText: "Enter Wages Charges"),

              const SizedBox(height: 16),

              InputTextField(hintText: "Enter Wages for per hour"),

              const SizedBox(height: 16),
            ] else if (widget.formTitle == "Work Services") ...[
              InputTextField(hintText: "Enter Work Services"),

              const SizedBox(height: 16),

              InputTextField(hintText: "Contact me to Let's agree"),

              const SizedBox(height: 16),

              InputTextField(hintText: "Contact me to Let me know"),

              const SizedBox(height: 16),

              InputTextField(hintText: "Notify me for consent"),

              const SizedBox(height: 16),
            ],

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

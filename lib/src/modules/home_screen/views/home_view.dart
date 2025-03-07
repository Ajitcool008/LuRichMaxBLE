import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lurichmaxble/components/app_colors.dart';
import 'package:lurichmaxble/src/modules/create_request/views/form_list_screen.dart';
import 'package:lurichmaxble/src/modules/home_screen/views/my_task_view.dart';
import 'package:lurichmaxble/src/modules/home_screen/views/proposal_view.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';

class HomeView extends StatefulWidget {
  final String initialSearchQuery;
  const HomeView({super.key, required this.initialSearchQuery});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  late List<Widget> _pages;
  int _selectedIndex = 0;

  void changeTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(initialSearchQuery: widget.initialSearchQuery),
      ProposalView(),
      MyTask(),
      ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            // Web layout
            return Row(
              children: [
                NavigationRail(
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: changeTab,
                  labelType: NavigationRailLabelType.all,
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Feed'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.work_outline),
                      label: Text('Proposal'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.task),
                      label: Text('My Tasks'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.grid_view),
                      label: Text('More'),
                    ),
                  ],
                ),
                Expanded(child: _pages[_selectedIndex]),
              ],
            );
          } else {
            // Mobile layout
            return Scaffold(
              body: _pages[_selectedIndex],
              bottomNavigationBar: ResponsiveNavigationBar(
                selectedIndex: _selectedIndex,
                onTabChange: changeTab,
                backgroundColor: AppColors.appColor,
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                navigationBarButtons: const <NavigationBarButton>[
                  NavigationBarButton(
                    text: 'Feed',
                    icon: Icons.home,
                    backgroundGradient: LinearGradient(
                      colors: [Colors.yellow, Colors.green, Colors.blue],
                    ),
                  ),
                  NavigationBarButton(
                    text: 'Proposal',
                    icon: Icons.work_outline,
                    backgroundGradient: LinearGradient(
                      colors: [Colors.cyan, Colors.teal],
                    ),
                  ),
                  NavigationBarButton(
                    text: 'My Tasks',
                    icon: Icons.task,
                    backgroundGradient: LinearGradient(
                      colors: [Colors.green, Colors.yellow],
                    ),
                  ),
                  NavigationBarButton(
                    text: 'More',
                    icon: Icons.grid_view,
                    backgroundGradient: LinearGradient(
                      colors: [Colors.green, Colors.yellow],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final String initialSearchQuery;
  const HomePage({super.key, required this.initialSearchQuery});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _searchController;
  String _selectedQuery = "";

  final List<Map<String, String>> _requests = [
    {
      'request': "I'm available to hire",
      'to_render': "Plumbing service(s)",
      'profession': "Construction plumber",
      'services_to_render': "Pipe installation, Leak Fixing, Drain Cleaning",
      'date_time': "I will contact you to agree on date and time",
      'charges': "I will contact you for consent",
    },
    {
      'request': "I'm available to hire",
      'to_render': "Painting service(s)",
      'profession': "Professional Painter",
      'services_to_render': "Wall Painting, Spray Painting, Texture Painting",
      'date_time': "Available on request",
      'charges': "Negotiable after inspection",
    },
    {
      'request': "I'm available to hire",
      'to_render': "Electrician service(s)",
      'profession': "Certified Electrician",
      'services_to_render': "Wiring, Switchboard Repair, Appliance Fixing",
      'date_time': "Available on request",
      'charges': "Charges negotiable",
    },
    {
      'request': "I'm available to hire",
      'to_render': "Carpenter service(s)",
      'profession': "Skilled Carpenter",
      'services_to_render': "Furniture Making, Woodwork, Door & Window Repairs",
      'date_time': "Schedule as per client convenience",
      'charges': "Rates depend on work complexity",
    },
    {
      'request': "I'm available to hire",
      'to_render': "Mechanic service(s)",
      'profession': "Automobile Mechanic",
      'services_to_render':
          "Car Engine Repair, Brake Fixing, General Servicing",
      'date_time': "Flexible timing",
      'charges': "Inspection needed before final quote",
    },
    {
      'request': "I'm available to hire",
      'to_render': "Gardening service(s)",
      'profession': "Professional Gardener",
      'services_to_render': "Lawn Mowing, Tree Trimming, Landscaping",
      'date_time': "I will confirm availability",
      'charges': "Depends on project size",
    },
    {
      'request': "I'm available to hire",
      'to_render': "House Cleaning service(s)",
      'profession': "Cleaning Expert",
      'services_to_render': "Deep Cleaning, Carpet Cleaning, Sanitization",
      'date_time': "Available on weekends",
      'charges': "Flat hourly rate applies",
    },
    {
      'request': "I'm available to hire",
      'to_render': "Driver service(s)",
      'profession': "Professional Driver",
      'services_to_render': "Chauffeur Service, Taxi, Truck Driving",
      'date_time': "Available for daily or contract basis",
      'charges': "As per trip requirements",
    },
    {
      'request': "I'm available to hire",
      'to_render': "Masonry service(s)",
      'profession': "Experienced Mason",
      'services_to_render': "Brick Laying, Concrete Work, Construction",
      'date_time': "Requires scheduling",
      'charges': "Material costs separate",
    },
    {
      'request': "I'm available to hire",
      'to_render': "Welding service(s)",
      'profession': "Professional Welder",
      'services_to_render': "Metal Welding, Gate & Grills, Industrial Welding",
      'date_time': "Job-based timing",
      'charges': "Work complexity determines pricing",
    },
  ];

  final List<Map<String, dynamic>> _profiles = [
    {
      'name': "John Doe",
      'to_render': "Plumbing service(s)", // Hidden from UI
      'profession': "Construction plumber",
      'hourly_rate': "15/hour",
      'rating': 4.3,
      'description':
          "Experienced plumber with 10 years in the field, specializing in pipe installation and repair.",
    },
    {
      'name': "Jane Smith",
      'to_render': "Electrician service(s)", // Hidden from UI
      'profession': "Certified Electrician",
      'hourly_rate': "18/hour",
      'rating': 4.7,
      'description':
          "Licensed electrician with expertise in home wiring and commercial electrical setups.",
    },
    {
      'name': "Mike Johnson",
      'to_render': "Painting service(s)", // Hidden from UI
      'profession': "Professional Painter",
      'hourly_rate': "20/hour",
      'rating': 4.6,
      'description':
          "Specialist in interior & exterior painting, with 8 years of experience in the field.",
    },
    {
      'name': "David Lee",
      'to_render': "Carpenter service(s)", // Hidden from UI
      'profession': "Skilled Carpenter",
      'hourly_rate': "22/hour",
      'rating': 4.5,
      'description':
          "Expert in custom furniture making, wood repairs, and interior wooden installations.",
    },
    {
      'name': "Robert Wilson",
      'to_render': "Mechanic service(s)", // Hidden from UI
      'profession': "Automobile Mechanic",
      'hourly_rate': "25/hour",
      'rating': 4.8,
      'description':
          "Certified car mechanic with expertise in repairs, maintenance, and diagnostics.",
    },
    {
      'name': "Sarah Brown",
      'to_render': "Gardening service(s)", // Hidden from UI
      'profession': "Professional Gardener",
      'hourly_rate': "12/hour",
      'rating': 4.4,
      'description':
          "Gardening expert specializing in landscaping, lawn maintenance, and plant care.",
    },
    {
      'name': "Emily Davis",
      'to_render': "House Cleaning service(s)", // Hidden from UI
      'profession': "Cleaning Expert",
      'hourly_rate': "14/hour",
      'rating': 4.7,
      'description':
          "Specialist in home and office cleaning, deep sanitization, and organization.",
    },
    {
      'name': "Michael Thompson",
      'to_render': "Driver service(s)", // Hidden from UI
      'profession': "Professional Driver",
      'hourly_rate': "16/hour",
      'rating': 4.2,
      'description':
          "Experienced chauffeur with a focus on safe and timely transportation.",
    },
    {
      'name': "James Anderson",
      'to_render': "Masonry service(s)", // Hidden from UI
      'profession': "Experienced Mason",
      'hourly_rate': "30/hour",
      'rating': 4.9,
      'description':
          "Expert in concrete work, bricklaying, and large-scale construction.",
    },
    {
      'name': "William Martinez",
      'to_render': "Welding service(s)", // Hidden from UI
      'profession': "Professional Welder",
      'hourly_rate': "28/hour",
      'rating': 4.6,
      'description':
          "Metal fabrication and industrial welding specialist with over 12 years of experience.",
    },
  ];

  List<Map<String, String>> _filteredRequests = [];
  List<Map<String, dynamic>> _filteredProfiles = [];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.initialSearchQuery);
    _selectedQuery = widget.initialSearchQuery;
    _filterResults();
  }

  void _filterResults() {
    setState(() {
      _filteredRequests =
          _requests
              .where(
                (request) => request['to_render']!.toLowerCase().contains(
                  _selectedQuery.toLowerCase(),
                ),
              )
              .toList();

      _filteredProfiles =
          _profiles
              .where(
                (profile) => profile['to_render']!.toLowerCase().contains(
                  _selectedQuery.toLowerCase(),
                ),
              )
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(title: Text("${_searchController.text} Request")),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SizedBox(
          width: width * 0.8,
          height: 60,
          child: ElevatedButton(
            onPressed: () {
              Get.to(() => FormsListScreen());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff283891),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              elevation: 8,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.add, size: 28, color: Colors.white),
                Text(
                  'Make a request for service',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text.isEmpty) {
                    return const Iterable<String>.empty();
                  }
                  return _requests.map((e) => e['to_render']!).where((option) {
                    return option.toLowerCase().contains(
                      textEditingValue.text.toLowerCase(),
                    );
                  });
                },
                onSelected: (String selection) {
                  setState(() {
                    _searchController.text = selection;
                    _selectedQuery = selection;
                    _filterResults();
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
                      hintText: 'Search for a service...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  );
                },
              ),
            ),
            const TabBar(
              indicatorColor: Colors.blue,
              tabs: [
                Tab(icon: Icon(Icons.list), text: "Requests"),
                Tab(icon: Icon(Icons.person), text: "Profiles"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _filteredRequests.isEmpty
                      ? const Center(child: Text("No requests found"))
                      : ListView.builder(
                        itemCount: _filteredRequests.length,
                        itemBuilder: (context, index) {
                          var request = _filteredRequests[index];
                          return Card(
                            margin: const EdgeInsets.all(8),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Request: ',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                        TextSpan(
                                          text: request['to_render']!,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'To Render: ',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        TextSpan(
                                          text: request['profession']!,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'My Profession: ',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        TextSpan(
                                          text: request['services_to_render']!,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Service(s) date time: ',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        TextSpan(
                                          text: request['date_time']!,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Service(s) charges: ',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        TextSpan(
                                          text: request['charges']!,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                  _filteredProfiles.isEmpty
                      ? const Center(child: Text("No profiles found"))
                      : ListView.builder(
                        itemCount: _filteredProfiles.length,
                        itemBuilder: (context, index) {
                          var profile = _filteredProfiles[index];
                          return Card(
                            margin: const EdgeInsets.all(8),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.blue,
                                child: Text(profile['name']![0]),
                              ),
                              title: Text(
                                profile['name']!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("💼 ${profile['profession']}"),
                                  Text("💲 ${profile['hourly_rate']}"),
                                  Text("⭐ Rating: ${profile['rating']}"),
                                  Text("📜 ${profile['description']}"),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Profile Page'));
  }
}

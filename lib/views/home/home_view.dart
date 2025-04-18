// lib/views/home/home_view.dart (Main container integrating the existing HomeView)
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lurichmaxble/components/app_colors.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';

import '../../constants/app_constants.dart';
import '../../controllers/user_controller.dart';
import '../../src/modules/home_screen/views/home_view_page.dart';
import '../../views/consumer/consumer_proposals_view.dart';
import '../../views/provider/provider_contracts_view.dart';
import '../../views/provider/provider_home_view.dart';
import '../../views/shared/chat_list_view.dart';
import '../../views/shared/profile_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  late UserController _userController;
  bool _isConsumer = true;

  @override
  void initState() {
    super.initState();
    _userController = Get.find<UserController>();
    _checkUserType();
  }

  void _checkUserType() {
    if (_userController.currentUser.value != null) {
      _isConsumer =
          _userController.currentUser.value!.userType ==
          AppConstants.consumerType;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Wait for user data to load
      if (_userController.currentUser.value == null) {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      }

      _isConsumer =
          _userController.currentUser.value!.userType ==
          AppConstants.consumerType;

      return LayoutBuilder(
        builder: (context, constraints) {
          // Web layout
          if (constraints.maxWidth > 800) {
            return Scaffold(
              body: Row(
                children: [
                  // Navigation Rail for web
                  NavigationRail(
                    selectedIndex: _selectedIndex,
                    onDestinationSelected: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    labelType: NavigationRailLabelType.all,
                    destinations: [
                      NavigationRailDestination(
                        icon: const Icon(Icons.home),
                        label: Text(_isConsumer ? 'Home' : 'Jobs'),
                      ),
                      NavigationRailDestination(
                        icon: const Icon(Icons.work_outline),
                        label: Text(_isConsumer ? 'Proposals' : 'Contracts'),
                      ),
                      const NavigationRailDestination(
                        icon: Icon(Icons.chat_bubble_outline),
                        label: Text('Messages'),
                      ),
                      const NavigationRailDestination(
                        icon: Icon(Icons.person_outline),
                        label: Text('Profile'),
                      ),
                    ],
                  ),
                  // Main content area
                  Expanded(child: _buildBody()),
                ],
              ),
            );
          } else {
            // Mobile layout
            return Scaffold(
              body: _buildBody(),
              bottomNavigationBar: _buildBottomNavigationBar(),
            );
          }
        },
      );
    });
  }

  Widget _buildBody() {
    if (_isConsumer) {
      // Use the existing HomeView for consumer
      switch (_selectedIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const ConsumerProposalsView();
        case 2:
          return const ChatListView();
        case 3:
          return const ProfileView();
        default:
          return const HomePage();
      }
    } else {
      // Provider view
      switch (_selectedIndex) {
        case 0:
          return const ProviderHomeView();
        case 1:
          return const ProviderContractsView();
        case 2:
          return const ChatListView();
        case 3:
          return const ProfileView();
        default:
          return const ProviderHomeView();
      }
    }
  }

  Widget _buildBottomNavigationBar() {
    return ResponsiveNavigationBar(
      selectedIndex: _selectedIndex,
      onTabChange: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      backgroundColor: AppColors.appColor,
      textStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      navigationBarButtons: <NavigationBarButton>[
        NavigationBarButton(
          text: _isConsumer ? 'Home' : 'Jobs',
          icon: Icons.home,
          backgroundGradient: const LinearGradient(
            colors: [Colors.yellow, Colors.green, Colors.blue],
          ),
        ),
        NavigationBarButton(
          text: _isConsumer ? 'Proposal' : 'Contracts',
          icon: Icons.work_outline,
          backgroundGradient: const LinearGradient(
            colors: [Colors.cyan, Colors.teal],
          ),
        ),
        const NavigationBarButton(
          text: 'Messages',
          icon: Icons.chat,
          backgroundGradient: LinearGradient(
            colors: [Colors.green, Colors.yellow],
          ),
        ),
        const NavigationBarButton(
          text: 'More',
          icon: Icons.grid_view,
          backgroundGradient: LinearGradient(
            colors: [Colors.green, Colors.yellow],
          ),
        ),
      ],

      // currentIndex: _selectedIndex,
      // onTap: (index) {
      //   setState(() {
      //     _selectedIndex = index;
      //   });
      // },
      // type: BottomNavigationBarType.fixed,
      // selectedItemColor: Theme.of(context).primaryColor,
      // unselectedItemColor: Colors.grey,
      // items: [
      //   BottomNavigationBarItem(
      //     icon: const Icon(Icons.home),
      //     label: _isConsumer ? 'Home' : 'Jobs',
      //   ),
      //   BottomNavigationBarItem(
      //     icon: const Icon(Icons.work_outline),
      //     label: _isConsumer ? 'Proposals' : 'Contracts',
      //   ),
      //   const BottomNavigationBarItem(
      //     icon: Icon(Icons.chat_bubble_outline),
      //     label: 'Messages',
      //   ),
      //   const BottomNavigationBarItem(
      //     icon: Icon(Icons.person_outline),
      //     label: 'Profile',
      //   ),
      // ],
    );
  }
}

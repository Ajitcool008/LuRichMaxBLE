// lib/views/shared/profile_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../controllers/user_controller.dart';
import '../../routes/app_routes.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find<UserController>();
    final AuthController authController = Get.find<AuthController>();

    return Scaffold(
      body: Obx(() {
        if (userController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (userController.currentUser.value == null) {
          return const Center(child: Text('User profile not found'));
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              // Profile header with background color
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        size: 50,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      userController.currentUser.value!.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      userController.currentUser.value!.email,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),

              // Menu items
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildMenuItem(
                      icon: Icons.person,
                      title: 'Edit Profile',
                      onTap: () {
                        // Navigate to edit profile
                      },
                    ),
                    _buildMenuItem(
                      icon: Icons.location_on,
                      title: 'Address',
                      onTap: () {
                        // Navigate to address management
                      },
                    ),
                    _buildMenuItem(
                      icon: Icons.payment,
                      title: 'Payment History',
                      onTap: () {
                        // Navigate to payment history
                      },
                    ),
                    _buildMenuItem(
                      icon: Icons.notifications,
                      title: 'Notification Settings',
                      onTap: () {
                        // Navigate to notification settings
                      },
                    ),
                    _buildMenuItem(
                      icon: Icons.help_outline,
                      title: 'Help & Support',
                      onTap: () {
                        // Navigate to help & support
                      },
                    ),
                    _buildMenuItem(
                      icon: Icons.info_outline,
                      title: 'About Us',
                      onTap: () {
                        // Navigate to about us
                      },
                    ),
                    _buildMenuItem(
                      icon: Icons.privacy_tip_outlined,
                      title: 'Privacy Policy',
                      onTap: () {
                        // Navigate to privacy policy
                      },
                    ),
                    _buildMenuItem(
                      icon: Icons.logout,
                      title: 'Logout',
                      onTap: () async {
                        await authController.signOut();
                        Get.offAllNamed(AppRoutes.login);
                      },
                      isLogout: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color:
              isLogout
                  ? Colors.red.withOpacity(0.1)
                  : Colors.blue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: isLogout ? Colors.red : Colors.blue),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isLogout ? Colors.red : Colors.black,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}

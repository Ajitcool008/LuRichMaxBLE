import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: Get.width * 0.999,
            decoration: BoxDecoration(
              color: AppColors.appColor,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            ),
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/Rectangle 48.png'),
                ),
                SizedBox(height: 10),
                Text(
                  'Roshan Singh',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                _buildListItem(
                  Icons.person,
                  'Edit Profile',
                  onTap: () {
                    Get.to(() => EditProfilePage());
                  },
                ),
                Divider(color: Colors.grey.shade300),
                _buildListItem(
                  Icons.person,
                  'Personal Information',
                  onTap: () {},
                ),
                Divider(color: Colors.grey.shade300),
                _buildListItem(Icons.location_on, 'Address', onTap: () {}),
                Divider(color: Colors.grey.shade300),
                _buildListItem(
                  Icons.card_giftcard,
                  'Refer & Earn',
                  onTap: () {},
                ),
                Divider(color: Colors.grey.shade300),
                _buildListItem(Icons.payment, 'Payment History', onTap: () {}),
                Divider(color: Colors.grey.shade300),
                _buildSwitchItem(Icons.notifications, 'Notification'),
                Divider(color: Colors.grey.shade300),
                _buildListItem(
                  Icons.help_outline,
                  'Help & Support',
                  onTap: () {},
                ),
                Divider(color: Colors.grey.shade300),
                _buildListItem(Icons.info, 'About Us', onTap: () {}),
                Divider(color: Colors.grey.shade300),
                _buildListItem(
                  Icons.privacy_tip,
                  'Privacy Policy',
                  onTap: () {},
                ),
                Divider(color: Colors.grey.shade300),
                _buildListItem(
                  Icons.logout,
                  'Logout',
                  isLogout: true,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(
    IconData icon,
    String title, {
    bool isLogout = false,
    required Null Function() onTap,
  }) {
    return ListTile(
      dense: false,
      visualDensity: VisualDensity(horizontal: -1.0, vertical: -1.0),
      leading: Container(
        padding: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: AppColors.lightBlueColor,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Icon(icon, color: AppColors.appColor),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }

  Widget _buildSwitchItem(IconData icon, String title) {
    return SwitchListTile(
      activeColor: AppColors.appColor,
      secondary: Container(
        padding: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: AppColors.lightBlueColor,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Icon(icon, color: AppColors.appColor),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
      value: true,
      onChanged: (bool value) {},
    );
  }
}

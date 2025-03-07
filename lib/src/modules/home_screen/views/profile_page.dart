import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/app_colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: Get.width*0.999,
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
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                _buildListItem(Icons.person, 'Personal Information'),
                _buildListItem(Icons.location_on, 'Address'),
                _buildListItem(Icons.card_giftcard, 'Refer & Earn'),
                _buildListItem(Icons.payment, 'Payment History'),
                _buildSwitchItem(Icons.notifications, 'Notification'),
                _buildListItem(Icons.help_outline, 'Help & Support'),
                _buildListItem(Icons.info, 'About Us'),
                _buildListItem(Icons.privacy_tip, 'Privacy Policy'),
                _buildListItem(Icons.logout, 'Logout', isLogout: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(IconData icon, String title, {bool isLogout = false}) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: AppColors.lightBlueColor,
          borderRadius: BorderRadius.circular(6.0)
        ),
          child: Icon(icon, color:  AppColors.appColor)),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color:  Colors.black,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {},
    );
  }

  Widget _buildSwitchItem(IconData icon, String title) {
    return SwitchListTile(
      activeColor: AppColors.appColor,
      secondary: Container(
          padding: EdgeInsets.all(4.0),
          decoration: BoxDecoration(
              color: AppColors.lightBlueColor,
              borderRadius: BorderRadius.circular(6.0)
          ),
          child: Icon(icon, color: AppColors.appColor)),
      title: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      value: true,
      onChanged: (bool value) {},
    );
  }
}
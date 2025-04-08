import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Edit Profile', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/Rectangle 48.png'),
                    ),
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.deepPurple,
                      child: Icon(Icons.edit, color: Colors.white, size: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              
              _buildHeading("First Name"),
              _buildTextField('Joe', 'Joe'),
              SizedBox(height: 12),
              
              _buildHeading("Last Name"),
              _buildTextField('Smith', 'Smith'),
              SizedBox(height: 12),
              
              _buildHeading("Phone Number"),
              _buildPhoneField(),
              SizedBox(height: 12),

              _buildHeading("Email ID  "),
              _buildTextField('Email ID', 'Joe.smith@gmail.com'),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {},
                child: Text('SAVE', style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeading(String title){
    return Padding(
      padding: const EdgeInsets.only(left: 3.0, bottom: 4.0),
      child: Text(
          title,
          style: TextStyle(color: Colors.grey)),
    );
  }

  Widget _buildTextField(String label, String hint) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget _buildPhoneField() {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              //Image.asset('assets/flag.png', width: 24),
              SizedBox(width: 5),
              Text('+1', style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: '8010789567',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
            keyboardType: TextInputType.phone,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String selectedGovtIDType = 'Aadhar Card';
  List<String> govtIDTypes = [
    'Aadhar Card',
    'Driving License',
    'Passport',
    'Voter ID',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildProfilePicture(),
              SizedBox(height: 32),
              buildLocationField(),
              SizedBox(height: 16),
              buildEmailField(),
              SizedBox(height: 16),
              buildPhoneNumberField(),
              SizedBox(height: 16),
              buildGovtIDTypeDropdown(),
              SizedBox(height: 16),
              buildGovtIDNumberField(),
              SizedBox(height: 32),
              buildSaveButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfilePicture() {
    return GestureDetector(
      onTap: () {
        // Add logic to update profile picture
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            radius: 72,
            backgroundImage: AssetImage('assets/profile_placeholder.png'),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: IconButton(
                onPressed: () {
                  // Add icon or camera icon here
                },
                icon: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLocationField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Location',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.location_on),
      ),
      // Add logic to update location
    );
  }

  Widget buildEmailField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.email),
      ),
      // Add logic to update email
    );
  }

  Widget buildPhoneNumberField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Phone No',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.phone),
      ),
      // Add logic to update phone number
    );
  }

  Widget buildGovtIDTypeDropdown() {
    return DropdownButtonFormField<String>(
      value: selectedGovtIDType,
      onChanged: (newValue) {
        setState(() {
          selectedGovtIDType = newValue!;
        });
      },
      items: govtIDTypes.map((type) {
        return DropdownMenuItem<String>(
          value: type,
          child: Text(type),
        );
      }).toList(),
      decoration: InputDecoration(
        labelText: 'Government ID Type',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.card_membership),
      ),
    );
  }

  Widget buildGovtIDNumberField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Government ID No',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.assignment_ind),
      ),
      // Add logic to update government ID number
    );
  }

  Widget buildSaveButton() {
    return ElevatedButton(
      onPressed: () {
        // Add logic to submit the updated profile data
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Text(
          'Save Changes',
          style: TextStyle(fontSize: 18),
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
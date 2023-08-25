import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zon_gneapp/screens/provider.dart';

class UserPage extends StatefulWidget {
  final Function(String?) updateProfilePhoto;

  const UserPage({Key? key, required this.updateProfilePhoto})
      : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  File? _selectedImage;
  bool _isImageChanged = false;
  final ImagePicker picker = ImagePicker();

  final String _selectedImagePathKey = 'selectedImagePath';

  List<String> profileImages = [
    'images/profile1.png',
    'images/profile2.png',
    'images/profile3.png',
  ];

  @override
  void initState() {
    super.initState();
    _loadSelectedImagePath();
  }

  void _loadSelectedImagePath() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? selectedImagePath = prefs.getString(_selectedImagePathKey);

    if (selectedImagePath != null) {
      setState(() {
        _selectedImage = File(selectedImagePath);
        _isImageChanged = true;
      });
    }
  }

  void _saveSelectedImagePath(String? imagePath) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_selectedImagePathKey, imagePath ?? '');
  }



  void _pickImage() async {
    final imagePicked = await picker.pickImage(source: ImageSource.gallery);

    if (imagePicked != null) {
      setState(() {
        _selectedImage = File(imagePicked.path);
        _isImageChanged = true;
      });

      _saveSelectedImagePath(_selectedImage?.path);
      widget.updateProfilePhoto(_selectedImage?.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    var currentUser = Provider.of<UserProvider>(context).user;
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFF707070),
            ),
            child: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: const Text(
                  "Profil",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                centerTitle: true,
              ),
            ),
          ),
          SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
            backgroundImage: _isImageChanged
                ? FileImage(_selectedImage!)
                : AssetImage(profileImages[0]) as ImageProvider,
          ),
          SizedBox(height: 20),
          Text(
            "${currentUser?.name}",
            style: TextStyle(color: Colors.blue, fontSize: 16),
          ),
          Text(
            "${currentUser?.email}",
            style: TextStyle(color: Colors.blue, fontSize: 16),
          ),
          Text(
            "${currentUser?.tel}",
            style: TextStyle(color: Colors.blue, fontSize: 16),
          ),
          ElevatedButton(
            onPressed: _pickImage,
            child: Text('Changer photo de profil'),
          ),
        ],
      ),
    );
  }
}

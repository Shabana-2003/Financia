import 'dart:io';
//import 'dart:typed_data';
import 'package:financia/data/model/hivemodels.dart';
import 'package:financia/widgets/bottomnavigationbar.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
//import 'package:path_provider/path_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController _nameController;
  //late TextEditingController _incomeController;
  late TextEditingController _profilePhotoController;
  late TextEditingController _petNameController;

  String? _selectedGender;
  String defaultPhotoPath = 'images/profile.png';
  late ProfileData _profileData;

  bool _isEditing = true;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _profilePhotoController = TextEditingController();
    _petNameController = TextEditingController();
    _loadProfileData();
    _profileData = ProfileData('', '', '', '');
  }

// Future<void> _loadProfileData() async {
//   final profileBox = await Hive.openBox<ProfileData>('profileBox');
//   if (profileBox.isNotEmpty) {
//     _profileData = profileBox.getAt(0)!;

//     setState(() {
//       _nameController.text = _profileData.name;
//       _selectedGender = _profileData.gender;
//       _petNameController.text = _profileData.nickName;
//       _profilePhotoController.text = _profileData.profilePhotoPath;
//     });
//   }
// }

  Future<void> _loadProfileData() async {
    final profileBox = await Hive.openBox<ProfileData>('profileBox');
    if (profileBox.isNotEmpty) {
      _profileData = profileBox.getAt(0)!;

      setState(() {
        _nameController.text = _profileData.name;
        _selectedGender = _profileData.gender;
        _petNameController.text = _profileData.nickName;
        _profilePhotoController.text = _profileData.profilePhotoPath;
      });
    }
  }

  Future<void> _saveProfile() async {
    final profileBox = await Hive.openBox<ProfileData>('profileBox');

    _profileData.name = _nameController.text;
    _profileData.gender = _selectedGender ?? '';
    _profileData.nickName = _petNameController.text;

    _profileData.profilePhotoPath = _profilePhotoController.text;

    if (profileBox.isEmpty) {
      await profileBox.add(_profileData);
    } else {
      await profileBox.putAt(0, _profileData);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profile saved successfully'),
      ),
    );
  }

// Future<void> _pickImage() async {
//   final ImagePicker _picker = ImagePicker();

//   try {
//     final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       File file = File(pickedFile.path);

//       setState(() {
//         _profileData.profilePhotoPath = pickedFile.path;
//         _profilePhotoController.text = pickedFile.path;
//       });
//     }
//   } catch (e) {
//     print('Error picking image: $e');
//   }
// }

//  Future<void> _pickImage() async {
//     final ImagePicker _picker = ImagePicker();

// try {
//   final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

//   if (pickedFile != null) {
//     setState(() {
//       _profileData.profilePhotoPath = pickedFile.path;
//       _profilePhotoController.text = pickedFile.path;
//     });
//   }
// } catch (e) {
//   print('Error picking image: $e');
// }

//   }
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();

    try {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          _profileData.profilePhotoPath = pickedFile.path;
          _profilePhotoController.text = pickedFile.path;
        });

        _showBottomDialog();
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  void _showBottomDialog() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: <Widget>[
            ListTile(
              title: const Text('Delete photo',
                  style: TextStyle(color: Color.fromARGB(255, 253, 252, 252))),
              tileColor: Color.fromARGB(255, 47, 125, 121),
              onTap: () {
                _deleteProfilePhoto();
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text('Add photo',
                  style: TextStyle(color: Color.fromARGB(255, 250, 250, 250))),
              tileColor: Color.fromARGB(255, 47, 125, 121),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteProfilePhoto() {
    setState(() {
      _profileData.profilePhotoPath = '';
      _profilePhotoController.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 700,
                    decoration: BoxDecoration(
                      color: Color(0xff368983),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(400),
                        bottomRight: Radius.circular(0),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 65,
                          left: 25,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Profile!',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 130,
                    left: 30,
                    bottom: 90,
                    right: 30,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(242, 250, 250, 0.294),
                            offset: Offset(0, 6),
                            blurRadius: 12,
                            spreadRadius: 6,
                          ),
                        ],
                        color: Color.fromARGB(255, 248, 249, 249),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (_isEditing) {
                                    _pickImage();
                                  }
                                },
                                child: Stack(
                                  children: [
                                    CircleAvatar(
                                      radius: 80,
                                      backgroundColor:
                                          Color.fromARGB(255, 47, 125, 121),
                                      child: _profilePhotoController
                                              .text.isNotEmpty
                                          ? ClipOval(
                                              child: Image.file(
                                                File(_profileData
                                                    .profilePhotoPath),
                                                fit: BoxFit.cover,
                                                width: 220.0,
                                                height: 220.0,
                                              ),
                                            )
                                          : ClipOval(
                                              child: Image.asset(
                                                defaultPhotoPath,
                                                fit: BoxFit.cover,
                                                width: 120.0,
                                                height: 120.0,
                                              ),
                                            ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: CircleAvatar(
                                        backgroundColor:
                                            Color.fromARGB(255, 252, 253, 253),
                                        radius: 20,
                                        child: Icon(
                                          Icons.camera_alt,
                                          color:
                                              Color.fromARGB(255, 47, 125, 121),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 16),
                              TextFormField(
                                controller: _nameController,
                                cursorColor: Color.fromARGB(255, 47, 125,
                                    121), // Set your desired cursor color here
                                decoration: InputDecoration(
                                  hintText: 'Name',
                                  hintStyle: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 143, 143, 143),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 47, 125, 121),
                                    ),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          const Color.fromARGB(255, 31, 31, 31),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: ['Female', 'Male', 'Other']
                                    .map(
                                      (String value) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: ChoiceChip(
                                          label: Text(value),
                                          selected: _selectedGender == value,
                                          onSelected: (bool selected) {
                                            setState(() {
                                              _selectedGender =
                                                  selected ? value : null;
                                            });
                                          },
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                              const SizedBox(height: 17),
                              TextFormField(
                                controller: _petNameController,
                                cursorColor: Color.fromARGB(255, 47, 125, 121),
                                decoration: InputDecoration(
                                  labelText: 'Nickname',
                                  labelStyle: TextStyle(
                                      color: Color.fromARGB(255, 47, 125, 121)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 47, 125, 121)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                                style: _petNameController.text.isNotEmpty
                                    ? TextStyle(
                                        color:
                                            const Color.fromARGB(255, 6, 5, 5))
                                    : null,
                              ),
                              const SizedBox(height: 16),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  _saveProfile();
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   const SnackBar(
                  //     content: Text('Profile saved successfully'),
                  //   ),
                  // );
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Bottom(),
                    ),
                  );
                },
                child: const Text('Save Profile'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 47, 125, 121)),
                  fixedSize: MaterialStateProperty.all<Size>(
                    Size(200, 70),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../Home/representations/widget/CustomBottomNavBar.dart';
import '../../../../FlashSaleBook/Data/onItemTapped.dart';

class PersonalDataPage extends StatefulWidget {
  const PersonalDataPage({super.key});

  @override
  State<PersonalDataPage> createState() => _PersonalDataPageState();
}

class _PersonalDataPageState extends State<PersonalDataPage> {
  int selectedIndex = 3;
  bool isEditing = false;

  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  final TextEditingController nameController =
  TextEditingController(text: "John Smith");
  final TextEditingController emailController =
  TextEditingController(text: "JohnSmith@gmail.com");
  final TextEditingController phoneController =
  TextEditingController(text: "123456789");
  final TextEditingController addressController =
  TextEditingController(text: "Maadi, Cairo, Egypt.");

  /// دالة لاختيار الصورة
  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source, imageQuality: 80);
      if (pickedFile != null) {
        setState(() {
          _profileImage = File(pickedFile.path);
        });
      } else {
        print("No image selected.");
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  /// حوار الاختيار بين الكاميرا والمعرض
  void _showImageSourceDialog() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text("Take a photo"),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text("Choose from gallery"),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
          ],
        );
      },
    );
  }

  /// تصميم حقل إدخال
  Widget buildInputField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.grey[700], fontSize: 14)),
        const SizedBox(height: 4),
        TextField(
          controller: controller,
          enabled: isEditing,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              /// الصف العلوي: Edit يسار و Save يمين
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isEditing = true;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(Icons.edit, color: Colors.pink[400]),
                        const SizedBox(width: 4),
                        Text(
                          "Edit",
                          style: TextStyle(
                            color: Colors.pink[400],
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isEditing)
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isEditing = false;
                        });
                        print("Saved data:");
                        print(nameController.text);
                        print(emailController.text);
                        print(phoneController.text);
                        print(addressController.text);
                      },
                      child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.pink, fontSize: 16),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 20),

              /// صورة البروفايل مع أيقونة الكاميرا
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundImage: _profileImage != null
                        ? FileImage(_profileImage!)
                        : const AssetImage('assets/images/profile_pic.png') as ImageProvider,
                  ),
                  if (isEditing)
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: _showImageSourceDialog,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const Icon(Icons.camera_alt, color: Colors.white, size: 20),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 20),

              /// الحقول
              buildInputField("Name", nameController),
              buildInputField("Email", emailController),
              buildInputField("Phone number", phoneController),
              buildInputField("Address", addressController),
            ],
          ),
        ),
      ),

      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          BottomNavHandler.onItemTapped(
            context: context,
            index: index,
            currentIndex: selectedIndex,
            updateIndex: (newIndex) {
              setState(() {
                selectedIndex = newIndex;
              });
            },
          );
        },
      ),
    );
  }
}

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/AppConstants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  File? _selectedImage;

  Future<void> _pickImageFromStorage() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null && result.files.single.path != null) {
      setState(() {
        _selectedImage = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
          children: [
        Image.asset(imagePath),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _pickImageFromStorage,
          child: const Text("Pick"),
        ),
        const SizedBox(
          height: 20,
        ),
        _selectedImage != null
            ? Image.file(_selectedImage!,
            fit: BoxFit.cover)
            : const Text("No image selected")
      ]),
    );
  }
}

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
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
    debugPrint("sdfsfs");

    if (result != null && result.files.single.path != null) {
      setState(() {
        _selectedImage = File(result.files.single.path!);
        if (kDebugMode) {
          print(_selectedImage);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print("$height $width");
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Stack(
          children: [
            Image.asset(
              width: width,
              height: height * 0.30,
              imagePath,
              fit: BoxFit.cover,
            ),
            Container(
                width: width,
                height: height * 0.33,
                decoration: BoxDecoration(
                    gradient:
                        LinearGradient(begin:Alignment.topCenter,end:Alignment.bottomCenter,stops:[0.3,0.8],colors: [Colors.black12, Colors.white]))
                //color: Colors.black54.withOpacity(0.3),
                )
          ],
        ),
        Text(
          appName,
          style: TextStyle(
              fontSize: 25,
              color: Colors.deepPurple,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal),
        ),
        Text(
          slogan,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              fontFamily: 'Roboto',
              color: Colors.grey[400]),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _pickImageFromStorage,
          child: const Text("Pick"),
        ),
        const SizedBox(
          height: 20,
        ),
        _selectedImage != null
            ? Image.file(
                _selectedImage!,
                fit: BoxFit.cover,
                cacheHeight: 720,
                cacheWidth: 720,
              )
            : const Text("No image selected")
      ]),
    );
  }
}

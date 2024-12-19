import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/AppConstants.dart';
import '../../../core/constants/ColorsConstants.dart';

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
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.3, 0.8],
                            colors: [Colors.black12, Colors.white]))
                    //color: Colors.black54.withOpacity(0.3),
                    )
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                appName,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal),
              ),
            ),
            Center(
              child: Text(
                slogan,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Roboto',
                    color: Colors.grey[400]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Text("  $loginString",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        // begin: Alignment.centerLeft,
                        // end: Alignment.centerRight,
                        colors: [
                          secondaryColor.withValues(alpha: 0.2),
                          secondaryColor.withValues(alpha: 0.0)
                        ]),
                    border: Border(
                        left: BorderSide(color: secondaryColor, width: 6))),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  prefixIconColor: secondaryColor,
                  labelText: emailIdString,
                  labelStyle: TextStyle(
                      color: secondaryColor,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontStyle: FontStyle.italic),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: secondaryColor,
                          width: 2,
                          style: BorderStyle.solid)),
                  focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    prefixIconColor: secondaryColor,
                    labelText: phoneString,
                    labelStyle: TextStyle(
                        color: secondaryColor,
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.italic),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: secondaryColor,
                          width: 2.0,
                          style: BorderStyle.solid),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red))),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  forgetPasswordString,
                  style: TextStyle(color: secondaryColor),
                ),
              ),
            ),
            Center(
              child: MaterialButton(
                color: secondaryColor,
                height: height * 0.06,
                minWidth: width - 40,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {},
                child: Text(
                  loginToAccountString,
                  style: TextStyle(fontSize: 18, color: Colors.black45),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(doesnotHaveAccountString,
                    style: TextStyle(fontSize: 12, color: Colors.black)),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: Text(createAnAccount,
                        style: TextStyle(fontSize: 12, color: Colors.black45))),
              ],
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

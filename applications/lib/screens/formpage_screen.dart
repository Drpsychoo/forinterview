import 'dart:io';

import 'package:applications/screens/custom/cudtomtextfromfield.dart';
import 'package:applications/screens/custom/customappbar.dart';
import 'package:applications/screens/custom/customcheckbox.dart';
import 'package:applications/screens/custom/customelevationButton.dart';
import 'package:applications/screens/custom/customsmalltext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class FormPageScreen extends StatefulWidget {
  const FormPageScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FormPageScreen> createState() => _FormPageScreenState();
}

class _FormPageScreenState extends State<FormPageScreen> {
  final _formKey = GlobalKey<FormState>();

  final ImagePicker _picker = ImagePicker();

  File? image;

  File imageTemporary = File(
    'assets/images/login_option_screen/openingimage.png',
  );

  String str = 'assets/images/login_option_screen/openingimage.png';

  late File defaultFile;

  String? imgTempPath;

  Future _img(ImageSource source) async {
    try {
      final image = await _picker.pickImage(source: source, imageQuality: 95);
      if (image == null) return;

      imageTemporary = File(image.path);
      setState(() {
        imgTempPath = imageTemporary.path;
        this.image = imageTemporary;
        debugPrint(imgTempPath);
      });
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image $e');
    }
  }

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          color: const Color.fromARGB(255, 255, 255, 255),
          child: SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Photo Library'),
                  onTap: () {
                    _img(ImageSource.gallery);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    _img(ImageSource.camera);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _value = '';

  // final _formKey = GlobalKey<FormState>();

  final fullnameController = TextEditingController();

  final emailController = TextEditingController();

  final mobileController = TextEditingController();
  final dateofbirth = TextEditingController();

  String gender = '';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const CustomAppBar(
          title: ' Form',
          centerTitle: false,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 00,
            horizontal: 15,
          ),
          child: CustomElevatedButton(
            buttonText: 'Continue',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
              }
            },
          ),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 0,
              vertical: 15,
            ),
            child: ListView(
              shrinkWrap: true,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _showPicker(context);
                      });
                    },
                    child: Center(
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            CircleAvatar(
                              minRadius: 60,
                              backgroundColor: Colors.grey.shade300,
                              child: imgTempPath != null
                                  ? Image.file(
                                      File(imgTempPath.toString()),
                                    )
                                  : const Icon(
                                      Icons.photo_camera_outlined,
                                      color: Colors.orange,
                                      size: 40,
                                    ),
                            ),
                            const Text(
                              'Upload photo',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.blue,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: (15)),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 00,
                    horizontal: 15,
                  ),
                  child: CustomTextFormField(
                    isRequired: true,
                    hintText: 'Enter Full Name',
                    labelText: 'Full Name',
                    controller: fullnameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Fullname ';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 00,
                    horizontal: 15,
                  ),
                  child: CustomTextFormField(
                    isRequired: true,
                    controller: dateofbirth,
                    hintText: 'D.O.B.(Date of Birth)',
                    labelText: 'D.O.B.-Date of Birth. (Optional)',
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Date ';
                      }
                      return null;
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 00,
                    horizontal: 15,
                  ),
                  child: CustomTextFormField(
                    isRequired: true,
                    hintText: 'Enter Email Address',
                    labelText: 'Email Address (Optional)',
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Email';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 00,
                    horizontal: 15,
                  ),
                  child: CustomTextFormField(
                    isRequired: true,
                    hintText: 'Enter Contact No.',
                    labelText: 'Contact No.',
                    controller: mobileController,
                    maxLength: 10,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Contact Number ';
                      }
                      return null;
                    },
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 00,
                    horizontal: 15,
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: CustomeSmallText(
                      text: 'Gender',
                      fontSize: 14,
                      textcolor: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(
                  height: (15),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 00,
                    horizontal: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomCheckBox<String>(
                          value: 'male',
                          groupValue: _value,
                          onChanged: <String>(value) {
                            setState(() {
                              _value = value;
                              gender = 'male';
                            });
                          },
                          title: 'Male',
                        ),
                      ),
                      Expanded(
                        child: CustomCheckBox<String>(
                          value: 'female',
                          groupValue: _value,
                          onChanged: <String>(value) {
                            setState(() {
                              _value = value;
                              gender = 'female';
                            });
                          },
                          title: 'Female',
                        ),
                      ),
                      Expanded(
                        child: CustomCheckBox<String>(
                          value: 'other',
                          groupValue: _value,
                          onChanged: <String>(value) {
                            setState(() {
                              _value = value!;
                              gender = 'other';
                            });
                          },
                          title: 'Other',
                        ),
                      ),

                      //
                    ],
                  ),
                ),

                const SizedBox(height: 50),
                const Divider(),

                // const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      );
}

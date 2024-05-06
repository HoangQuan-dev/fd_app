import 'dart:convert';

import 'package:FoodDeli/data/model/user.model.dart';
import 'package:FoodDeli/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  User user = User.userEmpty();

  late TextEditingController nameController;
  late TextEditingController genderController;
  late TextEditingController birthDayController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController avatarController;

  getDataUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String strUser = pref.getString('user')!;
    user = User.fromJson(jsonDecode(strUser));

    nameController = TextEditingController(text: user.name);
    genderController = TextEditingController(text: user.gender);
    birthDayController = TextEditingController(text: user.birthDay);
    emailController = TextEditingController(text: user.email);
    phoneController = TextEditingController(text: user.phone);
    addressController = TextEditingController(text: user.address);
    avatarController = TextEditingController(text: user.avatar);
    setState(() {});
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 1),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        birthDayController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  updateUser(User user) async {
    // update user api
  }

  @override
  void initState() {
    super.initState();
    getDataUser();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Stack(
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(user.avatar!),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppColors.primaryColor,
                      ),
                      child: const Icon(
                        Icons.camera,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),

              // Form fields
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        floatingLabelStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        label: const Text('Họ tên'),
                        prefixIcon: const Icon(Icons.person),
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: genderController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        floatingLabelStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        label: const Text('Giới tính'),
                        prefixIcon: const Icon(Icons.transgender_outlined),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Form(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: birthDayController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              floatingLabelStyle: const TextStyle(
                                color: Colors.black,
                              ),
                              label: const Text('Ngày sinh'),
                              prefixIcon: IconButton(
                                icon: const Icon(Icons.calendar_month_outlined),
                                onPressed: () => _selectDate(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        floatingLabelStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        label: const Text('Email'),
                        prefixIcon: const Icon(Icons.email_rounded),
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        floatingLabelStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        label: const Text('Số điện thoại'),
                        prefixIcon: const Icon(Icons.phone_android),
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: addressController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        floatingLabelStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        label: const Text('Địa chỉ'),
                        prefixIcon: const Icon(Icons.home_work_rounded),
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: avatarController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        floatingLabelStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        label: const Text('Ảnh đại diện'),
                        prefixIcon: const Icon(Icons.face),
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          updateUser(user);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          side: BorderSide.none,
                          shape: const StadiumBorder(),
                        ),
                        child: const Text(
                          'Lưu thông tin',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

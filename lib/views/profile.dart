import 'package:confirmtkt/controllers/walletcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletController>(
      init: WalletController(),
        builder: (controller) => Scaffold(
          appBar: AppBar(
            title: Text("My Profile"),
          ),
        )
    );
  }
}

import 'package:confirmtkt/controllers/walletcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Trips extends StatefulWidget {
  const Trips({super.key});

  @override
  State<Trips> createState() => _TripsState();
}

class _TripsState extends State<Trips> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletController>(
      init: WalletController(),
        builder: (controller) => Scaffold(
          appBar: AppBar(
            title: Text("Trips"),
          ),
        )
    );
  }
}

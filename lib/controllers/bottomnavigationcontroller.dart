import 'package:confirmtkt/views/homepage.dart';
import 'package:confirmtkt/views/profile.dart';
import 'package:confirmtkt/views/trips.dart';
import 'package:confirmtkt/views/wallet.dart';
import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController {
  final List screenOptions = [
    const HomePage(),
    const Wallet(),
    const Trips(),
    const MyProfile()
  ];
  int selectedIndex = 0;

  onItemTapped(int index) {
    selectedIndex = index;
    update();
  }
}

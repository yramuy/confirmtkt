import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

class HomeController extends GetxController {
  dynamic argumentData = Get.arguments;
  bool checkboxVal = false;
  List recentUpdates = [];
  String? fromStationText = "";
  String? toStationText = "";
  late Color greyColor = Colors.grey;
  late Color greenColor = Colors.green;
  bool todayVal = false;
  bool tomorrowVal = false;
  bool dayAfterVal = false;
  late DateTime currentDate;
  // Get the current date
  DateTime now = DateTime.now();
  String selectedFromDate = "";
  String todayDate = "";
  String tomorrowDate = "";
  String dayAfterTmrDate = "";

  List services = [
    {"id": 1, "name": "Book Flight", "icon": const Icon(Icons.flight_sharp)},
    {"id": 2, "name": "PNR Status", "icon": const Icon(Icons.star)},
    {
      "id": 3,
      "name": "Order Food On Train",
      "icon": const Icon(Icons.bookmark_border)
    },
    {"id": 4, "name": "Book Hotels", "icon": const Icon(Icons.hotel_rounded)},
    {
      "id": 5,
      "name": "Running Status",
      "icon": const Icon(Icons.run_circle_outlined)
    },
    {
      "id": 6,
      "name": "Status Availability",
      "icon": const Icon(Icons.event_available)
    },
    {
      "id": 7,
      "name": "Alternates Train+Train",
      "icon": const Icon(Icons.directions_train_sharp)
    },
    {"id": 8, "name": "Book Bus", "icon": const Icon(Icons.bus_alert)}
  ];

  final List<String> imgList = [
    'https://via.placeholder.com/600x400',
    'https://via.placeholder.com/600x400',
    'https://via.placeholder.com/600x400',
  ];

  List stations = [
    {
      "id": 1,
      "code": "VSP",
      "city": "Visakhapatnam Junction",
      "state": "Andra Pradesh"
    },
    {"id": 2, "code": "PAP", "city": "Pithapuram", "state": "Andra Pradesh"},
    {"id": 3, "code": "RJY", "city": "Rajahmundry", "state": "Andra Pradesh"},
    {
      "id": 4,
      "code": "SLO",
      "city": "Samalkota Junction",
      "state": "Andra Pradesh"
    },
    {"id": 5, "code": "CCT", "city": "Kakinada Town", "state": "Andra Pradesh"},
    {"id": 6, "code": "PUNE", "city": "Pune Junction", "state": "Maharashtra"},
    {"id": 7, "code": "LKO", "city": "Lucknow", "state": "Uttar Pradesh"},
    {"id": 8, "code": "PNBE", "city": "Patna Junction", "state": "Bihar"},
    {"id": 6, "code": "PUNE", "city": "Pune Junction", "state": "Maharashtra"},
    {"id": 7, "code": "LKO", "city": "Lucknow", "state": "Uttar Pradesh"},
    {"id": 8, "code": "PNBE", "city": "Patna Junction", "state": "Bihar"},
    {"id": 7, "code": "LKO", "city": "Lucknow", "state": "Uttar Pradesh"},
    {"id": 8, "code": "PNBE", "city": "Patna Junction", "state": "Bihar"}
  ];

  @override
  onInit() {
    super.onInit();
    loadRecentUpdates();
    updateText("Enter From Station");
    updateToStationText("Enter To Station");
    log(argumentData.toString());
    updateColors(false, false, false);
    selectedFromDate = DateFormat('EEE, d MMM').format(now);
    todayVal = true;
  }

  handleCheckbox(bool? value) {
    checkboxVal = value!;
    update();
    print(checkboxVal);
  }

  void loadRecentUpdates() {
    recentUpdates = [
      {
        "id": 1,
        "title": "Upcoming trip : VSP - RJY",
        "details": "Sat, 07 Sep 2024, | 2S | 2 Passengers",
        "status": "",
      },
      {
        "id": 2,
        "title": "Refund of 220 rupees is Initiated",
        "details": "Expected by 27 Aug - 08 Sep",
        "status": "You cancelled : RJY - Vsp"
      },
      {
        "id": 3,
        "title": "Refund of 190 rupees is Initiated",
        "details": "Expected by 27 Aug - 08 Sep",
        "status": "You cancelled : Vsp - RJY"
      },
      {
        "id": 4,
        "title": "Refund of 190 rupees is Initiated",
        "details": "Expected by 27 Aug - 08 Sep",
        "status": "You cancelled : Vsp - RJY"
      },
      {
        "id": 5,
        "title": "Refund of 190 rupees is Initiated",
        "details": "Expected by 27 Aug - 08 Sep",
        "status": "You cancelled : Vsp - RJY"
      }
    ];
    update();
  }

  void updateText(param0) {
    fromStationText = param0;
    update();
  }

  void updateToStationText(String toStation) {
    toStationText = toStation;
    update();
  }

  void updateColors(bool today, bool tmr, bool daTmr) {
    todayVal = today;
    tomorrowVal = tmr;
    dayAfterVal = daTmr;

    if (todayVal == true) {
      selectedFromDate = DateFormat('EEE, d MMM').format(now);
      todayDate = selectedFromDate.toString();
    } else if (tomorrowVal == true) {
      DateTime nextDay = now.add(const Duration(days: 1));
      selectedFromDate = DateFormat('EEE, d MMM').format(nextDay);
      tomorrowDate = selectedFromDate.toString();
    } else {
      DateTime dayAfter = now.add(const Duration(days: 2));
      selectedFromDate = DateFormat('EEE, d MMM').format(dayAfter);
      dayAfterTmrDate = selectedFromDate.toString();
    }

    update();
  }

  datePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      selectedFromDate = DateFormat('EEE, d MMM').format(picked);
    }

    if (todayDate.toString() == selectedFromDate) {
      todayVal = true;
      tomorrowVal = false;
      dayAfterVal = false;
    } else if (tomorrowDate.toString() == selectedFromDate) {
      tomorrowVal = true;
      todayVal = false;
      dayAfterVal = false;
    } else if (dayAfterTmrDate.toString() == selectedFromDate) {
      tomorrowVal = false;
      todayVal = false;
      dayAfterVal = true;
    } else {
      tomorrowVal = false;
      todayVal = false;
      dayAfterVal = false;
    }

    update();
  }
}

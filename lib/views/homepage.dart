import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:confirmtkt/controllers/homecontroller.dart';
import 'package:confirmtkt/views/searchstations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: const ListTile(
                  title: AppTitle(),
                  trailing: Icon(
                    Icons.share_outlined,
                    size: 25,
                  ),
                ),
              ),
              body: SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Column(
                  children: [
                    const DefaultTabController(
                      length: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TabBar(labelColor: Colors.black, tabs: [
                            Tab(
                              icon: Icon(Icons.train_outlined, size: 30),
                              text: "Trains",
                            ),
                            Tab(
                              icon: Icon(
                                Icons.flight,
                                size: 30,
                              ),
                              text: "Flights",
                            ),
                            Tab(
                              icon: Icon(
                                Icons.bus_alert_rounded,
                                size: 30,
                              ),
                              text: "Flights",
                            ),
                            Tab(
                              icon: Icon(
                                Icons.hotel,
                                size: 30,
                              ),
                              text: "Hotels",
                            )
                          ]),
                          // Expanded(
                          //     child: TabBarView(
                          //         children: []
                          //     )
                          // )
                        ],
                        // padding: EdgeInsets.all(5),
                        // margin: EdgeInsets.all(5),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: const Icon(Icons.train),
                      title: GestureDetector(
                          onTap: () {
                            Get.to(
                              () => const SearchStation(
                                navFrom: 'from',
                                navTo: '',
                              ),
                            );
                          },
                          child: Text(controller.fromStationText.toString())),
                    ),
                    ListTile(
                      leading: const Icon(Icons.train),
                      title: GestureDetector(
                          onTap: () {
                            Get.to(() => const SearchStation(
                                  navFrom: '',
                                  navTo: 'to',
                                ));
                          },
                          child: Text(controller.toStationText.toString())),
                    ),
                    Container(
                      // padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.symmetric(horizontal: 17),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(Icons.calendar_month),
                          // const SizedBox(
                          //   width: 2,
                          // ),
                          TextButton(
                              onPressed: () {
                                controller.datePicker(context);
                              },
                              child: Text(
                                controller.selectedFromDate,
                                style:
                                    const TextStyle(fontSize: 12, color: Colors.grey),
                              )),
                          // const SizedBox(
                          //   width: 2,
                          // ),
                          Container(
                            height: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                //color: Colors.green.withOpacity(0.1),
                                color: controller.todayVal
                                    ? controller.greenColor.withOpacity(0.1)
                                    : Colors.white70,
                                border: Border.all(
                                    color: controller.todayVal
                                        ? controller.greenColor
                                        : controller.greyColor)),
                            child: TextButton(
                                onPressed: () {
                                  controller.updateColors(true, false, false);
                                },
                                child: Text(
                                  "Today",
                                  style: TextStyle(
                                      color: controller.todayVal
                                          ? controller.greenColor
                                          : controller.greyColor,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Container(
                            height: 35,
                            // width: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: controller.tomorrowVal
                                    ? controller.greenColor.withOpacity(0.1)
                                    : Colors.white70,
                                border: Border.all(
                                    color: controller.tomorrowVal
                                        ? controller.greenColor
                                        : controller.greyColor)),
                            child: TextButton(
                                onPressed: () {
                                  controller.updateColors(false, true, false);
                                },
                                child: Text(
                                  "Tomorrow",
                                  style: TextStyle(
                                      color: controller.tomorrowVal
                                          ? controller.greenColor
                                          : controller.greyColor,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Container(
                            height: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: controller.dayAfterVal
                                    ? controller.greenColor.withOpacity(0.1)
                                    : Colors.white70,
                                border: Border.all(
                                    color: controller.dayAfterVal
                                        ? controller.greenColor
                                        : controller.greyColor)),
                            child: TextButton(
                                onPressed: () {
                                  controller.updateColors(false, false, true);
                                },
                                child: Text("Day After",
                                    style: TextStyle(
                                        color: controller.dayAfterVal
                                            ? controller.greenColor
                                            : controller.greyColor,
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold))),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 3,
                      ),
                      child: Row(
                        children: [
                          Checkbox(
                            onChanged: (value) {
                              controller.handleCheckbox(value);
                            },
                            value: controller.checkboxVal,
                          ),
                          const Text(
                            "Get full train fare refund on cancellation",
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            Icons.info_outline_rounded,
                            color: Colors.green,
                            size: 17,
                          )
                        ],
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () {},
                        child: const Text(
                          "SEARCH TRAINS",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.directions,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("IRCTC Authorised Partner")
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      // width: 300,
                      // height: 200,
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration:
                          BoxDecoration(color: Colors.grey.withOpacity(0.2)),
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Recent Updates",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.recentUpdates.length,
                              itemBuilder: (context, int index) {
                                var data = controller.recentUpdates[index];
                                var title = controller.recentUpdates[index]
                                        ['title']
                                    .toString();
                                var details = controller.recentUpdates[index]
                                        ['details']
                                    .toString();
                                return Container(
                                  padding: const EdgeInsets.all(10),
                                  color: Colors.white,
                                  child: ListTile(
                                    leading: const Icon(
                                      Icons.train_outlined,
                                      size: 30,
                                    ),
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          title,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          details,
                                          style: const TextStyle(
                                              fontSize: 14, color: Colors.grey),
                                        )
                                      ],
                                    ),
                                    trailing: const Icon(
                                        Icons.arrow_forward_ios_rounded),
                                  ),
                                );
                              }),
                          const SizedBox(
                            height: 10,
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Other Services",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.all(15),
                            color: Colors.white,
                            child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10),
                                itemCount: controller.services.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    child: SizedBox(
                                      height: 60,
                                      width: 30,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: Colors.green
                                                    .withOpacity(0.2)),
                                            padding: const EdgeInsets.all(6),
                                            child: controller.services[index]
                                                ['icon'],
                                          ),
                                          Text(
                                            controller.services[index]['name']
                                                .toString(),
                                            style:
                                                const TextStyle(fontSize: 10),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Why Book With Confirmtkt",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          CarouselSlider(
                              items: controller.imgList
                                  .map((item) => Center(
                                        child: Image.network(
                                          item,
                                          fit: BoxFit.cover,
                                          width: 1000,
                                        ),
                                      ))
                                  .toList(),
                              options: CarouselOptions(
                                  height: 180,
                                  autoPlay: true,
                                  enlargeCenterPage: true))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: const Icon(
            Icons.refresh_outlined,
            color: Colors.green,
            size: 30,
          ),
        ),
        const Text(
          "Confirm",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Text(
          "tkt",
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

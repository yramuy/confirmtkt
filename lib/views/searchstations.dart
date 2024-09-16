import 'package:confirmtkt/controllers/homecontroller.dart';
import 'package:confirmtkt/views/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchStation extends StatefulWidget {
  final String navFrom;
  final String navTo;

  const SearchStation({super.key, required this.navFrom, required this.navTo});

  @override
  State<SearchStation> createState() => _SearchStationState();
}

class _SearchStationState extends State<SearchStation> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: const Text("Stations"),
              ),
              body: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.stations.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.withOpacity(0.1)),
                        child: Row(
                          children: [
                            const Icon(Icons.search),
                            const SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => const HomePage());
                                widget.navFrom.toString().isNotEmpty
                                    ? controller.updateText(
                                        controller.stations[index]['code'] +
                                            " - " +
                                            controller.stations[index]['city'])
                                    : controller.updateToStationText(
                                        controller.stations[index]['code'] +
                                            " - " +
                                            controller.stations[index]['city']);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.stations[index]['code'] +
                                        " - " +
                                        controller.stations[index]['city'],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                      controller.stations[index]['city'] +
                                          " , " +
                                          controller.stations[index]['state'],
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ));
  }
}

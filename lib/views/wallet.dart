import 'package:confirmtkt/controllers/walletcontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletController>(
        init: WalletController(),
        builder: (controller) => Scaffold(
              backgroundColor: Colors.grey.withOpacity(0.1),
              appBar: AppBar(
                title: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(top: 15, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.wallet,
                        color: Colors.green.withOpacity(0.4),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Total Wallet Balance",
                            style: TextStyle(fontSize: 13),
                          ),
                          Container(
                            width: 50,
                            padding: const EdgeInsets.only(top: 10, right: 10),
                            // color: Colors.blueGrey,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.currency_rupee_outlined,
                                  size: 18,
                                ),
                                Text(
                                  "100",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 80),
                        child: const Column(
                          children: [
                            Icon(
                              Icons.history_outlined,
                              size: 20,
                            ),
                            Text(
                              "History",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              body: Container(
                padding: const EdgeInsets.all(10),
                // margin: EdgeInsets.all(5),
                child: Column(
                  // alignment: Alignment.centerLeft,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 160,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green.withOpacity(0.2),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Wallet",
                                  style: TextStyle(fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.currency_rupee_outlined,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                    Text(
                                      "100",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 130,
                                  height: 35,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.green.withOpacity(0.5),
                                  ),
                                  child: const Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      "Request Refound",
                                      style: TextStyle(
                                          color: Colors.white70,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 160,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green.withOpacity(0.2),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.all(8),
                            child: const Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text("Wallet (Rewards)"),
                                        Icon(Icons.arrow_forward_ios_rounded)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.currency_rupee_outlined,
                                          size: 20,
                                        ),
                                        Text("50",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20)),
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                  "Have a coupon code?",
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      // height: 50,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.withOpacity(0.2)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "Use Confirmtkt Wallet & Rewards for \n train bookings"),
                          Icon(Icons.arrow_forward_ios_rounded)
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.green.withOpacity(0.2),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            padding: const EdgeInsets.all(8),
                            // decoration: BoxDecoration(
                            //     color: Colors.green.withOpacity(0.1)
                            // ),
                            child: Column(
                              children: [
                                const Text("Get up to 25% Off on Flights",),
                                const SizedBox(height: 10,),
                                ElevatedButton(
                                    onPressed: (){},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green
                                  ),
                                    child: const Text("Code : CTFLY", style: TextStyle(color: Colors.white),),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            // decoration: const BoxDecoration(color: Colors.blueGrey),
                            child: const Icon(Icons.flight,size: 80,color: Colors.amber,),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}

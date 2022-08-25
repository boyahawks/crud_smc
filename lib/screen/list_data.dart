import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_smc/controller/listData_controller.dart';
import 'package:interview_smc/main.dart';

class ListData extends StatelessWidget {
  final controller = Get.put(ListDataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          Get.offAll(MyHomePage());
          return true;
        },
        child: SafeArea(
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text("List Data"),
                ),
                SizedBox(
                  height: 20,
                ),
                controller.listdata.value.isEmpty
                    ? Center(
                        child: Text("Loading..."),
                      )
                    : Flexible(
                        flex: 3,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: controller.listdata.value.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () => controller.detilData(
                                      controller.listdata.value[index]),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                          "Blok No : ${controller.listdata.value[index]['BLOKNO']}"),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                          "Lokasi : ${controller.listdata.value[index]['LOKASI']}"),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                          "Keluhan : ${controller.listdata.value[index]['KELUHAN']}"),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Divider(
                                        height: 5,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

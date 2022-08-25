import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_smc/controller/main_controller.dart';
import 'package:interview_smc/screen/entery_data.dart';
import 'package:interview_smc/screen/list_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Interview SMC',
        theme: ThemeData(fontFamily: 'OpenSans'),
        debugShowCheckedModeBanner: false,
        // builder: EasyLoading.init(),
        home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  final controller = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text("Menu Dashboard"),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: controller.menuDashboard.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 8.0,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      if (controller.menuDashboard[index]['menu'] == 1) {
                      } else if (controller.menuDashboard[index]['menu'] == 2) {
                        Get.offAll(ListData());
                      } else if (controller.menuDashboard[index]['menu'] == 3) {
                        Get.offAll(EnteryData());
                      } else if (controller.menuDashboard[index]['menu'] == 4) {
                      } else {
                        print("tidak ada");
                      }
                    },
                    child: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 200, 199, 199),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                        ),
                        child: Center(
                          child: Text(controller.menuDashboard[index]['nama']),
                        )),
                  );
                }),
          )
        ],
      ),
    ));
  }
}

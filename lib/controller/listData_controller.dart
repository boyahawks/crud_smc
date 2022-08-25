import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_smc/utils/api.dart';

class ListDataController extends GetxController {
  var listdata = [].obs;
  List<Block> listBlock = <Block>[].obs;

  var dropdownvalue = "".obs;

  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getListData();
    getListBlok();
  }

  @override
  void onClose() {}

  void getListData() {
    var connect = Api.connectionApi("get", {}, "getDataKeluhan");
    connect.then((dynamic res) {
      if (res.statusCode == 200) {
        var valueBody = jsonDecode(res.body);
        for (var i in valueBody['DataKeluhan']) {
          var data = {
            "ID": i['ID'],
            "BLOKNO": i['BLOKNO'],
            "LOKASI:": i['LOKASI:'],
            "KELUHAN": i['KELUHAN']
          };
          listdata.value.add(data);
        }
        listdata.refresh();
      }
    });
  }

  void getListBlok() {
    var connect = Api.connectionApi("get", {}, "getBlokNomor");
    connect.then((dynamic res) {
      if (res.statusCode == 200) {
        var valueBody = jsonDecode(res.body);
        print(valueBody['DataBlokNomor']);
        for (var el in valueBody['DataBlokNomor']) {
          listBlock.add(Block(blockName: el['BLOKNO']));
        }
      }
      print(listBlock);
    });
  }

  detilData(detil) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0))),
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text("Ini adalah data ${detil['BLOKNO']}"),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              child: Text("Tutup"),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
          ],
        );
      },
    );
  }
}

class Block {
  Block({
    this.blockName,
  });

  String? blockName;

  factory Block.fromJson(Map<String, dynamic> json) => Block(
        blockName: json["blockName"],
      );

  Map<String, dynamic> toJson() => {
        "blockName": blockName,
      };
}

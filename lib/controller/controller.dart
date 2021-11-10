import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:productbox_flutter_exercise/api.dart';
import 'package:productbox_flutter_exercise/model/image.dart';
import 'package:productbox_flutter_exercise/services/services.dart';

class Controllerclass extends GetxController {
  bool? check;
  final getdata = <Verticalimage>[].obs;
  Services services = Services();

  @override
  void onInit() {
    // TODO: implement onInit
    getImages();
    super.onInit();
  }

  ///LOGIN FUNCTION///
  Future<void> login(
      String username, String password, BuildContext context) async {
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    var result = jsonDecode(response.body);
    print(result.length);

    for (int i = 0; i < result.length; i++) {
      if (result[i]["username"] == username && result[i]["email"] == password) {
        print("Success ${username + password}");
        check = true;
        break;
      } else {
        print("Failed");
        check = false;
      }
    }

    if (check == true) {
      print("New Screeeen");
      Fluttertoast.showToast(msg: "Login Successful");
      Navigator.of(context).pushNamed("/second");
    } else if (check == false) {
      print("OLD Screen Error");
      Fluttertoast.showToast(msg: "Invalid Username or Password");
    }
  }

  //// GET VERTICAL IMAGES////
  getImages() async {
    var result = await services.getimagesdata();
    // print("result ${result.toString()}");
    if (result != null) {
      getdata.assignAll(result);
    } else {
      print("null");
    }
  }
}

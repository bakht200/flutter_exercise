import 'package:productbox_flutter_exercise/api.dart';
import 'package:productbox_flutter_exercise/model/image.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Services {
  Future<List<Verticalimage>?> getimagesdata() async {
    var response = await http.get(Uri.parse(verticalimages));

    if (response.statusCode == 200) {
      print("Before");
      List jsonresponse = convert.jsonDecode(response.body);
      print(jsonresponse);
      print("AFTER");
      return jsonresponse.map((e) => Verticalimage.fromJson(e)).toList();
    } else {
      return null;
    }
  }
}

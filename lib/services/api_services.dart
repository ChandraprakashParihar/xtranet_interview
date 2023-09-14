import 'dart:convert';

import 'package:interview/model/image_data_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<List<ImageDataModel>> getImages() async {
    final http.Client client = http.Client();
    try {
      final http.Response response = await client.get(
          Uri.parse("https://api.thecatapi.com/v1/images/search?limit=30"));

      // print(response.body);

      if (response.statusCode == 200) {
        final List<dynamic> imagesData = jsonDecode(response.body);
        final List<ImageDataModel> images = List.from(imagesData)
            .map<ImageDataModel>((image) => ImageDataModel.fromMap(image))
            .toList();
        return images;
      } else {
        throw "Error Loading";
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

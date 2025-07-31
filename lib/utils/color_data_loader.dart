// import 'dart:convert';
// import 'package:flutter/services.dart';
// import '../models/color_level_model.dart';

// class ColorDataLoader {
//   static Future<List<ColorLevelModel>> loadColors() async {
//     final String data = await rootBundle.loadString('assets/data/colors.json');
//     final Map<String, dynamic> jsonResult = json.decode(data);
//     final List<dynamic> colors = jsonResult['colors'];
//     return colors.map((e) => ColorLevelModel.fromJson(e)).toList();
//   }
// }

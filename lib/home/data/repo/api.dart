import 'dart:convert';

import 'package:http/http.dart' as web;

import '../models/spacex_launch.dart';

class SpaceXService {
  fetchAllLaunches() async {
    final url = Uri.parse("https://api.spacexdata.com/v4/launches");
    final response = await web.get(url);
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((json) => SpaceXLaunch.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load SpaceX launches');
    }
  }
}

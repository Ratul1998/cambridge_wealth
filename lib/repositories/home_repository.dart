import 'dart:convert';

import 'package:cambridge_wealth/models/home_page_data.dart';
import 'package:flutter/services.dart';

class HomeRepository {

  Future<HomePageData> getData() async {

    await Future.delayed(const Duration(seconds: 2));

    final String response = await rootBundle.loadString('assets/json/homepage.json');

    final data = jsonDecode(response);

    HomePageData homePageData = HomePageData.fromJson(data);

    return homePageData;

  }

}
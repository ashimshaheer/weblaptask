import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../Helpers/service.dart';
import '../../../utils/enums.dart';
import '../model/user.dart';

class LocationProvider extends ChangeNotifier {
  Product user = Product();

  Userstaus userstaus = Userstaus.initial;
  Future<void> getUser({required BuildContext context}) async {
    try {
      userstaus = Userstaus.loading;
      List response = await ServerClient.get('https://dummyjson.com/users');
      log("top sell ${response.first} ${response.last}");
      if (response.first >= 200 && response.first < 300) {
        user = Product.fromJson(response.last);
        userstaus = Userstaus.loaded;
        notifyListeners();
      } else {
        userstaus = Userstaus.error;
        throw Exception('Failed to fetch posts');
      }
    } catch (e) {
      userstaus = Userstaus.error;
      throw Exception('Failed to fetch posts');
    } finally {
      notifyListeners();
    }
  }
}

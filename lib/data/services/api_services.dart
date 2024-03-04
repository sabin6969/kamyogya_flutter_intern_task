import 'dart:async';

import 'package:dio/dio.dart';
import 'package:kamyogya_flutter_intern_task/data/models/members_model.dart';

class ApiServices {
  FutureOr<List<MembersModel>> getMembersData(
      {required String endPoint}) async {
    final List<MembersModel> users = [];
    final Response response = await Dio().get(endPoint);
    if (response.statusCode == 200) {
      var jsonData = response.data["data"]["members"];
      for (Map<String, dynamic> member in jsonData) {
        users.add(MembersModel.fromJson(member));
      }
      return users;
    }
    throw Exception("An exception occured");
  }
}

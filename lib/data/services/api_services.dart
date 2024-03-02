import 'package:dio/dio.dart';
import 'package:kamyogya_flutter_intern_task/data/models/members_model.dart';
import 'package:kamyogya_flutter_intern_task/exceptions/app_exceptions.dart';

class ApiServices {
  Future<List<MembersModel>> getMembersData({required String endPoint}) async {
    final List<MembersModel> users = [];
    try {
      final Response response = await Dio()
          .get(endPoint)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw ServerRequestTimeOutException();
      });
      switch (response.statusCode) {
        case 200:
          var jsonData = response.data["data"]["members"];
          for (Map<String, dynamic> member in jsonData) {
            users.add(MembersModel.fromJson(member));
          }
          return users;
        case 400:
          throw BadRequestException();
        case 404:
          throw ResourceNotFoundException(
            message: "Requested path is not available",
          );

        case 500:
        case 501:
        case 502:
        case 503:
        case 504:
          throw InternalServerException();
        default:
          throw Exception("An unknown error occured");
      }
    } catch (e) {
      throw ResourceNotFoundException(
        message: "Requested path is not available",
      );
    }
  }
}

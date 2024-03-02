import 'package:kamyogya_flutter_intern_task/data/models/members_model.dart';
import 'package:kamyogya_flutter_intern_task/data/services/api_services.dart';

class ApiRepository {
  final ApiServices apiServices;
  ApiRepository({required this.apiServices});

  Future<List<MembersModel>> getMembersData({required String endPoint}) {
    return apiServices.getMembersData(endPoint: endPoint);
  }
}

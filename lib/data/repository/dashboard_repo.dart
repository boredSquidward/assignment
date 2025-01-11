import 'package:dio/dio.dart';

import '../network/dio_client.dart';
import 'secure_storage_repo.dart';

class DashboardRepo extends DioClient {
  DashboardRepo(this.secureStorage);

  final SecureStorageRepo secureStorage;

  Future<Response> userInfo() async {
    dio.options.headers['authorization'] = 'Bearer ${await _getToken()}';
    return await dio.get('user/me');
  }

  Future<Response> dashboardInfo(int orgId) async {
    dio.options.headers['Authorization'] = 'Bearer ${await _getToken()}';
    return await dio.get('org/dashboard/v2/$orgId');
  }

  fuelTransactionList(int orgId) async {
    dio.options.headers['Authorization'] = 'Bearer ${await _getToken()}';
    return await dio.get('org/trxn/$orgId');
  }

  driverCheckList(int orgId) async {
    dio.options.headers['Authorization'] = 'Bearer ${await _getToken()}';
    return await dio.get('org/$orgId/driver/sessions');
  }

  Future<String?> _getToken() async => await secureStorage.read('token');
}

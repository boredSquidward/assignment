import 'package:either_dart/either.dart';

import '../models/dashboard_model.dart';
import '../models/driver_checklist_model.dart';
import '../models/fuel_transaction_model.dart';
import '../models/user_profile_info.dart';
import '../repository/dashboard_repo.dart';

class DashboardUseCase {
  final DashboardRepo dashboardRepo;

  DashboardUseCase(this.dashboardRepo);

  Future<Either<UserProfileInfo, Exception>> callUserInfo() async {
    try {
      var res = await dashboardRepo.userInfo();
      return Left(UserProfileInfo.fromJson(res.data));
    } catch (e) {
      return Right(Exception(e));
    }
  }

  Future<Either<DashboardModel, Exception>> callDashboardInfo(int orgId) async {
    try {
      var res = await dashboardRepo.dashboardInfo(orgId);
      return Left(DashboardModel.fromJson(res.data));
    } catch (e) {
      return Right(Exception(e));
    }
  }

  Future<Either<FuelTransactionModel, Exception>> callFuelTransactionList(
      int orgId) async {
    try {
      var res = await dashboardRepo.fuelTransactionList(orgId);
      return Left(FuelTransactionModel.fromJson(res.data));
    } catch (e) {
      return Right(Exception(e));
    }
  }

  Future<Either<DriverCheckListModel, Exception>> callDriverCheckList(
      int orgId) async {
    try {
      var res = await dashboardRepo.driverCheckList(orgId);
      return Left(DriverCheckListModel.fromJson(res.data));
    } catch (e) {
      return Right(Exception(e));
    }
  }
}

part of 'dashboard_bloc.dart';

abstract class DashboardEvent {}

class GetUserInfoEvent extends DashboardEvent {}

class GetDashboardInfoEvent extends DashboardEvent {}

class UpdateOrgIdEvent extends DashboardEvent {
  UpdateOrgIdEvent(this.orgId);

  final int? orgId;
}

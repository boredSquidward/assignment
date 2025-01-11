part of 'driver_checklist_bloc.dart';

abstract class DriverCheckListEvent {}

class GetDriverCheckListEvent extends DriverCheckListEvent {
  GetDriverCheckListEvent(this.orgId);

  final int orgId;
}

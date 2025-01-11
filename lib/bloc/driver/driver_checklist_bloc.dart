import 'package:bloc/bloc.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:either_dart/either.dart';
import 'package:meta/meta.dart';
import 'package:tug_assessment/bloc/dashboard/dashboard_bloc.dart';

import '../../data/models/driver_checklist_model.dart';
import '../../data/usecase/dashboard_usecase.dart';

part 'driver_checklist_event.dart';

part 'driver_checklist_state.dart';

class DriverCheckListBloc
    extends Bloc<DriverCheckListEvent, DriverCheckListState> {
  final DashboardUseCase dashboardUseCase;

  DriverCheckListBloc(this.dashboardUseCase)
      : super(DriverCheckListState(isLoading: false)) {
    on<GetDriverCheckListEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      await dashboardUseCase.callDriverCheckList(event.orgId).fold((left) {
        emit(state.copyWith(driverCheckListModel: left, isLoading: false));
      }, (right) {
        emit(state.copyWith(error: right, isLoading: false));
      });
    });
  }
}

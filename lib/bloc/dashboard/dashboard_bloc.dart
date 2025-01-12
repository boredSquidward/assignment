import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';

import '../../data/models/user_profile_info.dart';
import '../../data/usecase/dashboard_usecase.dart';

part 'dashboard_event.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashboardUseCase dashboardUseCase;

  DashboardBloc(this.dashboardUseCase)
      : super(DashboardState(isLoading: true)) {
    on<GetUserInfoEvent>((event, emit) async {
      await dashboardUseCase.callUserInfo().fold(
        (left) {
          emit(state.copyWith(
              userProfileInfo: left, orgId: left.accounts?[0].orgId));
        },
        (right) {
          emit(state.copyWith(error: right));
        },
      );
      emit(state.copyWith(isLoading: false));
    });

    on<GetDashboardInfoEvent>((event, emit) async {
      if (state.orgId != null) {
        await dashboardUseCase
            .callDashboardInfo(state.orgId!)
            .fold((left) {}, (right) {});
      }
    });

    on<UpdateOrgIdEvent>((event, emit) {
      emit(state.copyWith(orgId: event.orgId));
    });
  }
}

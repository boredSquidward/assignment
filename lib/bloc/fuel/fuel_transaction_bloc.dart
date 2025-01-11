import 'package:bloc/bloc.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:either_dart/either.dart';
import 'package:meta/meta.dart';

import '../../data/models/fuel_transaction_model.dart';
import '../../data/usecase/dashboard_usecase.dart';

part 'fuel_transaction_event.dart';

part 'fuel_transaction_state.dart';

class FuelTransactionBloc
    extends Bloc<FuelTransactionEvent, FuelTransactionState> {
  final DashboardUseCase dashboardUseCase;

  FuelTransactionBloc(this.dashboardUseCase)
      : super(FuelTransactionState(isLoading: true)) {
    on<GetFuelTransactionEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      await dashboardUseCase.callFuelTransactionList(event.orgId).fold((left) {
        emit(state.copyWith(fuelTransactionModel: left, isLoading: false));
      }, (right) {
        emit(state.copyWith(error: right, isLoading: false));
      });
    });
  }
}

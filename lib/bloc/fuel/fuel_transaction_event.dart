part of 'fuel_transaction_bloc.dart';

abstract class FuelTransactionEvent {}

class GetFuelTransactionEvent extends FuelTransactionEvent {
  GetFuelTransactionEvent(this.orgId);

  final int orgId;
}

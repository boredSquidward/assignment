part of 'fuel_transaction_bloc.dart';

class FuelTransactionState {
  final FuelTransactionModel? fuelTransactionModel;
  final bool isLoading;
  final Exception? error;

  FuelTransactionState({
    required this.isLoading,
    this.fuelTransactionModel,
    this.error,
  });

  FuelTransactionState copyWith({
    bool? isLoading,
    FuelTransactionModel? fuelTransactionModel,
    Exception? error,
  }) =>
      FuelTransactionState(
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
        fuelTransactionModel: fuelTransactionModel ?? this.fuelTransactionModel,
      );

  String getTransactionDate(int index) =>
      fuelTransactionModel?.transactions?[index].date?.isNotEmpty ?? false
          ? DateFormatter.formatDateTime(
              dateTime: DateTime.parse(
                  fuelTransactionModel!.transactions![index].date!),
              outputFormat: 'MM-dd-yyyy HH:mm:ss')
          : '';
}

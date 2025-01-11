part of 'driver_checklist_bloc.dart';

class DriverCheckListState {
  final DriverCheckListModel? driverCheckListModel;
  final bool isLoading;
  final Exception? error;

  DriverCheckListState({
    this.driverCheckListModel,
    required this.isLoading,
    this.error,
  });

  DriverCheckListState copyWith({
    DriverCheckListModel? driverCheckListModel,
    bool? isLoading,
    Exception? error,
  }) =>
      DriverCheckListState(
        driverCheckListModel: driverCheckListModel ?? this.driverCheckListModel,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
      );

  int get checkListLength => driverCheckListModel?.data?.sessions?.length ?? 0;

  bool get isListEmpty => driverCheckListModel?.data?.sessions?.isEmpty ?? true;

  String getDriverFullName(int index) =>
      '${driverCheckListModel?.data?.sessions?[index].driver?.firstname} ${driverCheckListModel?.data?.sessions?[index].driver?.lastname}';

  String getVehiclePlateNo(int index) =>
      driverCheckListModel?.data?.sessions?[index].vehicle?.plateNo ?? '';

  // String getStartTime(int index) =>
  //     driverCheckListModel?.data?.sessions?[index].startTime?.isNotEmpty ??
  //             false
  //         ? DateFormatter.formatDateTime(
  //             dateTime: DateTime.parse(
  //                 driverCheckListModel!.data!.sessions![index].startTime!),
  //             outputFormat: 'MM-dd-yyyy HH:mm:ss')
  //         : '';

  String getStartTime(int index) =>
      driverCheckListModel?.data?.sessions?[index].startTime ?? '';

  int getStartMileage(int index) =>
      driverCheckListModel?.data?.sessions?[index].startMileage ?? 0;

  // String getCheckoutTime(int index) =>
  //     driverCheckListModel?.data?.sessions?[index].checkoutTime?.isNotEmpty ??
  //             false
  //         ? DateFormatter.formatDateTime(
  //             dateTime: DateTime.parse(
  //                 driverCheckListModel!.data!.sessions![index].checkoutTime!),
  //             outputFormat: 'MM-dd-yyyy HH:mm:ss')
  //         : '';

  String getCheckoutTime(int index) =>
      driverCheckListModel?.data?.sessions?[index].checkoutTime ?? '';

  int getEndMileage(int index) =>
      driverCheckListModel?.data?.sessions?[index].endMileage ?? 0;

  String getDriverPhoto(int index) =>
      driverCheckListModel
          ?.data?.sessions?[index].driver?.profilePicture?.link ??
      '';
}

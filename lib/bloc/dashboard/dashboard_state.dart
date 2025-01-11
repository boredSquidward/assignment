part of 'dashboard_bloc.dart';

final class DashboardState {
  final UserProfileInfo? userProfileInfo;
  final Exception? error;
  final bool isLoading;
  final int? orgId;

  DashboardState({
    this.userProfileInfo,
    this.error,
    this.orgId,
    required this.isLoading,
  });

  DashboardState copyWith({
    UserProfileInfo? userProfileInfo,
    Exception? error,
    bool? isLoading,
    int? orgId,
  }) =>
      DashboardState(
        userProfileInfo: userProfileInfo ?? this.userProfileInfo,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
        orgId: orgId ?? this.orgId,
      );

  String get getSelectedOrgName => orgId != null
      ? userProfileInfo?.accounts
              ?.firstWhere((element) => element.orgId == orgId)
              .org
              ?.name ??
          'Error'
      : userProfileInfo?.accounts?[0].org?.name ?? 'Error';

  int get orgInfoLength => userProfileInfo?.accounts?.length ?? 0;

  double get userBalance => orgId != null
      ? userProfileInfo?.accounts
              ?.firstWhere((element) => element.orgId == orgId)
              .org
              ?.balance ??
          0.00
      : userProfileInfo?.accounts?[0].org?.balance ?? 0.00;

  String get lastUpdate => orgId != null
      ? userProfileInfo?.accounts
              ?.firstWhere((element) => element.orgId == orgId)
              .org
              ?.updatedAt ??
          ''
      : userProfileInfo?.accounts?[0].org?.updatedAt ?? '';
}

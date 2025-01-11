part of 'login_bloc.dart';

class LoginState {
  final bool isLoginFormValid;
  final bool isPasswordVisible;
  final bool areConditionsAccepted;
  final bool isGoogleBtnLoading;
  final bool isAuthSuccessful;
  final Exception? error;

  const LoginState({
    required this.isLoginFormValid,
    required this.isPasswordVisible,
    required this.areConditionsAccepted,
    required this.isGoogleBtnLoading,
    required this.isAuthSuccessful,
    this.error,
  });

  LoginState copyWith({
    bool? isLoginFormValid,
    bool? isPasswordVisible,
    bool? areConditionsAccepted,
    bool? isGoogleBtnLoading,
    bool? isAuthSuccessful,
    Exception? error,
  }) =>
      LoginState(
        isAuthSuccessful: isAuthSuccessful ?? this.isAuthSuccessful,
        error: error ?? this.error,
        isGoogleBtnLoading: isGoogleBtnLoading ?? this.isGoogleBtnLoading,
        isLoginFormValid: isLoginFormValid ?? this.isLoginFormValid,
        isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
        areConditionsAccepted:
            areConditionsAccepted ?? this.areConditionsAccepted,
      );

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }
}

final class LoginInitial extends LoginState {
  const LoginInitial({
    required super.isLoginFormValid,
    required super.isAuthSuccessful,
    required super.isPasswordVisible,
    required super.areConditionsAccepted,
    required super.isGoogleBtnLoading,
  });
}

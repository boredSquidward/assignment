part of 'login_bloc.dart';

abstract class LoginEvent {}

class ValidateLoginFormEvent extends LoginEvent {
  final String email;
  final String password;

  ValidateLoginFormEvent({
    required this.email,
    required this.password,
  });
}

class TogglePasswordVisibilityEvent extends LoginEvent {}

class ToggleTermsAndConditionsCheckboxEvent extends LoginEvent {}

class GoogleAuthSignInEvent extends LoginEvent {
  final String email;
  final String password;

  GoogleAuthSignInEvent({
    required this.email,
    required this.password,
  });
}

class GoogleBtnLoadingEvent extends LoginEvent {
  final bool isLoading;

  GoogleBtnLoadingEvent(this.isLoading);
}

import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../data/repository/secure_storage_repo.dart';
import '../../data/usecase/login_usecase.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  final SecureStorageRepo secureStorage;

  LoginBloc(this.loginUseCase, this.secureStorage)
      : super(const LoginInitial(
          isLoginFormValid: false,
          isAuthSuccessful: false,
          isPasswordVisible: false,
          areConditionsAccepted: false,
          isGoogleBtnLoading: false,
        )) {
    on<ValidateLoginFormEvent>((event, emit) {
      emit(state.copyWith(
          isLoginFormValid: isLoginFormValid(
              event.email, event.password, state.areConditionsAccepted)));
    });

    on<TogglePasswordVisibilityEvent>((event, emit) {
      emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
    });

    on<ToggleTermsAndConditionsCheckboxEvent>((event, emit) {
      emit(state.copyWith(areConditionsAccepted: !state.areConditionsAccepted));
    });

    on<GoogleAuthSignInEvent>((event, emit) async {
      add(GoogleBtnLoadingEvent(true));
      await loginUseCase.callSignIn(event.email, event.password).fold(
          (UserCredential left) async {
        if (left.user != null) {
          emit(state.copyWith(isAuthSuccessful: true));
        }
      }, (Exception right) {
        emit(state.copyWith(error: right, isAuthSuccessful: false));
      });
      add(GoogleBtnLoadingEvent(false));
    });

    on<GoogleBtnLoadingEvent>((event, emit) {
      emit(state.copyWith(isGoogleBtnLoading: event.isLoading));
    });
  }

  bool isLoginFormValid(
      String email, String password, bool areConditionsAccepted) {
    if (email.length >= 6 && password.length >= 6 && areConditionsAccepted) {
      return true;
    }
    return false;
  }
}

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:netvoz_app/src/features/login/state/login_state.dart';

import '../../../core/forms/common_forms.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier()
      : super(
          LoginState(
            email: EmailForm.pure(),
            password: PasswordForm.pure(),
            showPassword: false,
            formIsValid: false,
          ),
        );

  void changeEmail(String value) {
    state = state.copyWith(email: EmailForm.dirty(value));
    validateForms();
  }

  void changePassword(String value) {
    state = state.copyWith(password: PasswordForm.dirty(value));
    validateForms();
  }

  void onChangeVisibilityPassword() {
    state = state.copyWith(showPassword: !state.showPassword);
  }

  void validateForms() {
    if (state.email.valid && state.password.valid) {
      state = state.copyWith(formIsValid: true);
    } else {
      state = state.copyWith(formIsValid: false);
    }
  }
}

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:netvoz_app/src/core/forms/common_forms.dart';
import 'package:netvoz_app/src/features/register/state/register_state.dart';

class RegisterNotifier extends StateNotifier<RegisterState> {
  RegisterNotifier()
      : super(
          RegisterState(
            names: NameForm.pure(),
            lastNames: NameForm.pure(),
            phone: PhoneForm.pure(),
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

  void changeName(String value) {
    state = state.copyWith(names: NameForm.dirty(value));
    validateForms();
  }

  void changeLastName(String value) {
    state = state.copyWith(lastNames: NameForm.dirty(value));
    validateForms();
  }

  void changePhone(String value) {
    state = state.copyWith(phone: PhoneForm.dirty(value));
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
    if (state.email.valid &&
        state.password.valid &&
        state.names.valid &&
        state.lastNames.valid &&
        state.phone.valid) {
      state = state.copyWith(formIsValid: true);
    } else {
      state = state.copyWith(formIsValid: false);
    }
  }
}

import 'package:netvoz_app/src/core/forms/common_forms.dart';

class LoginState {
  const LoginState({
    required this.email,
    required this.password,
    required this.showPassword,
    required this.formIsValid,
  });
  final EmailForm email;
  final PasswordForm password;
  final bool showPassword;
  final bool formIsValid;

  LoginState copyWith({
    EmailForm? email,
    PasswordForm? password,
    bool? showPassword,
    bool? formIsValid,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      showPassword: showPassword ?? this.showPassword,
      formIsValid: formIsValid ?? this.formIsValid,
    );
  }

  @override
  String toString() {
    return 'LoginState(email: $email, password: $password, showPassword: $showPassword, formIsValid: $formIsValid)';
  }
}

import 'package:netvoz_app/src/core/forms/common_forms.dart';

class RegisterState {
  const RegisterState({
    required this.names,
    required this.lastNames,
    required this.phone,
    required this.email,
    required this.password,
    required this.showPassword,
    required this.formIsValid,
  });

  final NameForm names;
  final NameForm lastNames;
  final PhoneForm phone;
  final EmailForm email;
  final PasswordForm password;
  final bool showPassword;
  final bool formIsValid;

  RegisterState copyWith({
    NameForm? names,
    NameForm? lastNames,
    PhoneForm? phone,
    EmailForm? email,
    PasswordForm? password,
    bool? showPassword,
    bool? formIsValid,
  }) {
    return RegisterState(
      names: names ?? this.names,
      lastNames: lastNames ?? this.lastNames,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
      showPassword: showPassword ?? this.showPassword,
      formIsValid: formIsValid ?? this.formIsValid,
    );
  }

  @override
  String toString() {
    return 'RegisterState(names: $names, lastNames: $lastNames, phone: $phone, email: $email, password: $password, showPassword: $showPassword, formIsValid: $formIsValid)';
  }
}

import 'package:formz/formz.dart';
import 'package:netvoz_app/src/core/extensions/string_extension.dart';

enum NameError { empty }

class NameForm extends FormzInput<String, NameError> {
  NameForm.pure() : super.pure("");
  NameForm.dirty(String value) : super.dirty(value);

  @override
  NameError? validator(String value) {
    return value.isEmpty ? NameError.empty : null;
  }
}

enum PasswordError { empty, invalid }

class PasswordForm extends FormzInput<String, PasswordError> {
  PasswordForm.pure() : super.pure("");
  PasswordForm.dirty(String value) : super.dirty(value);

  @override
  PasswordError? validator(String value) {
    if (value.isEmpty) return PasswordError.empty;
    if (!value.validatePassword) return PasswordError.invalid;
    return null;
  }
}

enum EmailError { empty, invalid }

class EmailForm extends FormzInput<String, EmailError> {
  EmailForm.pure() : super.pure("");
  EmailForm.dirty(String value) : super.dirty(value);

  @override
  EmailError? validator(String value) {
    if (value.isEmpty) return EmailError.empty;
    if (!value.validateEmail) return EmailError.invalid;
    return null;
  }
}

enum PhoneError { empty, invalid }

class PhoneForm extends FormzInput<String, PhoneError> {
  PhoneForm.pure() : super.pure('');
  PhoneForm.dirty(String value) : super.dirty(value);

  @override
  PhoneError? validator(String value) {
    if (value.isEmpty) return PhoneError.empty;
    if (!value.validatePhone) return PhoneError.invalid;
    return null;
  }
}

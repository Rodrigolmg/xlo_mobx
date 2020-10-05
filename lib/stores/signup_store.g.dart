// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignupStore on _SignupStore, Store {
  Computed<bool> _$nameValidComputed;

  @override
  bool get nameValid => (_$nameValidComputed ??=
          Computed<bool>(() => super.nameValid, name: '_SignupStore.nameValid'))
      .value;
  Computed<bool> _$firstPassValidComputed;

  @override
  bool get firstPassValid =>
      (_$firstPassValidComputed ??= Computed<bool>(() => super.firstPassValid,
              name: '_SignupStore.firstPassValid'))
          .value;
  Computed<String> _$nameErrorComputed;

  @override
  String get nameError =>
      (_$nameErrorComputed ??= Computed<String>(() => super.nameError,
              name: '_SignupStore.nameError'))
          .value;
  Computed<String> _$firstPassErrorComputed;

  @override
  String get firstPassError =>
      (_$firstPassErrorComputed ??= Computed<String>(() => super.firstPassError,
              name: '_SignupStore.firstPassError'))
          .value;

  final _$nameAtom = Atom(name: '_SignupStore.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$emailAtom = Atom(name: '_SignupStore.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$phoneAtom = Atom(name: '_SignupStore.phone');

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  final _$firstPasswordAtom = Atom(name: '_SignupStore.firstPassword');

  @override
  String get firstPassword {
    _$firstPasswordAtom.reportRead();
    return super.firstPassword;
  }

  @override
  set firstPassword(String value) {
    _$firstPasswordAtom.reportWrite(value, super.firstPassword, () {
      super.firstPassword = value;
    });
  }

  final _$secondPasswordAtom = Atom(name: '_SignupStore.secondPassword');

  @override
  String get secondPassword {
    _$secondPasswordAtom.reportRead();
    return super.secondPassword;
  }

  @override
  set secondPassword(String value) {
    _$secondPasswordAtom.reportWrite(value, super.secondPassword, () {
      super.secondPassword = value;
    });
  }

  final _$loadingAtom = Atom(name: '_SignupStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$errorAtom = Atom(name: '_SignupStore.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$_signUpAsyncAction = AsyncAction('_SignupStore._signUp');

  @override
  Future<void> _signUp() {
    return _$_signUpAsyncAction.run(() => super._signUp());
  }

  final _$_SignupStoreActionController = ActionController(name: '_SignupStore');

  @override
  void setName(String nameValue) {
    final _$actionInfo = _$_SignupStoreActionController.startAction(
        name: '_SignupStore.setName');
    try {
      return super.setName(nameValue);
    } finally {
      _$_SignupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String emailValue) {
    final _$actionInfo = _$_SignupStoreActionController.startAction(
        name: '_SignupStore.setEmail');
    try {
      return super.setEmail(emailValue);
    } finally {
      _$_SignupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String phoneValue) {
    final _$actionInfo = _$_SignupStoreActionController.startAction(
        name: '_SignupStore.setPhone');
    try {
      return super.setPhone(phoneValue);
    } finally {
      _$_SignupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFirstPassword(String passwordValue) {
    final _$actionInfo = _$_SignupStoreActionController.startAction(
        name: '_SignupStore.setFirstPassword');
    try {
      return super.setFirstPassword(passwordValue);
    } finally {
      _$_SignupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSecondPassword(String passwordValue) {
    final _$actionInfo = _$_SignupStoreActionController.startAction(
        name: '_SignupStore.setSecondPassword');
    try {
      return super.setSecondPassword(passwordValue);
    } finally {
      _$_SignupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
phone: ${phone},
firstPassword: ${firstPassword},
secondPassword: ${secondPassword},
loading: ${loading},
error: ${error},
nameValid: ${nameValid},
firstPassValid: ${firstPassValid},
nameError: ${nameError},
firstPassError: ${firstPassError}
    ''';
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/helpers/extensions.dart';
import 'package:xlo_mobx/repositories/user/user_repository.dart';
import 'package:xlo_mobx/stores/user_manager_store.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {

  // OBSERVABLES
  @observable
  String email;

  @observable
  String password;

  @observable
  bool loading = false;

  @observable
  String error;

  //ACTIONS
  @action
  void setEmail(String emailValue) => email = emailValue;

  @action
  void setPassword(String passwordValue) => password = passwordValue;

  @action
  Future<void> _login() async {
    loading = true;

    try {
      final user = await UserRepository().loginWithEmail(email, password);
      GetIt.I<UserManagerStore>().setUser(user);
      print(user);
    } catch(e){
        error = e;
    }

    loading = false;
  }

  //COMPUTED
  @computed
  bool get emailValid => email != null && email.isEmailValid();
  bool get passwordValid => password != null && password.length >= 4;
  String get passwordError {

    if(password == null || passwordValid) return null;

    return 'Senha inválida!';
  }
  String get emailError {

    if(email == null || emailValid) return null;

    return 'E-mail inválido!';
  }
  Function get loginPressed => emailValid && passwordValid && !loading
      ? _login : null;
  Widget get buttonLabel => loading ?
  SizedBox(
    child: CircularProgressIndicator(strokeWidth: 2,),
    width: 20,
    height: 20,
  )
      : Text('ENTRAR');
  // FUNCTIONS

}


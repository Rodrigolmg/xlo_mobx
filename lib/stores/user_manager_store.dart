import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/models/user_model.dart';
import 'package:xlo_mobx/repositories/user/user_repository.dart';

part 'user_manager_store.g.dart';

class UserManagerStore = _UserManagerStore with _$UserManagerStore;

abstract class _UserManagerStore with Store {

  _UserManagerStore(){
    _getCurrentUser();
  }

  // OBSERVABLES
  @observable
  User user;


  // ACTIONS
  @action
  void setUser(User userValue) => user = userValue;

  // COMPUTED
  @computed
  bool get isLoggedIn => user != null;
  String get setDrawerHeaderLabel =>
      isLoggedIn ? user.name : 'Acesse sua conta agora!';
  Widget get setLinkToRegisterOrAccess =>
      isLoggedIn ? Text(
        user.email,
        style: TextStyle(
          color: Colors.white,
        ),
      ) : Text(
          "Clique aqui",
          style: TextStyle(
              color: Colors.white,
          ),
      );

  Future<void> _getCurrentUser() async {
    final user = await UserRepository().currentUser();
    setUser(user);
  }

  // FUNCTIONS
}




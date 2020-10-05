import 'package:mobx/mobx.dart';

part 'create_store.g.dart';

class CreateStore = _CreateStore with _$CreateStore;

abstract class _CreateStore with Store {


  // OBSERVABLES
  ObservableList images = ObservableList();


  // ACTIONS

  // COMPUTED

  // FUNCTIONS
}


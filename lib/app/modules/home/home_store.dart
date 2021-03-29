import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  List<String> categories = ['Coats', 'Dresses', 'Jersey', 'Pants'];

  @observable
  List<String> products1 = [
    'Winter Coat',
    'Woolen Coat',
    'Winter Coat',
    'Woolen Coat'
  ];
}

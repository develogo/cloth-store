import 'package:cloth_store/app/modules/home/pages/cloth/cloth_store.dart';
import 'package:cloth_store/app/modules/home/pages/cloth/cloth_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../home/home_store.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ClothStore()),
    Bind.lazySingleton((i) => HomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
    ChildRoute('/cloth',
        child: (_, args) => ClothPage(
              tag: args.data['tag'],
              title: args.data['title'],
            ),
        transition: TransitionType.fadeIn),
  ];
}

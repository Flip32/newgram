import 'package:flutter_modular/flutter_modular.dart';
import 'package:newgram/app/modules/register/register_page.dart';

class RegisterModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => RegisterPage()),
  ];

}
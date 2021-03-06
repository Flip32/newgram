import 'package:firebase_auth/firebase_auth.dart';
import 'package:newgram/app/modules/register/register_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:newgram/app/modules/register/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RegisterStore(
        firebaseAuth: i.get<FirebaseAuth>(),
        sharedPreferences: i.get<SharedPreferences>()
    )),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => RegisterPage()),
  ];
}

import 'package:newgram/app/modules/login/login_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:newgram/app/modules/login/forgot_password_page.dart';
import 'package:newgram/app/modules/login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginStore(i.get<FirebaseAuth>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => LoginPage()),
    ChildRoute('/forgot-password',
        child: (_, args) => ForgotPasswordPage(),
        transition: TransitionType.rightToLeftWithFade
    )
  ];
}

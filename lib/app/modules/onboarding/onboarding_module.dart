import 'package:flutter_modular/flutter_modular.dart';
import 'package:newgram/app/modules/onboarding/onboarding_page.dart';

class OnboardingModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => OnboardingPage()),
  ];

}
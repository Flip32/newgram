import 'package:flutter_modular/flutter_modular.dart';
import 'package:newgram/app/constanst.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'modules/home/home_module.dart';
import 'modules/onboarding/onboarding_module.dart';
import 'modules/register/register_module.dart';

class AppModule extends Module {

  SharedPreferences _sharedPreferences;
  AppModule(this._sharedPreferences);

  @override
  late final List<Bind> binds = [
    Bind.instance(_sharedPreferences),
  ];

  @override
  late final List<ModularRoute> routes = [
    ModuleRoute('/', module: _initialModule()),
    ModuleRoute('/onborading', module: OnboardingModule()),
    ModuleRoute('/register', module: RegisterModule()),
    ModuleRoute('/home', module: HomeModule()),
  ];

  Module _initialModule(){
    final onboardingDone = _sharedPreferences.getBool(Constants.SPK_ONBOARDING_DONE) ?? false;
    if(onboardingDone){
      return RegisterModule();
    } else {
      return OnboardingModule();
    }
  }

}
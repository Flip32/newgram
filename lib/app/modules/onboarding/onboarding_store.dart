import 'package:mobx/mobx.dart';
import 'package:newgram/app/constanst.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'onboarding_store.g.dart';

class OnboardingStore = _OnboardingStoreBase with _$OnboardingStore;
abstract class _OnboardingStoreBase with Store {

  SharedPreferences _sharedPreferences;
  _OnboardingStoreBase(this._sharedPreferences);

  @action
  markOnbordingDone(){
    _sharedPreferences.setBool(Constants.SPK_ONBOARDING_DONE, true);
  }
}
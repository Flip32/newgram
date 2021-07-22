import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:newgram/app/modules/feed/feed_module.dart';
import 'package:newgram/app/modules/profile/profile_module.dart';
import 'package:newgram/app/modules/search/search_module.dart';

import 'home_page.dart';
 
class HomeModule extends Module {
  @override
  final List<Bind> binds = [
 ];

 @override
 final List<ModularRoute> routes = [
   ChildRoute(
       Modular.initialRoute,
       child: (_, args) => HomePage(),
       children: [
         ModuleRoute('/feed', module: FeedModule(), transition: TransitionType.fadeIn),
         ModuleRoute('/profile', module: ProfileModule(), transition: TransitionType.fadeIn),
         ModuleRoute('/search', module: SearchModule(), transition: TransitionType.fadeIn)
       ]
   ),
 ];
}
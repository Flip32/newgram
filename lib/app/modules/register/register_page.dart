import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:newgram/app/modules/register/register_store.dart';

class RegisterPage extends StatefulWidget {
  final String title;
  const RegisterPage({Key? key, this.title = 'RegisterPage'}) : super(key: key);
  @override
  RegisterPageState createState() => RegisterPageState();
}
class RegisterPageState extends ModularState<RegisterPage, RegisterStore> {

  late PageController _pageController;

  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passController;

  late final ReactionDisposer _disposer;

  @override
  void initState() {// TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: 0);

    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passController = TextEditingController();
    
    _disposer = when((_) => store.user != null , () => Modular.to.pushReplacementNamed('/home'));

  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }

  late final Widget _form = PageView(
    controller: _pageController,
    physics: NeverScrollableScrollPhysics(),
    scrollDirection: Axis.vertical,
    children: <Widget>[
      _FormField(
        controller: _nameController,
        label: 'Qual é o seu nome?',
        showBackButton: false,
        onNext: () { _pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.easeOut); },
        onBack: () { },
      ),
      _FormField(
        controller: _emailController,
        label: 'Qual é o seu melhor email?',
        showBackButton: true,
        onNext: () { _pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.easeOut); },
        onBack: () { _pageController.previousPage(duration: Duration(seconds: 1), curve: Curves.easeOut); },
      ),
      _FormField(/**/
        controller: _passController,
        label: 'Crie sua senha',
        showBackButton: true,
        onNext: () { store.registerUser(name: _nameController.text, email: _emailController.text, password: _passController.text); },
        onBack: () { _pageController.previousPage(duration: Duration(seconds: 1), curve: Curves.easeOut); },
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Modular.to.pushReplacementNamed('/login');
          },
          child: Icon(Icons.login),
        ),
      body: Observer(
        builder: (_) {
          if(store.loading){
            return Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Text('Salvando...')
              ],
            );
          } else {
            return _form;
          }
        },
      )
    );
  }
}

class _FormField extends StatelessWidget{

  final TextEditingController controller;
  final bool showBackButton;
  final String label;
  final VoidCallback onNext;
  final VoidCallback onBack;
  _FormField({ required this.controller, this.showBackButton = true, required this.label, required this.onNext, required this.onBack });

  @override
  Widget build(BuildContext context) {
    return  Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              showBackButton ? IconButton(
                  onPressed: onBack,
                  icon: Icon(Icons.arrow_upward)
              ) : SizedBox.fromSize(size: Size.zero),
              Spacer(),
              Flexible(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(label, style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500), maxLines: 1),
                      ),
                      TextFormField(
                        onEditingComplete: onNext,
                        controller: controller,
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none
                        ),
                        style: TextStyle(
                            fontSize: 24
                        ),
                      )
                    ],
                  ),
                ))
            ]
        );
  }

}
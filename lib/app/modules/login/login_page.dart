import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:newgram/app/modules/login/login_store.dart';
import 'package:mobx/mobx.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'Faça seu login'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}
class LoginPageState extends ModularState<LoginPage, LoginStore> {

  late final TextEditingController _emailController;
  late final TextEditingController _passController;

  late final ReactionDisposer _disposer;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passController = TextEditingController();

    _disposer = when((_) => store.user != null , () => Modular.to.pushReplacementNamed('/home'));

  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          TextButton(
              onPressed: (){
                Modular.to.pushNamed('/register');
              },
              child: Text('Cadastrar', style: TextStyle(color: Theme.of(context).buttonColor),)
          )
        ]
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          // mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 120),
              child: Image.asset('assets/logo.png', fit: BoxFit.fitWidth),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'E-mail',
                hintText: 'seuemail@mail.com'
              )
            ),
            SizedBox(height: 24),
            TextFormField(
              controller: _passController,
                decoration: InputDecoration(
                    labelText: 'Senha',
                ),
              obscureText: true,
            ),
            SizedBox(height: 24),
            ElevatedButton(
                onPressed: (){
                  store.login(email: _emailController.text, password: _passController.text);
                },
                child: Observer(
                  builder: (_)  {
                    if(store.loading) {
                      return Transform.scale(
                          scale: 0.5,
                          child: CircularProgressIndicator(color: Theme.of(context).buttonColor)
                      );
                    } else {
                      return Text('ACESSAR');
                    }
                  }
                )
            ),
            TextButton(
                onPressed: (){
                  Modular.to.pushNamed('/login/forgot-password');
                },
                child: Text('Esqueceu a senha')
            )
          ],
        ),
      ),
    );
  }
}
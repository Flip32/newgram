import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:newgram/app/modules/login/login_store.dart';

class ForgotPasswordPage extends StatefulWidget {
  final String title;
  const ForgotPasswordPage({Key? key, this.title = 'Esqueceu a senha'}) : super(key: key);
  @override
  ForgotPasswordPageState createState() => ForgotPasswordPageState();
}
class ForgotPasswordPageState extends ModularState<ForgotPasswordPage, LoginStore> {

  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: ListView(
        children: [
          SizedBox(height: 20),
          Text(
              'Preencha o campo para recuperar a senha', style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 24 ),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'E-mail cadastrado'
            ),
          ),
          SizedBox(height: 60),
          ElevatedButton(
              onPressed: (){
                store.passwordRecover(email: _emailController.text)
                    .then((_) {
                      showDialog(context: context, builder: (_) {
                        return AlertDialog(
                          title: Text('Muito Bem.'),
                          content: Text('Agora siga as intruções no email para recuperar a sua senha.'),
                          actions: [
                            ElevatedButton(onPressed:() {
                              Modular.to.pop();
                            }, child: Text('OK'))
                          ],
                        );
                      });
                });
              },
              child: Observer(
                  builder: (_)  {
                    if(store.loading) {
                      return Transform.scale(
                          scale: 0.5,
                          child: CircularProgressIndicator(color: Theme.of(context).buttonColor)
                      );
                    } else {
                      return Text('Solicitar');
                    }
                  }
              )
          )
        ],
      )
      ),
    );
  }
}
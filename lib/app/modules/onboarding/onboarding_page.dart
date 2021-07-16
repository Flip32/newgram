import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:newgram/app/modules/onboarding/onboarding_store.dart';

class OnboardingPage extends StatefulWidget {
  final String title;
  const OnboardingPage({Key? key, this.title = 'NewGram'}) : super(key: key);
  @override
  OnboardingPageState createState() => OnboardingPageState();
}
class OnboardingPageState extends ModularState<OnboardingPage, OnboardingStore> {

  late PageController _pageController;

  @override
  void initState() {
    super .initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          children: [
            _OnboardStep(image: AssetImage('assets/img1.png'), text: 'Bem vindo ao Newgram',),
            _OnboardStep(
              image: AssetImage('assets/img2.png'),
              text: 'Faça suas fotos quenem no Instagram!',
                child: Column(
                    children: [
                      SizedBox(height: 30),
                      ElevatedButton(onPressed: (){
                        store.markOnbordingDone();
                        Modular.to.pushReplacementNamed('/register');
                      }, child: Text('Cadastre-se')),
                      TextButton(onPressed: (){
                        store.markOnbordingDone();
                        Modular.to.pushReplacementNamed('/login');
                      }, child: Text('Já tem cadastro?'))
                    ],
                )
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardStep extends StatelessWidget {

  final ImageProvider image;
  final String text;
  final Widget? child;
  _OnboardStep({ required this.image, required this.text, this.child });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 16,
        bottom: MediaQuery.of(context).padding.bottom + 96
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(child: Image(image: image, fit: BoxFit.fitWidth,)),
          SizedBox(height: 40,),
          Flexible(child: Text(text, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.purple),)),
          child ?? SizedBox.fromSize(size: Size.zero)
        ],
      ),
    );
  }
}
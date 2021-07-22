import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _onTabChange(_currentIndex);
  }

  void _onTabChange(int index) {
    setState(() {
      _currentIndex = index;
    });
    switch (index){
      case 0: Modular.to.navigate('/home/feed'); break;
      case 1: Modular.to.navigate('/home/search'); break;
      case 2: Modular.to.navigate('/home/profile'); break;
      default: break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: RouterOutlet(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: _onTabChange,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Perfil'),
          ],
        )
    );
  }
}
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  ProfilePageState createState() => ProfilePageState();
}
class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aqui vai o nome'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.add_box_outlined)),
        ],
      ),
      body: ListView(
        children: <Widget>[
          _UserHeader(),
          _UserSubHeader(),
          _UserImages()
        ],
      ),
    );
  }
}

class _ProfilePadding extends StatelessWidget {

  Widget child;
  _ProfilePadding({required this.child});

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.only(left: 24, top: 16, right: 24),
    child: child,
  );
}

class _UserHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.only(left: 24, top: 16, right: 24),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/no_avatar.png'),
            ),
            Column(
                children: [
                  Text('3422', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Publicações')
                ]),
            Column(
                children: [
                  Text('2345', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Seguidores')
                ]),
            Column(
                children: [
                  Text('342', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Seguindo')
                ]),
          ],
        )
    );
  }
}


class _UserSubHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return _ProfilePadding(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 10),
          Text('Nome do user', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text('Vestibulum diam quam, ultrices vitae ornare ultricies, venenatis ut nisi. Sed commodo gravida ligula, condimentum tincidunt metus gravida eget. ',
              style: TextStyle(fontWeight: FontWeight.normal)
          ),
          SizedBox(height: 10),
          ElevatedButton(onPressed: (){}, child: Text('Editar perfil')),
        ],
      ),
    );
  }
}


class _UserImages extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return _ProfilePadding(
      child: GridView.count(
          crossAxisCount: 3,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        physics: NeverScrollableScrollPhysics(),
        childAspectRatio: 1,
        shrinkWrap: true,
        children: [
          Image.network('http://lorempixel.com.br/300/300/?${DateTime.now().microsecond}'),
          Image.network('http://lorempixel.com.br/300/300/?${DateTime.now().microsecond}'),
          Image.network('http://lorempixel.com.br/300/300/?${DateTime.now().microsecond}'),
          Image.network('http://lorempixel.com.br/300/300/?${DateTime.now().microsecond}'),
          Image.network('http://lorempixel.com.br/300/300/?${DateTime.now().microsecond}'),
          Image.network('http://lorempixel.com.br/300/300/?${DateTime.now().microsecond}'),
          Image.network('http://lorempixel.com.br/300/300/?${DateTime.now().microsecond}'),
          Image.network('http://lorempixel.com.br/300/300/?${DateTime.now().microsecond}'),
          Image.network('http://lorempixel.com.br/300/300/?${DateTime.now().microsecond}'),
          Image.network('http://lorempixel.com.br/300/300/?${DateTime.now().microsecond}'),
          Image.network('http://lorempixel.com.br/300/300/?${DateTime.now().microsecond}'),
          Image.network('http://lorempixel.com.br/300/300/?${DateTime.now().microsecond}'),
          Image.network('http://lorempixel.com.br/300/300/?${DateTime.now().microsecond}'),
          Image.network('http://lorempixel.com.br/300/300/?${DateTime.now().microsecond}'),
          Image.network('http://lorempixel.com.br/300/300/?${DateTime.now().microsecond}'),
          Image.network('http://lorempixel.com.br/300/300/?${DateTime.now().microsecond}'),
          Image.network('http://lorempixel.com.br/300/300/?${DateTime.now().microsecond}'),
          Image.network('http://lorempixel.com.br/300/300/?${DateTime.now().microsecond}'),
        ],
      ),
    );
  }
}

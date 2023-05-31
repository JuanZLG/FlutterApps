import 'package:flutter/material.dart';
import 'main.dart';
import 'miscompras.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Perfil',
      theme: ThemeData.dark(),
      home: MiPerfilPage(),
    );
  }
}

class MiPerfilPage extends StatelessWidget {
  final String usuario = 'Jobser';
  final String nombre = 'Jobser';
  final String apellidos = 'Ocampo';
  final String email = 'julian@gmail.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Perfil'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('$usuario'),
              accountEmail: Text(email),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/jobser.jpg'),
              ),
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),
            ListTile(
              title: Text('Mi Perfil'),
              leading: Icon(Icons.person),
              onTap: () {
            
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              title: Text('Mis Compras'),
              leading: Icon(Icons.shopping_cart),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MisCompras()),
                );
              },
            ),
            ListTile(
              title: Text('Cerrar Sesión'),
              leading: Icon(Icons.logout),
              onTap: () {
                Navigator.pop(context);
                //nota: decirle a jobserd q haber el login pa linkearlo
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/jobser.jpg'),
            ),
            SizedBox(height: 20),
            Text(
              '@$usuario',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              '$nombre $apellidos',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              email,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                
              },
              style: ElevatedButton.styleFrom(primary: Colors.red),
              child: Text('Editar'),
            ),
          ],
        ),
      ),
    );
  }
}

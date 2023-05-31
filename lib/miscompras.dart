import 'package:flutter/material.dart';
import 'main.dart';
import 'miperfil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mis Compras',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: MisCompras(),
    );
  }
}

class MisCompras extends StatelessWidget {
  final List<Map<String, dynamic>> purchases = [
    {
      'product': 'Isopropyl',
      'quantity': '1',
      'price': '\$100.000',
    },
    {
      'product': 'Bi-Pro Classic',
      'quantity': '1',
      'price': '\$160.000',
    },
    {
      'product': 'Best Protein by ProScience',
      'quantity': '2',
      'price': '\$280.000',
    },
    {
      'product': 'Rex Creatine',
      'quantity': '1',
      'price': '\$115.000',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Compras'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [ const
            UserAccountsDrawerHeader(
              accountName: Text('Jobser'),
              accountEmail: Text('julian@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/jobser.jpeg'),
              ),
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: Text('Mi Perfil'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MiPerfilPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Mis Compras'),
              onTap: () {
                Navigator.pop(context); 
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
              );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Cerrar Sesión'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: purchases.length,
        itemBuilder: (context, index) {
          return PurchaseCard(
            product: purchases[index]['product'],
            quantity: purchases[index]['quantity'],
            price: purchases[index]['price'],
          );
        },
      ),
    );
  }
}

class PurchaseCard extends StatelessWidget {
  final String product;
  final String quantity;
  final String price;

  const PurchaseCard({
    Key? key,
    required this.product,
    required this.quantity,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.shopping_cart),
                      SizedBox(width: 8),
                      Text(
                        'Producto:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(product),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.format_list_numbered),
                      SizedBox(width: 8),
                      Text(
                        'Cantidad:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(quantity),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 8),
                      Text(
                        'Precio:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(price),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
            
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
       
              },
            ),
          ],
        ),
      ),
    );
  }
}

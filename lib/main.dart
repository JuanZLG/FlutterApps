import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'miscompras.dart';
import 'miperfil.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menú Lateral',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
//acordarme de preguntar a jobserd q haber el login
class HomePage extends StatelessWidget {
  final List<String> images = [
    "assets/images/promocreakong.jpg",
    "assets/images/rock.webp",
    "assets/images/ironmage.webp",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/logobru.webp'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
  
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Jobser'),
              accountEmail: Text('julian@gmail.com'),
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
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MiPerfilPage()),
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
                // nota: decirle a jobserd q haber el login
              },
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              background: _swiper(),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height: 16.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '¡Más de 110 referencias!',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Busca tu producto ideal',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 30.0),
                    GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      padding: EdgeInsets.all(20.0),
                      childAspectRatio: 0.6,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        ProductCard(
                          image: Image.asset('assets/images/sgainer.webp'),
                          price: '100.000',
                        ),
                        ProductCard(
                          image: Image.asset('assets/images/sgainer.webp'),
                          price: '110.000',
                        ),
                        ProductCard(
                          image: Image.asset('assets/images/sgainer.webp'),
                          price: '130.000',
                        ),
                        ProductCard(
                          image: Image.asset('assets/images/sgainer.webp'),
                          price: '150.000',
                        ),
                        ProductCard(
                          image: Image.asset('assets/images/sgainer.webp'),
                          price: '230.000',
                        ),
                        ProductCard(
                          image: Image.asset('assets/images/sgainer.webp'),
                          price: '180.000',
                        ),
                      ],
                    ),
                    SizedBox(height: 80.0), 
                  ],
                ),
              ),
            ]),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              color: Colors.grey[900],
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Términos y condiciones',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Derechos reservados',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Text(
                        'TuiranFit © 2023',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Medellín, Colombia',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _swiper() {
    return Container(
      width: double.infinity,
      height: 250.0,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(
            images[index],
            fit: BoxFit.fill,
          );
        },
        autoplay: true,
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        pagination: SwiperPagination(),
        control: SwiperControl(),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Image image;
  final String price;

  ProductCard({
    Key? key,
    required this.image,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              child: image,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            '\$$price',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
            onPressed: () {

            },
            child: const Text('Comprar'),
          ),
          ),
        ],
      ),
    );
  }
}

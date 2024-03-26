import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Importez GetX
import 'home.dart';
import 'enregistrements.dart';
import 'listes.dart';
import 'bilan.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // Utilisez GetMaterialApp au lieu de MaterialApp
      title: 'Mon application',
      navigatorKey: Get.key, // Utilisez Get.key au lieu de Get.navigatorKey
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Roboto', // Exemple d'utilisation de police personnalisée
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomePageContent(),
    EnregistrementPage(),
    ListesPage(),
    BalancePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GEST_COTON'),
        backgroundColor: Colors.green, // Couleur de la barre d'applications
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              // Insérer la logique de déconnexion ici
            },
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: 'Enregistrements',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Listes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Bilan',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
      drawer: Drawer(
        child: Container(
          width: MediaQuery.of(context).size.width *
              0.4, // Ajustez la largeur selon vos besoins
          decoration: BoxDecoration(
            color: Colors.green, // Exemple d'utilisation de la couleur d'arrière-plan
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/coton.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Text(
                    'GEST_COTON',
                    style: TextStyle(
                      color: Colors.white, // Exemple d'utilisation de la couleur de texte
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading:
                    Icon(Icons.home, color: Colors.white), // Icône pour Accueil
                title: Text(
                  'Accueil',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _onItemTapped(0);
                },
              ),
              ListTile(
                leading: Icon(Icons.add_shopping_cart,
                    color: Colors.white), // Icône pour Enregistrements
                title: Text(
                  'Enregistrements',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _onItemTapped(1);
                },
              ),
              ListTile(
                leading:
                    Icon(Icons.list, color: Colors.white), // Icône pour Listes
                title: Text(
                  'Listes',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _onItemTapped(2);
                },
              ),
              ListTile(
                leading: Icon(Icons.bar_chart,
                    color: Colors.white), // Icône pour Bilan
                title: Text(
                  'Bilan',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _onItemTapped(3);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

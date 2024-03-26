import 'dart:ui';

import 'package:flutter/material.dart';

class RegisterFieldPage extends StatefulWidget {
  @override
  _RegisterFieldPageState createState() => _RegisterFieldPageState();
}

class _RegisterFieldPageState extends State<RegisterFieldPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Variables pour les valeurs des champs
  String _name = '';
  String _location = '';
  double _surface = 0.0;
  String _observation = '';
  String _selectedUserId = '';

  // Liste d'exemple d'identifiants d'utilisateur
  List<String> _userIds = ['utilisateur1', 'utilisateur2', 'utilisateur3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter les Champs'),
        backgroundColor: Colors.green, // Couleur de la barre d'applications
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 4,
            shadowColor: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/images/field.jpg"), // Image à utiliser
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nom',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.7),
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 27, 27, 27),
                      ),
                      prefixIcon: Icon(Icons.person, color: Colors.green),
                    ),
                    style: TextStyle(color: Colors.black),
                    onChanged: (value) {
                      setState(() {
                        _name = value;
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez entrer un nom';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Location',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.7),
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 27, 27, 27),
                      ),
                      prefixIcon: Icon(Icons.location_on, color: Colors.green),
                    ),
                    style: TextStyle(color: Colors.black),
                    onChanged: (value) {
                      setState(() {
                        _location = value;
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez entrer une location';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Surface',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.7),
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 27, 27, 27),
                      ),
                      prefixIcon: Icon(Icons.square_foot, color: Colors.green),
                    ),
                    style: TextStyle(color: Colors.black),
                    onChanged: (value) {
                      setState(() {
                        _surface = double.tryParse(value) ?? 0.0;
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez entrer une surface';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Observation',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.7),
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 27, 27, 27),
                      ),
                      prefixIcon: Icon(Icons.notes, color: Colors.green),
                    ),
                    style: TextStyle(color: Colors.black),
                    onChanged: (value) {
                      setState(() {
                        _observation = value;
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez entrer une observation';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      labelText: 'Utilisateur',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.7),
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 27, 27, 27),
                      ),
                      prefixIcon: Icon(Icons.person, color: Colors.green),
                    ),
                    value: _selectedUserId,
                    onChanged: (value) {
                      setState(() {
                        _selectedUserId = value.toString();
                      });
                    },
                    items: [
                      DropdownMenuItem(
                        value: '',
                        child: Text(''),
                      ),
                      ..._userIds.map((userId) {
                        return DropdownMenuItem(
                          value: userId,
                          child: Text(userId),
                        );
                      }).toList(),
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez sélectionner un utilisateur';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState != null &&
                          _formKey.currentState!.validate()) {
                        // Enregistrer les données ou effectuer d'autres actions
                        // selon votre logique métier
                      }
                    },
                    child: Container(
                      width: double
                          .infinity, // Pour étendre le bouton sur toute la largeur
                      child: Center(
                        child: Text(
                          'Enregistrer',
                          style: TextStyle(
                            color: Colors.white, // Couleur du texte
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color.fromARGB(255, 27, 27, 27),
                      backgroundColor: Colors
                          .green, // Couleur du texte quand le bouton est enfoncé
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RegisterFieldPage(),
  ));
}

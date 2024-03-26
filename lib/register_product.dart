import 'package:flutter/material.dart';

class RegisterProductPage extends StatefulWidget {
  @override
  _RegisterProductPageState createState() => _RegisterProductPageState();
}

class _RegisterProductPageState extends State<RegisterProductPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name = '';
  String _typeProduct = '';
  int _quantity = 0;
  double _priceUnit = 0.0;
  String _description = '';
  String _selectedUserId = '';
  List<String> _userIds = ['user1', 'user2', 'user3'];

  @override
  Widget build(BuildContext context) {
    _selectedUserId = _userIds.isNotEmpty ? _userIds[0] : '';

    return Scaffold(
      appBar: AppBar(
        title: Text('Formulaire de Produit'),
        backgroundColor: Colors.green,
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
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/product.jpg"), // Image à utiliser
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Nom du produit',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.7),
                              prefixIcon:
                                  Icon(Icons.shopping_bag, color: Colors.green),
                            ),
                            style: TextStyle(color: Colors.black),
                            onChanged: (value) {
                              setState(() {
                                _name = value;
                              });
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Veuillez entrer le nom du produit';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Type de produit',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.7),
                              prefixIcon:
                                  Icon(Icons.category, color: Colors.green),
                            ),
                            style: TextStyle(color: Colors.black),
                            onChanged: (value) {
                              setState(() {
                                _typeProduct = value;
                              });
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Veuillez entrer le type de produit';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Quantité',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.7),
                              prefixIcon: Icon(Icons.format_list_numbered,
                                  color: Colors.green),
                            ),
                            keyboardType: TextInputType.number,
                            style: TextStyle(color: Colors.black),
                            onChanged: (value) {
                              setState(() {
                                _quantity = int.tryParse(value) ?? 0;
                              });
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Veuillez entrer la quantité';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Prix unitaire',
                              prefix: Text('€',
                                  style: TextStyle(color: Colors.green)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.7),
                              prefixIcon:
                                  Icon(Icons.attach_money, color: Colors.green),
                            ),
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            style: TextStyle(color: Colors.black),
                            onChanged: (value) {
                              setState(() {
                                _priceUnit = double.tryParse(value) ?? 0.0;
                              });
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Veuillez entrer le prix unitaire';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Description',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.7),
                              prefixIcon:
                                  Icon(Icons.description, color: Colors.green),
                            ),
                            maxLines: 3,
                            style: TextStyle(color: Colors.black),
                            onChanged: (value) {
                              setState(() {
                                _description = value;
                              });
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Veuillez entrer une description';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          DropdownButtonFormField(
                            decoration: InputDecoration(
                              labelText: 'Agriculteur',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.7),
                              prefixIcon:
                                  Icon(Icons.person, color: Colors.green),
                            ),
                            value: _selectedUserId,
                            onChanged: (value) {
                              setState(() {
                                _selectedUserId = value.toString();
                              });
                            },
                            items: _userIds.map((userId) {
                              return DropdownMenuItem(
                                value: userId,
                                child: Text(userId),
                              );
                            }).toList(),
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
                              if (_formKey.currentState!.validate()) {
                                // Enregistrer le produit ou effectuer d'autres actions
                                // selon votre logique métier
                                // par exemple :
                                // saveProduct();
                              }
                            },
                            child: Text(
                              'Enregistrer',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class RegisterHarvestPage extends StatefulWidget {
  @override
  _RegisterHarvestPageState createState() => _RegisterHarvestPageState();
}

class _RegisterHarvestPageState extends State<RegisterHarvestPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Champs du formulaire
  String _weightCoton = '';
  String _priceUnit = '';
  DateTime _selectedDate = DateTime.now();
  String _observation = '';
  String _selectedFieldId = ''; // Champ de sélection

  // Liste d'exemple d'identifiants de champs
  List<String> _fieldIds = [
    'champ1',
    'champ2',
    'champ3'
  ]; // Assurez-vous que chaque champ est unique

  @override
  void initState() {
    super.initState();
    // Assigner une valeur initiale au champ de sélection
    _selectedFieldId = _fieldIds.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter les récoltes'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 5,
            shadowColor: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/harv.jpg"), // Image à utiliser
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Poids de coton',
                        prefixIcon: Icon(Icons.widgets, color: Colors.green),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      onChanged: (value) {
                        setState(() {
                          _weightCoton = value;
                        });
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Veuillez entrer le poids de coton';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Prix unitaire',
                        prefix:
                            Text('€', style: TextStyle(color: Colors.green)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.7),
                        prefixIcon:
                            Icon(Icons.attach_money, color: Colors.green),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _priceUnit = value;
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
                      onTap: () async {
                        final DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: _selectedDate,
                          firstDate: DateTime(2015, 8),
                          lastDate: DateTime(2101),
                        );
                        if (pickedDate != null && pickedDate != _selectedDate) {
                          setState(() {
                            _selectedDate = pickedDate;
                          });
                        }
                      },
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'Date',
                        prefixIcon:
                            Icon(Icons.calendar_today, color: Colors.green),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Veuillez sélectionner une date';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Observation',
                        prefixIcon: Icon(Icons.note, color: Colors.green),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
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
                    // Champ de sélection de champ
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: 'Identifiant du champ',
                        prefixIcon:
                            Icon(Icons.crop_square, color: Colors.green),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      value: _selectedFieldId,
                      onChanged: (value) {
                        setState(() {
                          _selectedFieldId = value.toString();
                        });
                      },
                      items: _fieldIds.map((fieldId) {
                        return DropdownMenuItem(
                          value: fieldId,
                          child: Text(fieldId),
                        );
                      }).toList(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez sélectionner un champ';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Soumettez votre formulaire
                        }
                      },
                      child: Text(
                        'Soumettre',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, // Couleur de fond verte
                        minimumSize: Size(double.infinity,
                            50), // Largeur maximale, hauteur de 50
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12), // Bord arrondi
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

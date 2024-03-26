import 'package:flutter/material.dart';

class Farmer {
  final String firstName;
  final String lastName;
  final String commune;
  final String arrondissement;

  Farmer({
    required this.firstName,
    required this.lastName,
    required this.commune,
    required this.arrondissement,
  });
}

class ListUsersPage extends StatefulWidget {
  @override
  _ListUsersPageState createState() => _ListUsersPageState();
}

class _ListUsersPageState extends State<ListUsersPage> {
  final List<Farmer> farmers = [
    Farmer(
      firstName: 'John',
      lastName: 'Doe',
      commune: 'Commune A',
      arrondissement: 'Arrondissement 1',
    ),
    Farmer(
      firstName: 'Jane',
      lastName: 'Doe',
      commune: 'Commune B',
      arrondissement: 'Arrondissement 2',
    ),
    Farmer(
      firstName: 'Alice',
      lastName: 'Smith',
      commune: 'Commune C',
      arrondissement: 'Arrondissement 3',
    ),
  ];

  List<Farmer> filteredFarmers = [];

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredFarmers = farmers;
    _searchController.addListener(() {
      filterFarmers();
    });
  }

  void filterFarmers() {
    String query = _searchController.text;
    List<Farmer> filteredList = farmers.where((farmer) {
      String fullName = '${farmer.firstName} ${farmer.lastName}'.toLowerCase();
      return fullName.contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredFarmers = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des agriculteurs'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _searchController.clear();
                filteredFarmers = farmers; // Correction
              });
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100.0),
                border: Border.all(color: Colors.grey),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Rechercher un agriculteur...',
                    border: InputBorder.none,
                    suffixIcon: _searchController.text.isEmpty
                        ? null
                        : IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              setState(() {
                                _searchController.clear();
                              });
                            },
                          ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: filteredFarmers.length,
              itemBuilder: (context, index) {
                final farmer = filteredFarmers[index];
                return Dismissible(
                  key: Key(farmer.firstName),
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 40.0),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onDismissed: (direction) {
                    setState(() {
                      farmers.removeAt(index);
                      filteredFarmers.removeAt(index);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Agriculteur supprimé'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  },
                  direction: DismissDirection.endToStart,
                  child: Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(
                          '${farmer.firstName} ${farmer.lastName}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle:
                            Text('${farmer.commune}, ${farmer.arrondissement}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.visibility),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Détails de l\'agriculteur'),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              'Nom: ${farmer.firstName} ${farmer.lastName}'),
                                          Text('Commune: ${farmer.commune}'),
                                          Text(
                                              'Arrondissement: ${farmer.arrondissement}'),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('Fermer'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                // Action pour mettre à jour le produit
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _DataSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Not required for now
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Not required for now
    return Container();
  }
}

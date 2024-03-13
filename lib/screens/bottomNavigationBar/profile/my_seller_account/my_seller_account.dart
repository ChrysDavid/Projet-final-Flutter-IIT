import 'package:flutter/material.dart';
import '../my_seller_account/components/Partie_web_site.dart';
import '../my_seller_account/components/partie_avis.dart';
import '../my_seller_account/components/partie_categorie.dart';
import '../my_seller_account/components/partie_description.dart';
import '../my_seller_account/components/partie_image.dart';
import '../my_seller_account/components/partie_socio.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MySellerAccountScreen extends StatelessWidget {
  static String routeName = "/Account_Seller";
  const MySellerAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        automaticallyImplyLeading: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'statistiques') {
                Navigator.pushNamed(context, Statistique.routeName);
              } else if (value == 'portefeuille') {
                Navigator.pushNamed(context, Portefeuille.routeName);
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'statistiques',
                child: ListTile(
                  leading: Icon(Icons.analytics),
                  title: Text('Statistiques'),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'portefeuille',
                child: ListTile(
                  leading: Icon(Icons.account_balance_wallet),
                  title: Text('Portefeuille'),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PartieImage(),
            PartieCategorie(),
            PartieDescription(),
            PartieSiteWeb(),
            PartieSocio(),
            Commentaire(),
          ],
        ),
      ),
    );
  }
}

class Statistique extends StatelessWidget {
  static String routeName = "/Statistique";
  const Statistique({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Statistique'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 350,
                child: Column(
                  children: [
                    Text(
                      'Graphique en colonnes',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: SfCartesianChart(
                        series: <ColumnSeries>[
                          ColumnSeries<SalesData, String>(
                            dataSource: [
                              SalesData('Jan', 35),
                              SalesData('Feb', 28),
                              SalesData('Mar', 34),
                              SalesData('Apr', 32),
                              SalesData('May', 40),
                            ],
                            xValueMapper: (SalesData sales, _) => sales.month,
                            yValueMapper: (SalesData sales, _) => sales.sales,
                          ),
                        ],
                        primaryXAxis: CategoryAxis(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 350,
                child: Column(
                  children: [
                    Text(
                      'Graphique circulaire',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: SfCircularChart(
                        series: <PieSeries>[
                          PieSeries<SalesData, String>(
                            dataSource: [
                              SalesData('Jan', 35),
                              SalesData('Feb', 28),
                              SalesData('Mar', 34),
                              SalesData('Apr', 32),
                              SalesData('May', 40),
                            ],
                            xValueMapper: (SalesData sales, _) => sales.month,
                            yValueMapper: (SalesData sales, _) => sales.sales,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 350,
                child: Column(
                  children: [
                    Text(
                      'Graphique en barres',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: SfCartesianChart(
                        series: <BarSeries>[
                          BarSeries<SalesData, String>(
                            dataSource: [
                              SalesData('Jan', 35),
                              SalesData('Feb', 28),
                              SalesData('Mar', 34),
                              SalesData('Apr', 32),
                              SalesData('May', 40),
                            ],
                            xValueMapper: (SalesData sales, _) => sales.month,
                            yValueMapper: (SalesData sales, _) => sales.sales,
                          ),
                        ],
                        primaryXAxis: CategoryAxis(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SalesData {
  final String month;
  final double sales;

  SalesData(this.month, this.sales);
}

class Portefeuille extends StatefulWidget {
  static String routeName = "/Portefeuille";

  const Portefeuille({Key? key}) : super(key: key);

  @override
  _PortefeuilleState createState() => _PortefeuilleState();
}

class _PortefeuilleState extends State<Portefeuille> {
  List<Map<String, dynamic>> ventes = [
    {
      'date': '01/01/2021',
      'description': 'Vente de produits',
      'montant': '\$500'
    },
    {
      'date': '02/02/2022',
      'description': 'Frais de location',
      'montant': '\$200'
    },
    {
      'date': '03/03/2023',
      'description': 'Salaires des employés',
      'montant': '\$1000'
    },
    {
      'date': '01/01/2024',
      'description': 'Vente de produits',
      'montant': '\$500'
    },
    {
      'date': '05/01/2023',
      'description': 'Frais de location',
      'montant': '\$200'
    },
    {
      'date': '10/01/2023',
      'description': 'Salaires des employés',
      'montant': '\$1000'
    },
    {
      'date': '01/01/2023',
      'description': 'Vente de produits',
      'montant': '\$500'
    },
    {
      'date': '05/01/2023',
      'description': 'Frais de location',
      'montant': '\$200'
    },
    {
      'date': '10/01/2023',
      'description': 'Salaires des employés',
      'montant': '\$1000'
    },
    // Ajoutez d'autres données de vente ici
  ];

  List<Map<String, dynamic>> filteredVentes = [];

  TextEditingController searchController = TextEditingController();

  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    filteredVentes = List.from(ventes);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void searchVentes(String searchTerm) {
    if (searchTerm.isEmpty) {
      setState(() {
        filteredVentes = List.from(ventes);
      });
      return;
    }

    setState(() {
      filteredVentes = ventes
          .where((vente) =>
              vente['date'].toLowerCase().contains(searchTerm.toLowerCase()) ||
              vente['description']
                  .toLowerCase()
                  .contains(searchTerm.toLowerCase()) ||
              vente['montant'].toLowerCase().contains(searchTerm.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: isSearching
            ? TextField(
                controller: searchController,
                onChanged: (value) => searchVentes(value),
                decoration: InputDecoration(
                  hintText: 'Rechercher...',
                  hintStyle:
                      TextStyle(color: const Color.fromARGB(137, 65, 62, 62)),
                  border: InputBorder.none,
                ),
                style: TextStyle(color: Colors.black),
              )
            : Text(
                'Portefeuille',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isSearching = !isSearching;
                if (!isSearching) {
                  searchController.clear();
                  searchVentes('');
                }
              });
            },
            icon: Icon(isSearching ? Icons.close : Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: DataTable(
            columnSpacing: 30.0,
            headingRowHeight: 50.0,
            dataRowHeight: 56.0,
            columns: [
              DataColumn(
                label: Text(
                  'Date',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Description',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Montant',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
            rows: filteredVentes
                .map(
                  (vente) => DataRow(
                    cells: [
                      DataCell(Text(vente['date'])),
                      DataCell(Text(vente['description'])),
                      DataCell(Text(vente['montant'])),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

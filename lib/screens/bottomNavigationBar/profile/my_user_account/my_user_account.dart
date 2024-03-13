import 'package:flutter/material.dart';
import 'package:jj_vr/constants.dart';
import 'package:jj_vr/screens/bottomNavigationBar/favourite/favorite_screen.dart';
import 'package:jj_vr/size_config.dart';

class MyUserAccountScreen extends StatelessWidget {
  static String routeName = "/Account_User";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mon Compte'),
      ),
      body: ListView(
        children: [
          Container(
            color: Color(0xFFF6F7F9),
            padding: EdgeInsets.all(16),
            child: Text(
              'Partie menu d\'achat',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          buildMenuItem(
            icon: Icons.shopping_cart,
            title: 'Mes commandes',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MesCommandesPage(),
                ),
              );
            },
          ),
          buildMenuItem(
            icon: Icons.card_giftcard,
            title: 'Bon d\'achat',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BonAchat(),
                ),
              );
            },
          ),
          buildMenuItem(
            icon: Icons.favorite,
            title: 'Ma liste d\'envie',
            onTap: () => Navigator.pushNamed(context, FavoriteScreen.routeName),
          ),
          buildMenuItem(
            icon: Icons.help_sharp,
            title: 'Aide',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AideScreen(),
                ),
              );
            },
          ),
          // Ajoutez d'autres éléments de menu ici
        ],
      ),
    );
  }

  Widget buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(icon),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}

class MesCommandeScreen extends StatelessWidget {
  const MesCommandeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mes Commande'),
      ),
      body: Center(
        child: Text('Aucune Commande pour le momment'),
      ),
    );
  }
}

class MesCommandesPage extends StatelessWidget {
  final List<Commande> commandes = [
    // Commande(
    //   id: 1,
    //   title: 'Chemise élégante',
    //   price: 99.99,
    //   description: 'Description de la chemise élégante',
    //   images: 'assets/images/shoes2.png',
    //   status: 'Colis Livré',
    //   dateLivraison: '15/04/2023',
    // ),
    // Ajoutez d'autres commandes ici
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Mes Commandes'),
      ),
      body: commandes.isEmpty
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200,
                    child: Image.asset(
                      'assets/images/undraw_empty_cart_co35.png',
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Aucune commande pour le moment',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 30),
              height: size.height * 0.5,
              child: ListView.builder(
                itemCount: commandes.length,
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailCommande(),
                        ),
                      );
                    },
                    leading: SizedBox(
                      width: 88,
                      child: AspectRatio(
                        aspectRatio: 0.88,
                        child: Container(
                          padding:
                              EdgeInsets.all(getProportionateScreenWidth(10)),
                          decoration: BoxDecoration(
                            color: Color(0xFFF5F6F9),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.asset(commandes[index].images),
                        ),
                      ),
                    ),
                    title: Text(commandes[index].title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: kPrimaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              commandes[index].status,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          commandes[index].dateLivraison,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}

class Commande {
  final int id;
  final String title;
  final double price;
  final String description;
  final String images;
  final String status;
  final String dateLivraison;

  Commande({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.status,
    required this.dateLivraison,
  });
}

class DetailCommande extends StatelessWidget {
  const DetailCommande({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Commande #3166463669',
                  style: TextStyle(
                      fontWeight: FontWeight.w800, color: Colors.black),
                ),
                Text(
                  'Placée le: 26-12-2022',
                  style: TextStyle(color: Colors.grey[400]),
                ),
                Text(
                  'N° d\'article: 1',
                  style: TextStyle(color: Colors.grey[400]),
                ),
                Text(
                  'Totale: 6,140 FCFA',
                  style: TextStyle(color: Colors.grey[400]),
                ),
              ],
            ),
          ),
          Container(
            color: Color(0xFFFFECDF),
            child: Text('ARTICLE DANS VOTRE COMMANDE'),
          ),
        ],
      ),
    );
  }
}

class AideScreen extends StatelessWidget {
  const AideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Aide'),
      ),
      body: Center(
        child: Text('Aucune aide prévue'),
      ),
    );
  }
}

class BonAchat extends StatelessWidget {
  const BonAchat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bon d\'achat'),
      ),
      body: Center(
        child: Text('Aucune aide prévue'),
      ),
    );
  }
}

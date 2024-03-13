class Entreprise {
  final int id;
  final String imageProfile;
  final String imageEntreprise;
  final String nom;
  // final CoordonneesGPS coordonneesGPS;
  final bool estAbonnee;
  final List<Categorie> categories;
  final String description;
  final String siteWeb;
  final List<ReseauxSocio> reseauxSocio;
  final List<Mon_Avis> monAvis;
  final List<Avis_Commentaire> avisCommentaires;

  Entreprise({
    required this.id,
    required this.imageProfile,
    required this.imageEntreprise,
    required this.nom,
    // required this.coordonneesGPS,
    required this.estAbonnee,
    required this.categories,
    required this.description,
    required this.siteWeb,
    required this.reseauxSocio,
    required this.monAvis,
    required this.avisCommentaires,
  });
}

// class CoordonneesGPS {
//   final double latitude;
//   final double longitude;

//   CoordonneesGPS({required this.latitude, required this.longitude});
// }

class Categorie {
  final int id;
  final String nom;
  final String image;
  final List<Produit> produits;

  Categorie(
      {required this.id,
      required this.nom,
      required this.image,
      required this.produits});
}

class Produit {
  final int id;
  final String nom;
  final List<String> images;
  final String description;
  final bool estFavori;
  final double prix;
  final Entreprise entreprise;

  Produit({
    required this.id,
    required this.nom,
    required this.images,
    required this.description,
    required this.estFavori,
    required this.prix,
    required this.entreprise,
  });
}

class ReseauxSocio {
  final int id;
  final String lien;

  ReseauxSocio({
    required this.id,
    required this.lien,
  });
}

class Mon_Avis {
  final double avis;
  final String commentaire;

  Mon_Avis({
    required this.avis,
    required this.commentaire,
  });
}

class Avis_Commentaire {
  final int id;
  final String imageDestinataire;
  final String nomDestinataire;
  final double avis;
  final String commentaire;

  Avis_Commentaire({
    required this.id,
    required this.imageDestinataire,
    required this.nomDestinataire,
    required this.avis,
    required this.commentaire,
  });
}

Entreprise entreprise1 = Entreprise(
  id: 1,
  imageProfile: 'assets/images/profile_7.png',
  imageEntreprise: 'assets/images/entreprise1.png',
  nom: 'Entreprise 1',
  // coordonneesGPS: CoordonneesGPS(latitude: 123.456, longitude: 789.012),
  categories: [
    Categorie(
      id: 1,
      nom: 'Catégorie 1',
      image: 'assets/images/GTA.png',
      produits: [
        Produit(
          id: 1,
          nom: 'Produit 1',
          images: ['assets/images/GTA.png', 'assets/images/GTA1.png'],
          description: 'Description du produit 1',
          prix: 10.99,
          estFavori: true,
          entreprise: entreprise2,
        ),
        Produit(
          id: 2,
          nom: 'Produit 2',
          images: ['assets/images/COD.png', 'assets/images/COD1_2.png'],
          description: 'Description du produit 2',
          estFavori: false,
          prix: 19.99,
          entreprise: entreprise2,
        ),
      ],
    ),
    // Ajoutez d'autres catégories ici
  ],
  description: 'Description de l\'entreprise 1',
  siteWeb: 'www.entreprise1.com',
  reseauxSocio: [
    ReseauxSocio(
      id: 1,
      lien: '',
    ),
    ReseauxSocio(
      id: 2,
      lien: '',
    ),
    ReseauxSocio(
      id: 3,
      lien: '',
    ),
  ],
  avisCommentaires: [
    Avis_Commentaire(
      id: 1,
      imageDestinataire: 'assets/images/avatar1.png',
      nomDestinataire: 'John Doe',
      avis: 2.5,
      commentaire: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    ),
    // Ajoutez d'autres avis et commentaires ici
  ],
  estAbonnee: true,
  monAvis: [],
);

Entreprise entreprise2 = Entreprise(
  id: 2,
  imageProfile: 'assets/images/profile_8.png',
  imageEntreprise: 'assets/images/entreprise.png',
  nom: 'Entreprise 2',
  // coordonneesGPS: CoordonneesGPS(latitude: 987.654, longitude: 321.012),
  categories: [
    Categorie(
      id: 1,
      nom: 'Catégorie 1',
      image: 'assets/images/COD.png',
      produits: [
        Produit(
          id: 1,
          nom: 'Produit 1',
          images: ['assets/images/GTA2.png', 'assets/images/GTA3.png'],
          description: 'Description du produit 1',
          estFavori: true,
          prix: 14.99,
          entreprise: entreprise1,
        ),
        Produit(
          id: 2,
          nom: 'Produit 2',
          images: ['assets/images/COD2.png', 'assets/images/COD3.png'],
          description: 'Description du produit 2',
          estFavori: false,
          prix: 24.99,
          entreprise: entreprise1,
        ),
      ],
    ),
    // Ajoutez d'autres catégories ici
  ],
  description: 'Description de l\'entreprise 2',
  siteWeb: 'www.entreprise2.com',
  reseauxSocio: [
    ReseauxSocio(
      id: 1,
      lien: '',
    ),
    ReseauxSocio(
      id: 2,
      lien: '',
    ),
    ReseauxSocio(
      id: 3,
      lien: '',
    ),
  ],
  avisCommentaires: [
    Avis_Commentaire(
      id: 1,
      imageDestinataire: 'assets/images/avatar2.png',
      nomDestinataire: 'Jane Smith',
      avis: 4.5,
      commentaire: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    ),
    // Ajoutez d'autres avis et commentaires ici
  ],
  estAbonnee: false,
  monAvis: [],
);

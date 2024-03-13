import 'package:flutter/material.dart';
import 'package:jj_vr/constants.dart';

class Commentaire extends StatelessWidget {
  final List<Comment> commentaires = [
    Comment(
      nom: 'John Doe',
      photo: 'assets/images/profile1.png',
      avis: 4.5,
      commentaire: 'Excellent service !',
    ),
    // Ajoutez d'autres commentaires ici
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(19 * fem, 0, 0, 35.64 * fem),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(3 * fem, 0, 0, 14 * fem),
            child: Text(
              'Avis et Commentaire : ',
              style: TextStyle(
                fontSize: 24 * fem * 0.97,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          if (commentaires.isNotEmpty)
            Column(
              mainAxisSize: MainAxisSize.min,
              children: commentaires.map((commentaire) {
                return Container(
                  margin: EdgeInsets.only(bottom: 14 * fem),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10 * fem),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(commentaire.photo),
                          radius: 20 * fem,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              commentaire.nom,
                              style: TextStyle(
                                fontSize: 16 * fem * 0.97,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4 * fem),
                            Row(
                              children: List.generate(5, (index) {
                                if (index < commentaire.avis.floor()) {
                                  return Icon(
                                    Icons.star,
                                    size: 16 * fem,
                                    color: Colors.amber,
                                  );
                                } else {
                                  return Icon(
                                    Icons.star_border,
                                    size: 16 * fem,
                                    color: Colors.amber,
                                  );
                                }
                              }),
                            ),
                            SizedBox(height: 4 * fem),
                            Text(
                              commentaire.commentaire,
                              style: TextStyle(
                                fontSize: 14 * fem * 0.97,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.visible,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            )
          else
            Text(
              'Vous n\'avez aucun commentaire pour le moment.',
              style: TextStyle(
                fontSize: 30 * fem * 0.97,
                fontWeight: FontWeight.bold,
              ),
            ),
        ],
      ),
    );
  }
}

class Comment {
  final String nom;
  final String photo;
  final double avis;
  final String commentaire;

  Comment({
    required this.nom,
    required this.photo,
    required this.avis,
    required this.commentaire,
  });
}

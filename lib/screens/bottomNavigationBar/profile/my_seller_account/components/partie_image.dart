import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jj_vr/constants.dart';

class PartieImage extends StatefulWidget {
  const PartieImage({Key? key});

  @override
  State<PartieImage> createState() => _PartieImageState();
}

class _PartieImageState extends State<PartieImage> {
  bool isSubscribed = false;
  TextEditingController _textEditingController = TextEditingController();
  String entrepriseName = 'Nom Entreprise';
  File? imageFile1; // Variable pour la première image
  File? imageFile2; // Variable pour la deuxième image
  String locationCoordinates = '';

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 28 * fem),
          width: screenWidth,
          height: 370 * fem,
          child: Stack(
            children: [
              Positioned.fill(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: imageFile1 != null
                          ? Image.file(
                              imageFile1!,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              'assets/images/Profile_Store.png',
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 12 * fem,
                top: 12 * fem,
                child: GestureDetector(
                  onTap: () => _selectImage(
                      1), // Modifier l'appel de la fonction pour la première image
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      size: 30 * fem,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 22 * fem,
                top: 232 * fem,
                child: SizedBox(
                  width: 120.85 * fem,
                  height: 120 * fem,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(141 * fem),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(141 * fem),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: imageFile2 != null
                                ? CircleAvatar(
                                    radius: 141 * fem,
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: FileImage(imageFile2!),
                                  )
                                : Image.asset(
                                    'assets/images/icon-profile-circle.png',
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 10 * fem,
                        bottom: 10 * fem,
                        child: GestureDetector(
                          onTap: () => _selectImage(2),
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.camera_alt,
                              size: 24 * fem,
                              color: Colors.black.withOpacity(0.7),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 169 * fem,
                top: 250 * fem,
                child: SizedBox(
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      entrepriseName,
                      style: TextStyle(
                        fontSize: 25 * ffem,
                        fontWeight: FontWeight.w900,
                        height: 1.3175 * ffem,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 360 * fem,
                top: 225 * fem,
                child: SizedBox(
                  child: GestureDetector(
                    onTap: () {},
                    child: IconButton(
                      onPressed: _showEditDialog,
                      icon: Icon(
                        Icons.create,
                        size: 30,
                        color: kTextColor,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 360 * fem,
                top: 300 * fem,
                child: SizedBox(
                  child: GestureDetector(
                    onTap: () {
                      _getCurrentLocation();
                      _showLocationDialog(context);
                    },
                    child: Icon(
                      Icons.location_on,
                      size: 30,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _selectImage(int imageNumber) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File selectedImageFile = File(pickedFile.path);

      setState(() {
        if (imageNumber == 1) {
          imageFile1 = selectedImageFile;
        } else if (imageNumber == 2) {
          imageFile2 = selectedImageFile;
        }
      });
    }
  }

  void _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        locationCoordinates =
            'Latitude: ${position.latitude}, Longitude: ${position.longitude}';
      });
    } catch (e) {
      print('Erreur lors de la récupération de la position : $e');
      setState(() {
        locationCoordinates = 'Erreur lors de la récupération de la position';
      });
    }
  }

  void _showLocationDialog(BuildContext context) {
    TextEditingController latitudeController = TextEditingController();
    TextEditingController longitudeController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Coordonnées de localisation'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  controller: latitudeController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Latitude',
                  ),
                ),
              ),
              TextField(
                controller: longitudeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Longitude',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                String latitude = latitudeController.text;
                String longitude = longitudeController.text;

                setState(() {
                  locationCoordinates =
                      'Latitude: $latitude, Longitude: $longitude';
                });

                Navigator.of(context).pop();
              },
              child: Text('Enregistrer'),
            ),
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
  }

  Future<void> _showEditDialog() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Modifier le nom de l\'entreprise',
            style: TextStyle(fontSize: 20),
          ),
          content: TextField(
            controller: _textEditingController,
            decoration: InputDecoration(hintText: 'Nouveau nom'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  entrepriseName = _textEditingController.text;
                });
                Navigator.of(context).pop();
              },
              child: Text(
                'Enregistrer',
                style: TextStyle(fontSize: 16),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Annuler',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:jj_vr/constants.dart';

class PartieSocio extends StatefulWidget {
  const PartieSocio({Key? key});

  @override
  _PartieSocioState createState() => _PartieSocioState();
}

class _PartieSocioState extends State<PartieSocio> {
  TextEditingController instagramController = TextEditingController();
  TextEditingController facebookController = TextEditingController();
  TextEditingController linkedinController = TextEditingController();

  List<String> socialMediaLinks = [];

  void updateLink(String link, TextEditingController controller) {
    controller.text = link;
    setState(() {});
  }

  Future<void> launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> showEditDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Links'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildLinkTextField(
                  FontAwesomeIcons.instagram,
                  'Instagram',
                  instagramController,
                ),
                buildLinkTextField(
                  FontAwesomeIcons.facebook,
                  'Facebook',
                  facebookController,
                ),
                buildLinkTextField(
                  FontAwesomeIcons.linkedin,
                  'LinkedIn',
                  linkedinController,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                saveLinks();
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void saveLinks() {
    socialMediaLinks.clear();
    if (instagramController.text.isNotEmpty) {
      socialMediaLinks.add(instagramController.text);
    }
    if (facebookController.text.isNotEmpty) {
      socialMediaLinks.add(facebookController.text);
    }
    if (linkedinController.text.isNotEmpty) {
      socialMediaLinks.add(linkedinController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(19 * fem, 0 * fem, 0 * fem, 35.64 * fem),
      // width: 317 * fem,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Socio : ',
                style: TextStyle(
                  fontSize: 24 * ffem,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {
                  showEditDialog(context);
                },
                icon: Icon(Icons.edit),
                color: Colors.black,
              ),
            ],
          ),
          SizedBox(height: 14 * fem),
          Container(
            width: double.infinity,
            height: 65.36 * fem,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: buildSocialIcons(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildSocialIcons() {
    List<Widget> icons = [];
    for (int i = 0; i < socialMediaLinks.length; i++) {
      IconData icon;
      String ellipse;
      switch (i) {
        case 0:
          icon = FontAwesomeIcons.instagram;
          ellipse = 'assets/images/ellipse-5-Kvc.png';
          break;
        case 1:
          icon = FontAwesomeIcons.facebook;
          ellipse = 'assets/images/ellipse-5-W2Y.png';
          break;
        case 2:
          icon = FontAwesomeIcons.linkedin;
          ellipse = 'assets/images/ellipse-5.png';
          break;
        default:
          icon = FontAwesomeIcons.circle;
          ellipse = '';
      }
      icons.add(buildSocialIcon(icon, ellipse, socialMediaLinks[i]));
      if (i < socialMediaLinks.length - 1) {
        icons.add(SizedBox(width: 20 * fem));
      }
    }
    return icons;
  }

  Widget buildSocialIcon(IconData icon, String ellipse, String link) {
    return GestureDetector(
      onTap: () {
        if (link.isNotEmpty) {
          launchURL(link);
        }
      },
      child: Container(
        width: 65.36 * fem,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8 * fem),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(ellipse),
          ),
        ),
        child: Center(
          child: FaIcon(
            icon,
            size: 26.67 * fem,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget buildLinkTextField(
      IconData icon, String labelText, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8 * fem),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: FaIcon(icon),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

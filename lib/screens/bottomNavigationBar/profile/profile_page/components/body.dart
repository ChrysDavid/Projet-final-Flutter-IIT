import 'package:flutter/material.dart';
import 'package:jj_vr/screens/bottomNavigationBar/home/notification/notification_screen.dart';
import 'package:jj_vr/screens/bottomNavigationBar/profile/my_seller_account/my_seller_account.dart';
import 'package:jj_vr/screens/bottomNavigationBar/profile/my_user_account/my_user_account.dart';
import 'package:jj_vr/screens/bottomNavigationBar/profile/settings/settings_screen.dart';
import 'package:jj_vr/screens/inscription/sign_in/sign_in_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  final Uri _url = Uri.parse('https://flutter.dev');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          Text(
            'Chrys David',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My seller account",
            icon: "assets/icons/store.svg",
            press: () =>
                Navigator.pushNamed(context, MySellerAccountScreen.routeName),
          ),
          ProfileMenu(
            text: "My user account",
            icon: "assets/icons/User Icon.svg",
            press: () =>
                Navigator.pushNamed(context, MyUserAccountScreen.routeName),
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () => Navigator.pushNamed(context, NotifScreen.routeName),
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () =>
                Navigator.pushNamed(context, SettingsPageScreen.routeName),
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: _launchUrl,
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () => Navigator.pushNamed(context, SignInScreen.routeName),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _isDarkModeEnabled = false;
  String _selectedLanguage = 'English';

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkModeEnabled = prefs.getBool('darkMode') ?? false;
      _selectedLanguage = prefs.getString('language') ?? 'English';
    });
    _applyTheme();
  }

  Future<void> _savePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('darkMode', _isDarkModeEnabled);
    await prefs.setString('language', _selectedLanguage);
  }

  void _toggleDarkMode(bool value) {
    setState(() {
      _isDarkModeEnabled = value;
    });
    _savePreferences();
    _applyTheme();
  }

  void _changeLanguage(String? language) {
    if (language != null) {
      setState(() {
        _selectedLanguage = language;
      });
      _savePreferences();
      _applyLanguage();
    }
  }

  void _applyTheme() {
    if (_isDarkModeEnabled) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
      ));
      // Appliquer le thème sombre à l'intégralité de votre application
      // Exemple :
      // MyAppTheme.setDarkMode();
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ));
      // Appliquer le thème clair à l'intégralité de votre application
      // Exemple :
      // MyAppTheme.setLightMode();
    }
  }

  void _applyLanguage() {
    // Appliquer la traduction en anglais à l'intégralité de votre application
    // Exemple :
    // MyAppLocalization.setLocale(Locale('en'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paramètres'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            'Paramètres de l\'application',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          ListTile(
            title: Text('Mode sombre'),
            subtitle: Text('Activer le mode sombre'),
            trailing: Switch(
              value: _isDarkModeEnabled,
              onChanged: _toggleDarkMode,
            ),
          ),
          ListTile(
            title: Text('Langue'),
            subtitle: Text('Sélectionner la langue'),
            trailing: DropdownButton<String>(
              value: _selectedLanguage,
              items: <String>['English', 'French', 'Spanish', 'German']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: _changeLanguage,
            ),
          ),
        ],
      ),
    );
  }
}

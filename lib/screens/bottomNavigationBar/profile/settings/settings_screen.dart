import 'package:flutter/material.dart';
import '../settings/components/body.dart';

// ignore: must_be_immutable
class SettingsPageScreen extends StatelessWidget {
  const SettingsPageScreen({super.key});
  static String routeName = "/settings";

  @override
  Widget build(BuildContext context) {
    return Body();
  }
}

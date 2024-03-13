import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:jj_vr/constants.dart';

class PartieDescription extends StatefulWidget {
  const PartieDescription({Key? key});

  @override
  _PartieDescriptionState createState() => _PartieDescriptionState();
}

class _PartieDescriptionState extends State<PartieDescription> {
  late TextEditingController inputController;
  late TextEditingController formattedController;
  bool isBold = false;
  bool isUnderlined = false;
  Color selectedColor = Colors.black;
  double fontSize = 15.0;

  @override
  void initState() {
    super.initState();
    inputController = TextEditingController();
    formattedController = TextEditingController();
  }

  @override
  void dispose() {
    inputController.dispose();
    formattedController.dispose();
    super.dispose();
  }

  void updateDescription(String value) {
    formattedController.text = value;
    setState(() {});
  }

  void showColorPickerDialog() {
    showDialog(
      context: context,
      builder: (context) {
        Color pickerColor = selectedColor;

        return AlertDialog(
          title: Text('Sélectionner une couleur'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: pickerColor,
              onColorChanged: (color) {
                pickerColor = color;
              },
            ),
          ),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                setState(() {
                  selectedColor = pickerColor;
                  Navigator.of(context).pop();
                  updateDescription(inputController.text);
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(22 * fem, 0 * fem, 0 * fem, 15 * fem),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 13 * fem),
            child: Text(
              'Description : ',
              style: TextStyle(
                fontSize: 24 * ffem,
                fontWeight: FontWeight.w500,
                height: 1.2575 * ffem / fem,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 352 * fem),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.format_bold),
                      onPressed: () {
                        setState(() {
                          isBold = !isBold;
                          updateDescription(inputController.text);
                        });
                      },
                      color: isBold ? Colors.blue : Colors.grey,
                    ),
                    IconButton(
                      icon: Icon(Icons.format_underlined),
                      onPressed: () {
                        setState(() {
                          isUnderlined = !isUnderlined;
                          updateDescription(inputController.text);
                        });
                      },
                      color: isUnderlined ? Colors.blue : Colors.grey,
                    ),
                    IconButton(
                      icon: Icon(Icons.format_color_text),
                      onPressed: showColorPickerDialog,
                      color: selectedColor,
                    ),
                    IconButton(
                      icon: Icon(Icons.format_size),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Sélectionner la taille du texte'),
                              content: Slider(
                                value: fontSize,
                                min: 15.0,
                                max: 30.0,
                                onChanged: (value) {
                                  setState(() {
                                    fontSize = value;
                                    updateDescription(inputController.text);
                                  });
                                },
                              ),
                            );
                          },
                        );
                      },
                      color: Colors.grey,
                    ),
                  ],
                ),
                TextFormField(
                  controller: formattedController,
                  onChanged: (value) {
                    updateDescription(value);
                  },
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                    decoration: isUnderlined
                        ? TextDecoration.underline
                        : TextDecoration.none,
                    color: selectedColor,
                  ),
                  // readOnly: true,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Saisir la description',
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

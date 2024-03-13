import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jj_vr/constants.dart';
import 'package:jj_vr/models/Product.dart';
import 'package:jj_vr/size_config.dart';

class CreateProduct extends StatefulWidget {
  final Product? product;
  final Function(Product) onDelete;

  const CreateProduct({Key? key, this.product, required this.onDelete})
      : super(key: key);

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  late List<Product> selected;
  int? selectedIndex;
  List<String> selectedImagePaths = [];
  String productName = '';
  double productPrice = 0;

  @override
  void initState() {
    super.initState();
    selected = Product.getSelectProduct();

    if (widget.product != null) {
      // Pré-remplir les détails du produit existant
      productName = widget.product!.title;
      productPrice = widget.product!.price;
      selectedImagePaths = widget.product!.images.toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: AppBar(
          title: Text('Create Product'),
        ),
      ),
      body: ListView(
        children: [
          buildAddImage(),
          buildProductNameRow(word: 'Nom'),
          buildProductNameRow(word: 'Prix'),
          EditDescription(),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    widget.onDelete(widget
                        .product!); // Appeler le callback pour supprimer le produit
                    Navigator.pop(context); // Supprimer la page en cours
                  },
                  child: Text(
                    'Supprimer',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(kPrimaryColor),
                  ),
                  onPressed: () {
                    final createdProduct = Product(
                      id: 1, // Assign a unique ID to the product
                      title: productName,
                      price: productPrice,
                      images: selectedImagePaths,
                      colors: [],
                      description: '',
                      // Add other properties here
                    );
                    Navigator.pop(context, createdProduct);
                  },
                  child: Text(
                    'Enregistrer',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _openGallery() async {
    final picker = ImagePicker();
    final pickedImages = await picker.pickMultiImage(
      imageQuality: 6 - selectedImagePaths.length,
    );
    if (pickedImages.isNotEmpty) {
      setState(() {
        selectedImagePaths
            .addAll(pickedImages.map((image) => image.path).toList());
        selected = Product.getSelectProduct().toList();
        selectedIndex = selectedImagePaths.length - 1; // Update selectedIndex
      });
    }
  }

  Widget buildAddImage() {
    return Container(
      height: 275,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (selectedImagePaths.isEmpty)
                Container(
                  margin: EdgeInsets.all(8),
                  width: getProportionateScreenWidth(48),
                  height: getProportionateScreenWidth(48),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: kPrimaryColor.withOpacity(0.12),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Add Image',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ...List.generate(
                selectedImagePaths.length < 6
                    ? selectedImagePaths.length + 1
                    : 6,
                (index) {
                  if (index == selectedImagePaths.length) {
                    return GestureDetector(
                      onTap: _openGallery,
                      child: Container(
                        margin: EdgeInsets.all(8),
                        width: getProportionateScreenWidth(48),
                        height: getProportionateScreenWidth(48),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: kPrimaryColor.withOpacity(0.12),
                          ),
                        ),
                        child: Icon(
                          Icons.add,
                          color: kPrimaryColor,
                        ),
                      ),
                    );
                  } else {
                    return buildSmallProductPreview(index);
                  }
                },
              ),
            ],
          ),
          if (selectedImagePaths.isNotEmpty &&
              selectedIndex != null &&
              selectedIndex! < selectedImagePaths.length)
            Column(
              children: [
                SizedBox(
                  width: getProportionateScreenWidth(238),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Hero(
                      tag: selected[selectedIndex!].id,
                      child: Image.file(
                        File(selectedImagePaths[selectedIndex!]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        if (index < selectedImagePaths.length) {
          setState(() {
            selectedIndex = index;
          });
        }
      },
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
          color: selectedIndex == index ? kPrimaryColor : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: kPrimaryColor.withOpacity(0.12),
          ),
        ),
        child: Image.file(
          File(selectedImagePaths[index]),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget buildProductNameRow({required String word}) {
    late String initialValue;

    if (word == 'Nom') {
      initialValue = productName;
    } else if (word == 'Prix') {
      initialValue = productPrice.toString();
    } else {
      initialValue = '';
    }

    return ProductNameRow(
      initialName: initialValue,
      labelText: word,
      onNameChanged: (newValue) {
        setState(() {
          if (word == 'Nom') {
            productName = newValue;
          } else if (word == 'Prix') {
            final parsedPrice = double.tryParse(newValue);
            if (parsedPrice != null) {
              productPrice = parsedPrice;
            } else {
              productPrice = 0;
            }
          }
        });
      },
    );
  }
}

class ProductNameRow extends StatefulWidget {
  final String initialName;
  final String labelText;
  final void Function(String) onNameChanged;

  const ProductNameRow({
    Key? key,
    required this.initialName,
    required this.labelText,
    required this.onNameChanged,
  }) : super(key: key);

  @override
  _ProductNameRowState createState() => _ProductNameRowState();
}

class _ProductNameRowState extends State<ProductNameRow> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.initialName);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Text(
            '${widget.labelText} du Produit : ',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20, 3, 20, 3),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  _textEditingController.text,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(
                        'Edit ${widget.labelText}',
                      ),
                      content: TextField(
                        controller: _textEditingController,
                        keyboardType: widget.labelText == 'Prix'
                            ? TextInputType.number
                            : null,
                        decoration: InputDecoration(
                          labelText: widget.labelText,
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            widget.onNameChanged(_textEditingController.text);
                            Navigator.pop(context);
                          },
                          child: Text('Save'),
                        ),
                      ],
                    ),
                  );
                },
                icon: Icon(Icons.edit),
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}

class EditDescription extends StatefulWidget {
  const EditDescription({Key? key});

  @override
  _EditDescriptionState createState() => _EditDescriptionState();
}

class _EditDescriptionState extends State<EditDescription> {
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
      margin: EdgeInsets.fromLTRB(22, 0, 0, 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 13),
            child: Text(
              'Description : ',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 352),
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

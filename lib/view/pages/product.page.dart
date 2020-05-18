import 'dart:io';

import 'package:app_restaurant_test/controller/products.controller.dart';
import 'package:app_restaurant_test/model/product.model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class ProductPage extends StatefulWidget {
  ProductPage({Key key, this.product, this.icons, this.select})
      : super(key: key);

  final Product product;
  final Map icons;
  final String select;

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final _nameController = TextEditingController();

  final _controller = ProductsController();

  final _descriptionController = TextEditingController();

  final _priceController = TextEditingController();
  String _nameCatch;
  String _descriptionCatch;
  String _priceCatch;

  void _setData() {
    if (_nameCatch != '' && _descriptionCatch != '' && _priceCatch != '') {
      widget.product.name = _nameCatch;
      widget.product.decription = _descriptionCatch;
      widget.product.price = _priceCatch;
      widget.product.visible = true;
    }
  }

  void _sendImage(File file) async {
    if (file != null) {
      StorageUploadTask task = FirebaseStorage.instance
          .ref()
          .child('products')
          .child(widget.product.section != ''
              ? widget.product.section
              : 'restaurant')
          .child(
              widget.product.category != '' ? widget.product.category : 'food')
          .child(DateTime.now().millisecondsSinceEpoch.toString())
          .putFile(file);

      StorageTaskSnapshot taskSnapshot = await task.onComplete;
      widget.product.image = await taskSnapshot.ref.getDownloadURL();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.product != null) {
      _nameController.text = widget.product.name;
      _descriptionController.text = widget.product.decription;
      _priceController.text = widget.product.price;
    } else {
      _nameController.text = '';
      _descriptionController.text = '';
      _priceController.text = '';
    }
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Twin's Admin",
          style: TextStyle(
            fontFamily: 'Marguerite',
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(113, 0, 0, 1),
                Color.fromRGBO(187, 98, 98, 1)
              ],
            ),
          ),
        ),
      ),
      body: (widget.product != null)
          ? Center(
              child: Container(
                  height: screenHeight * 0.8,
                  width: screenWidth * 0.95,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(113, 0, 0, 1),
                        Color.fromRGBO(187, 98, 98, 1)
                      ],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 150,
                              width: 200,
                              color: Colors.red,
                              child: SizedBox.expand(
                                child: FlatButton(
                                  onPressed: () async {
                                    final File img =
                                        await ImagePicker.pickImage(
                                      source: ImageSource.gallery,
                                    );
                                    if (img == null) return;
                                    _sendImage(img);
                                  },
                                  child: (widget.select == 'add')
                                      ? Text('Sua image aqui')
                                      : Image.network(widget.product.image),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Colors.white54,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    labelText: 'Nome',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  controller: _nameController,
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(color: Colors.white),
                                  onChanged: (value) {
                                    _nameCatch = value;
                                  },
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  color: Colors.white54),
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    labelText: 'Descricao',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  controller: _descriptionController,
                                  style: TextStyle(color: Colors.white),
                                  textDirection: TextDirection.ltr,
                                  onChanged: (value) {
                                    _descriptionCatch = value;
                                  },
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  color: Colors.white54),
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    labelText: 'Preco',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  controller: _priceController,
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(color: Colors.white),
                                  onChanged: (value) {
                                    _priceCatch = value;
                                  },
                                ),
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Text('Cardapio:'),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            child: Checkbox(
                                              value: (widget.product.section ==
                                                  'restaurant'),
                                              onChanged: (y) {
                                                if (y) {
                                                  setState(
                                                    () {
                                                      widget.product.section =
                                                          'restaurant';
                                                    },
                                                  );
                                                } else {
                                                  setState(
                                                    () {
                                                      widget.product.section =
                                                          'pub';
                                                    },
                                                  );
                                                }
                                              },
                                            ),
                                          ),
                                          Text(
                                            'Restaurante',
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            child: Checkbox(
                                              value: (widget.product.section ==
                                                  'pub'),
                                              onChanged: (y) {
                                                if (y) {
                                                  setState(
                                                    () {
                                                      widget.product.section =
                                                          'pub';
                                                    },
                                                  );
                                                } else {
                                                  setState(
                                                    () {
                                                      widget.product.section =
                                                          'restaurant';
                                                    },
                                                  );
                                                }
                                              },
                                            ),
                                          ),
                                          Text(
                                            'Bar',
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            child: Checkbox(
                                              value: (widget.product.category ==
                                                  'food'),
                                              onChanged: (y) {
                                                if (y) {
                                                  setState(
                                                    () {
                                                      widget.product.category =
                                                          'food';
                                                    },
                                                  );
                                                } else {
                                                  setState(
                                                    () {
                                                      widget.product.category =
                                                          'drink';
                                                    },
                                                  );
                                                }
                                              },
                                            ),
                                          ),
                                          Text(
                                            'Comida',
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            child: Checkbox(
                                              value: (widget.product.category ==
                                                  'drink'),
                                              onChanged: (y) {
                                                if (y) {
                                                  setState(
                                                    () {
                                                      widget.product.category =
                                                          'drink';
                                                    },
                                                  );
                                                } else {
                                                  setState(
                                                    () {
                                                      widget.product.category =
                                                          'food';
                                                    },
                                                  );
                                                }
                                              },
                                            ),
                                          ),
                                          Text(
                                            'Bebida',
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    height: screenHeight * 0.07,
                                    width: screenWidth * 0.4,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(37, 166, 83, 1),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(18),
                                      ),
                                    ),
                                    child: FlatButton(
                                      onPressed: () {
                                        if (widget.select == 'edit') {
                                          _controller.update(widget.product);
                                          Navigator.of(context).pop();
                                        } else {
                                          _setData();
                                          _controller.add(widget.product);
                                          Navigator.of(context).pop();
                                        }
                                      },
                                      child: Row(
                                        children: [
                                          SvgPicture.network(
                                            widget.icons['add'],
                                            width: screenWidth * 0.08,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text('SALVAR'),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: screenHeight * 0.07,
                                    width: screenWidth * 0.4,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(254, 100, 98, 1),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(18),
                                      ),
                                    ),
                                    child: SizedBox.expand(
                                      child: FlatButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Row(
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: SvgPicture.network(
                                                widget.icons['cancel'],
                                                width: screenWidth * 0.08,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'CANCELAR',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )))
          : Container(),
    );
  }
}

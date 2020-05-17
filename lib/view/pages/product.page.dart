import 'package:flutter/material.dart';
import '../../models/product.model.dart';

class ProductPage extends StatefulWidget {
  ProductPage({Key key, this.product}) : super(key: key);

  final Product product;

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final _nameController = TextEditingController();

  final _descriptionController = TextEditingController();

  final _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.product != null) {
      _nameController.text = widget.product.name;
      _descriptionController.text = widget.product.decription;
      _priceController.text = widget.product.price;
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
                  height: screenHeight * 0.65,
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
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          color: Colors.red,
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
                                  labelText: 'Nome',
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  )),
                              controller: _nameController,
                              style: TextStyle(color: Colors.white),
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
                                    fontSize: 20,
                                  )),
                              controller: _descriptionController,
                              style: TextStyle(color: Colors.white),
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
                                    fontSize: 20,
                                  )),
                              controller: _priceController,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                            child: Row(
                          children: [
                            Text('Cardapio'),
                            Column(
                              children: [
                                Checkbox(
                                  value:
                                      (widget.product.section == 'restaurant'),
                                  onChanged: (y) {
                                    if (y) {
                                      setState(
                                        () {
                                          widget.product.section = 'restaurant';
                                        },
                                      );
                                    } else {
                                      setState(
                                        () {
                                          widget.product.section = 'pub';
                                        },
                                      );
                                    }
                                  },
                                )
                              ],
                            ),
                          ],
                        ))
                      ],
                    ),
                  )),
            )
          : Container(),
    );
  }
}

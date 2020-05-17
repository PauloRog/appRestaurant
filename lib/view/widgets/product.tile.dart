import 'package:app_restaurant_test/controller/products.controller.dart';
import 'package:app_restaurant_test/model/product.model.dart';
import 'package:app_restaurant_test/view/pages/product.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductTile extends StatelessWidget {
  ProductTile({Key key, this.product, this.icons}) : super(key: key);

  final Product product;
  final Map icons;
  final ProductsController controller = ProductsController();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8, bottom: 30),
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: (screenWidth - 16) / 3,
                  height: 140,
                  child: Image.network(
                    product.image,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: (screenWidth - 16) / 3,
                  height: 140,
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.name),
                        Text(
                          product.price,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: (screenWidth - 16) / 3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6, right: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FlatButton(
                          onPressed: () {
                            controller.delete(product.id);
                          },
                          child: Row(
                            children: [
                              SvgPicture.network(
                                icons['delete'],
                                width: screenWidth * 0.05,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Excluir')
                            ],
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductPage(
                                  product: product,
                                ),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              SvgPicture.network(
                                icons['edit'],
                                width: screenWidth * 0.05,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Editar'),
                            ],
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            (product.visible)
                                ? product.visible = false
                                : product.visible = true;
                            controller.update(product);
                          },
                          child: Row(
                            children: [
                              SvgPicture.network(
                                (product.visible)
                                    ? icons['visible']
                                    : icons['invisible'],
                                width: screenWidth * 0.05,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                (product.visible) ? 'Ocultar' : 'Exibir',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

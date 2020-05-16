import 'package:app_restaurant_test/store/drop.down.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DropDown extends StatelessWidget {
  final List<String> option = ['OPCOES', 'PRINCIPAIS', 'PORCOES', 'BEBIDAS'];
  final DropDownStore store = DropDownStore();
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return DropdownButton<String>(
          //dropdownColor: Color.fromRGBO(145, 145, 145, 1),
          items: option.map(
            (String e) {
              return DropdownMenuItem<String>(
                value: e,
                child: Text(e),
              );
            },
          ).toList(),
          onChanged: (String item) {
            store.selectOption(item);
          },
          value: store.select,
        );
      },
    );
  }
}

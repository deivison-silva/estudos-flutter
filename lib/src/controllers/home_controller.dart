import 'package:desafio1/src/models/item_model.dart';
import 'package:flutter/material.dart';

class HomeController {
  var lstItem = <ItemModel>[];

  final formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final descriptionEC = TextEditingController();

  void addItem(ItemModel item) {
    lstItem.add(item);
  }

  void removeItem(int index) {
    lstItem.removeAt(index);
  }
}

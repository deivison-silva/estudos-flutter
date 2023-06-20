import 'package:desafio1/src/models/item_model.dart';
import 'package:flutter/material.dart';
import '../../controllers/home_controller.dart';

class AddItemPage extends StatelessWidget {
  final HomeController controller;
  const AddItemPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade300,
        title: const Text('Adicionar item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.nameEC,
                decoration: const InputDecoration(
                  label: Text('Nome'),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'O campo é obrigatório';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                  controller: controller.descriptionEC,
                  decoration: const InputDecoration(
                    label: Text('Descrição'),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'O campo é obrigatório';
                    } else {
                      return null;
                    }
                  }),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (controller.formKey.currentState!.validate()) {
                    controller.addItem(
                      ItemModel(
                        name: controller.nameEC.text,
                        description: controller.descriptionEC.text,
                      ),
                    );
                    controller.nameEC.clear();
                    controller.descriptionEC.clear();
                    Navigator.pop(context);
                  }
                },
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

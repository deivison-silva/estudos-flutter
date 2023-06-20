import 'package:desafio1/src/controllers/home_controller.dart';
import 'package:desafio1/src/modules/home/add_item_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade300,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        title: const Text('Home'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.75,
        child: ListView.builder(
          itemCount: controller.lstItem.length,
          itemBuilder: (_, index) {
            return ListTile(
              title: Text(controller.lstItem[index].name),
              subtitle: Text(controller.lstItem[index].description),
              trailing: IconButton(
                onPressed: () {
                  setState(() {
                    controller.removeItem(index);
                  });
                },
                icon: const Icon(
                  Icons.delete_rounded,
                  color: Colors.red,
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddItemPage(controller: controller),
            ),
          ).then((_) => setState(() {}));
        },
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}

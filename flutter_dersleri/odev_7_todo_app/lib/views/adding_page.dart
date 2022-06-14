import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev_7_todo_app/cubit/adding_page_cubit.dart';

class AddingPage extends StatefulWidget {
  const AddingPage({Key? key}) : super(key: key);

  @override
  State<AddingPage> createState() => _AddingPageState();
}

class _AddingPageState extends State<AddingPage> {

  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Task'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 50.0, left: 50.0),
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: 'Add New Task'
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<AddingPageCubit>().add(controller.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("The new task '${controller.text}' is added"),
                  ),
                );
                Navigator.pop(context);
              },
              child: const Text('Add'),
            )
          ],
        ),
      ),
    );
  }
}

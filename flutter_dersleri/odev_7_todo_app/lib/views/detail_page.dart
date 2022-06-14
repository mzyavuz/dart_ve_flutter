import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev_7_todo_app/cubit/detail_page_cubit.dart';
import 'package:odev_7_todo_app/model/todo.dart';

class ToDoDetailPage extends StatefulWidget {
  final ToDo todo;
  const ToDoDetailPage({Key? key, required this.todo}) : super(key: key);

  @override
  State<ToDoDetailPage> createState() => _ToDoDetailPageState();
}

class _ToDoDetailPageState extends State<ToDoDetailPage> {

  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 50.0),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: widget.todo.yapilacak_ad,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<DetailPageCubit>().update(widget.todo.yapilacak_id, controller.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("The task '${widget.todo.yapilacak_ad}' is changed to '${controller.text}'"),
                  ),
                );
                Navigator.pop(context);
              },
              child: const Text('Update'),
            )
          ],
        ),
      ),
    );
  }
}

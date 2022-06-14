import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev_7_todo_app/cubit/homepage_cubit.dart';
import 'package:odev_7_todo_app/model/todo.dart';
import 'package:odev_7_todo_app/views/adding_page.dart';
import 'package:odev_7_todo_app/views/detail_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isSearching = false;

  var controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<HomepageCubit>().loadTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearching
          ? TextField(
              decoration: const InputDecoration(hintText: 'Search'),
              onChanged: (result) {
                context.read<HomepageCubit>().search(result);
              },
            )
          : const Text('ToDo'),
        actions: [
          isSearching
            ? IconButton(
              onPressed: () {
                setState(() {
                  isSearching = false;
                });
                context.read<HomepageCubit>().loadTodos();
              },
              icon: const Icon(Icons.clear))
            : IconButton(
              onPressed: () {
                setState(() {
                  isSearching = true;
                });
              },
              icon: const Icon(Icons.search)),
        ],
      ),
      body: BlocBuilder<HomepageCubit, List<ToDo>>(
        builder: (context, todoList) {
          if (todoList.isNotEmpty) {
            return ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                var todo = todoList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ToDoDetailPage(todo: todo),))
                        .then((_) {
                      context.read<HomepageCubit>().loadTodos();
                    });
                  },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(todo.yapilacak_ad),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Delete ${todo.yapilacak_ad}?"),
                                action: SnackBarAction(
                                  label: "Yes",
                                  onPressed: () {
                                    context.read<HomepageCubit>().delete(todo.yapilacak_id);
                                  },
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.delete_outline), color: Colors.black45,)
                      ],
                    ),
                  ),
                ),
                );
            },);
          } else {
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AddingPage())).then((_) {
              context.read<HomepageCubit>().loadTodos();
            });
          },
          label: const Text('Add'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:applications/bloc/todolist_bloc.dart';
import 'package:applications/models/TodoListmodel.dart';
import 'package:applications/screens/todo/todolistdetails_screen.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  void initState() {
    todoListBloc.gettodolist(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
        centerTitle: true,
      ),
      body: StreamBuilder<TodoModel>(
        stream: todoListBloc.gettingdata,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;

            if (data != null) {
              var todoList = data.todos;
              if (todoList != null) {
                return ListView.separated(
                  itemCount: todoList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Card(
                        elevation: 3,
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                    list: todoList[index],
                                  ),
                                ));
                          },
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10),
                          title: Text(todoList[index].todo.toString()),
                          titleTextStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                          subtitle: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              todoList[index].completed.toString(),
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: Center(child: Text('nodata')),
                );
              }
            } else {
              return const Center(
                child: Center(child: Text('nodata')),
              );
            }
          }
          {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

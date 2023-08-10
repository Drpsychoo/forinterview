import 'package:applications/models/TodoListmodel.dart';
import 'package:applications/repository/todorepository.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rxdart/rxdart.dart';

class TodoListBloc {
  final TodoListRepository _todolistrepopsitory = TodoListRepository();

  final BehaviorSubject<TodoModel> todo = BehaviorSubject<TodoModel>();

  Future<TodoModel> gettodolist(
    BuildContext context,
  ) async {
    // showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (context) {
    //     return const CustomProgressDialog(
    //       message: 'Fetching Activities',
    //     );
    //   },
    // );
    final response = await _todolistrepopsitory.todoListrepo();

    if (response.error == null) {
      todo.sink.add(response);

      return response;
    } else {
      Fluttertoast.showToast(
        msg: response.error!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return response;
    }
  }

  Future<TodoModel> forpostingdata(
    BuildContext context,
    int id,
    String? title,
  ) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
    final response = await _todolistrepopsitory.forpost(id, title);

    if (response.error == null) {
      todo.sink.add(response);

      return response;
    } else {
      Fluttertoast.showToast(
        msg: response.error!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return response;
    }
  }

  BehaviorSubject<TodoModel> get gettingdata => todo;
}

final todoListBloc = TodoListBloc();

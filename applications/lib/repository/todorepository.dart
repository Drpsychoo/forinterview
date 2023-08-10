import 'package:applications/models/TodoListmodel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class TodoListRepository {
  final dio = Dio();

  Future<TodoModel> todoListrepo() async {
    try {
      Response response = await dio.get(
        'https://dummyjson.com/todos',
      );
      return TodoModel.fromJson(response.data);
    } catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stackTrace: $stacktrace');
      rethrow;
    }
  }

  Future<TodoModel> forpost(
    int id,
    String? title,
  ) async {
    try {
      Response response = await dio.put(
        'https://dummyjson.com/todos/$id',
        data: {
          'completed': title,
        },
      );
      return TodoModel.fromJson(response.data);
    } catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stackTrace: $stacktrace');
      rethrow;
    }
  }
}

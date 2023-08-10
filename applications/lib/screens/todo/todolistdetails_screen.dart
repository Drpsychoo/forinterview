// ignore_for_file: must_be_immutable

import 'package:applications/bloc/todolist_bloc.dart';
import 'package:applications/models/TodoListmodel.dart';
import 'package:applications/screens/custom/cudtomtextfromfield.dart';
import 'package:applications/screens/custom/customelevationButton.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  Todo list;
  DetailsScreen({super.key, required this.list});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  TextEditingController IDcontroller = TextEditingController();
  TextEditingController userIdcontoller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  TextEditingController completecontorller = TextEditingController();
  bool enable = false;
  bool visiable = true;

  @override
  void initState() {
    IDcontroller.text = widget.list.id.toString();
    userIdcontoller.text = widget.list.userId.toString();
    descriptioncontroller.text =
        widget.list.todo ?? TextEditingController().text;
    completecontorller.text = widget.list.completed.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 00,
          horizontal: 15,
        ),
        child: Row(
          children: [
            Expanded(
              child: CustomElevatedButton(
                buttonText: 'Edit',
                onPressed: () {
                  setState(() {
                    enable = true;
                    visiable = false;
                  });
                },
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: CustomElevatedButton(
                buttonText: 'Save',
                onPressed: () {
                  setState(() {
                    todoListBloc.forpostingdata(
                      context,
                      widget.list.id!,
                      completecontorller.text,
                    );
                  });
                },
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 00,
                horizontal: 15,
              ),
              child: CustomTextFormField(
                enabled: false,
                isRequired: true,
                controller: IDcontroller,
                hintText: 'id',
                labelText: 'ID',
                keyboardType: TextInputType.phone,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 00,
                horizontal: 15,
              ),
              child: CustomTextFormField(
                enabled: false,
                isRequired: true,
                controller: userIdcontoller,
                hintText: 'userId',
                labelText: 'UserId',
                keyboardType: TextInputType.phone,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 00,
                horizontal: 15,
              ),
              child: CustomTextFormField(
                enabled: false,
                isRequired: true,
                controller: descriptioncontroller,
                hintText: 'description',
                labelText: 'Description',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 00,
                horizontal: 15,
              ),
              child: CustomTextFormField(
                enabled: enable,
                isRequired: true,
                controller: completecontorller,
                hintText: 'completed status',
                labelText: 'completed status',
              ),
            ),
            Visibility(
              visible: visiable,
              child: const Text(
                "plz click edit to edit the description",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

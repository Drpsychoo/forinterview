import 'package:applications/bloc/todolist_bloc.dart';
import 'package:applications/screens/audiopage_screen.dart';
import 'package:applications/screens/custom/customeNavBar.dart';
import 'package:applications/screens/formpage_screen.dart';
import 'package:applications/screens/todo/homepage_screen.dart';
import 'package:flutter/material.dart';

class NavigationUserScreen extends StatefulWidget {
  const NavigationUserScreen({Key? key}) : super(key: key);

  @override
  _NavigationUserScreenState createState() => _NavigationUserScreenState();
}

int pageIndex = 0;
late int id;

late String token;
late String email;
String name = '';
late String phone;

class _NavigationUserScreenState extends State<NavigationUserScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    pageIndex = 0;
    todoListBloc.gettodolist(context);
    super.initState();
  }

  final pages = [
    const HomePageScreen(),
    const FormPageScreen(),
    const AudiopageScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        color: Colors.white,

        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 126, 126, 126),
            blurStyle: BlurStyle.outer,
            blurRadius: 2,
            spreadRadius: 0.4,
            offset: Offset(0, 0),
          )
        ],
        // color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomNavBarItemCard(
            text: 'Todo',
            secondChild: const Icon(
              Icons.home_outlined,
              size: 18,
            ),
            value: 0,
            groupValue: pageIndex,
            onChanged: <int>(value) => setState(() {
              pageIndex = value!;
              // radiobuttonvaluevehicle = true;
            }),
            child: const Icon(
              Icons.home,
              color: Colors.blue,
              size: 18,
            ),
          ),
          CustomNavBarItemCard(
            text: 'Form',
            secondChild: const Icon(
              Icons.format_align_center_outlined,
              size: 18,
            ),
            value: 1,
            groupValue: pageIndex,
            onChanged: <int>(value) => setState(() {
              pageIndex = value!;
              // radiobuttonvaluevehicle = true;
            }),
            child: const Icon(
              Icons.list_alt,
              color: Colors.blue,
              size: 18,
            ),
          ),
          CustomNavBarItemCard(
            text: 'Music',
            secondChild: const Icon(
              Icons.music_note_outlined,
              size: 18,
            ),
            value: 2,
            groupValue: pageIndex,
            onChanged: <int>(value) => setState(() {
              pageIndex = value!;
              // radiobuttonvaluevehicle = true;
            }),
            child: const Icon(
              Icons.settings,
              color: Colors.blue,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }
}

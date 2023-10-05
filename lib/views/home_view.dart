import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          Spacer(flex: 1),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.home,
                size: 30,
              )),
          Spacer(flex: 2),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.calendar_month,
                size: 30,
              )),
          Spacer(flex: 3),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_none_sharp,
                size: 30,
              )),
          Spacer(flex: 2),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person,
                size: 30,
              )),
          Spacer(flex: 1),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

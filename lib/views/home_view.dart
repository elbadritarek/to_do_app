import 'package:flutter/material.dart';
import 'package:to_do_app/views/widgets/bottom_appbar.dart';

import 'widgets/home_veiw_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: honeViewBody(),
      bottomNavigationBar: bottomAppBar(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

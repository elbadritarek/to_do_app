import 'package:flutter/material.dart';
import 'package:to_do_app/combons.dart';
import 'package:to_do_app/views/widgets/bottom_appbar.dart';
import 'package:to_do_app/views/widgets/custom_text_from_feild.dart';

import 'widgets/home_veiw_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const honeViewBody(),
      bottomNavigationBar: const bottomAppBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kprimary1Colour,
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return customDielog();
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class customDielog extends StatelessWidget {
  const customDielog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Container(
        color: kprimary2Colour,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SizedBox(
          height: 400,
          width: 300,
          child: Column(children: [
            // SizedBox(height: 8),
            Text(
              "New Task",
              style: TextStyle(
                  color: kprimary1Colour,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            coustomTextFeild(hintText: "Title"),
            SizedBox(height: 8),
            coustomTextFeild(
              hintText: "Descrption",
              maxLines: 5,
            ),
            SizedBox(height: 8),
          ]),
        ),
      ),
    );
  }
}

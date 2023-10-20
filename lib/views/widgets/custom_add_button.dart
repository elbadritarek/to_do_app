import 'package:flutter/material.dart';
import 'package:to_do_app/combons.dart';

class CustomAddButton extends StatelessWidget {
  const CustomAddButton({super.key, this.onTap, this.isLoding = false});
  final void Function()? onTap;
  final bool isLoding;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: kprimary1Colour,
        ),
        child: Center(
          child: isLoding
              ? const CircularProgressIndicator(
                  color: Colors.black,
                )
              : const Text(
                  "Add",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ),
        ),
      ),
    );
  }
}

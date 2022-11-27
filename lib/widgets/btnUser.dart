import 'package:flutter/material.dart';

class BtnUser extends StatelessWidget {
  String? text;
  void Function()? onTap;
  BtnUser({Key? key, required this.text, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 54.0, right: 55),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 55,
          decoration:  BoxDecoration(
              color: const Color(0xFFBF3978),
            borderRadius: BorderRadius.circular(50)
          ),
          child:  Center(
            child: Text( text!, style: TextStyle(
              color: Colors.white,
              fontSize: 20
            ),),
          ),
        ),
      ),
    );
  }
}

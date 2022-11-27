import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';

import 'login.dart';

class FirstScreen extends StatefulWidget {
   FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool swip=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const  SizedBox(height: 101,),
          Center(
            child: SizedBox(width: 328, height: 348,
                child: Image.asset("assets/img.png")),
          ),
          Image.asset("assets/img_1.png", width: 286, height: 112,),
          const  SizedBox(height: 32,),

          const Text("Online Radio", style: TextStyle(
            fontSize: 51,
            fontWeight: FontWeight.w400,
            fontFamily: "BebasNeue"

          ),),
          const  SizedBox(height: 88,),

          Container(
            width: 321,
            height: 60,
            decoration: BoxDecoration(
              color:   const Color(0xFFBF3978),
              borderRadius: BorderRadius.circular(50)
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SwipeButton.expand(
                thumb: swip==true?Image.asset("assets/img_2.png"):Image.asset("assets/img_2.png"),
                activeThumbColor: const Color(0xFFBF3978),
                activeTrackColor: const Color(0xFFBF3978),
                onSwipe: () {
                  setState(() {
                    swip==true?swip=false:swip=true;

                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Swiped"),
                      backgroundColor:  Color(0xFFBF3978),
                    ),
                  );
                  Navigator.push(context, MaterialPageRoute(builder:  (context) =>  Login(),));
                },
                child: const Text(
                  "Get started",
                  style: TextStyle(
                    color: Color(0xFFF2F2F2),
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

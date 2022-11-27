import 'package:flutter/material.dart';

import '../widgets/btnUser.dart';
import '../widgets/textField.dart';
import 'login.dart';

class ForgetPassword extends StatelessWidget {
   ForgetPassword({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 90,),
              Image.asset("assets/img_3.png", width: 328,height: 348,),
              const SizedBox(height: 16,),
              Padding(
                padding: const EdgeInsets.only(right: 55),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:const [
                    Text("Recover Password", style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w600
                    ),),
                  ],
                ),
              ),
              const SizedBox(height: 32,),

              TextInputField(
                colorBorder: const Color.fromRGBO(217, 217, 217, 0.5),
                controller: _emailController,
                colorBox: const Color.fromRGBO(217, 217, 217, 0.5),
                colorBorderInput: const Color.fromRGBO(217, 217, 217, 0.5),
                colorBorderFocus: const Color.fromRGBO(217, 217, 217, 0.5),
                keyboardType: TextInputType.emailAddress,
                labelText: "Email",
                icon: Icons.email,
              ),
              const SizedBox(height: 32,),

              BtnUser(text: "Reset"),
              const SizedBox(height: 32,),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:  [
                    const Text("Already have an account?", style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black
                    ),),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                      },
                      child: const Text(" Login", style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFBF3978)
                      ),),
                    ),
                    const SizedBox(width: 52,),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

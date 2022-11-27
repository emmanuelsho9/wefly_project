import 'package:flutter/material.dart';
import 'package:wefly_project/screens/registerUser.dart';

import '../widgets/btnUser.dart';
import '../widgets/textField.dart';
import 'forgetPassword.dart';

class Login extends StatefulWidget {
   Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool visiblity=true;

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
                     Text("Login Now", style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w600
                    ),),
                  ],
                ),
              ),
              const SizedBox(height: 14,),

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
              const SizedBox(height: 13,),

              TextInputField(
                colorBorder: const Color.fromRGBO(217, 217, 217, 0.5),
                controller: _passwordController,
                colorBox: const Color.fromRGBO(217, 217, 217, 0.5),
                colorBorderInput: const Color.fromRGBO(217, 217, 217, 0.5),
                colorBorderFocus: const Color.fromRGBO(217, 217, 217, 0.5),
                obscured: visiblity,
                labelText: "Password",
                icon: visiblity==true? Icons.visibility_off:Icons.visibility,
                onPressed: () {
                  setState(() {
                    visiblity==true?visiblity=false:visiblity=true;

                  });
                },
              ),
              const SizedBox(height: 16,),

              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:  [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPassword(),));
                      },
                      child: const Text("Forget Password?", style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFBF3978)
                      ),),
                    ),
                    const SizedBox(width: 52,),

                  ],
                ),
              ),
              const SizedBox(height: 16,),
              BtnUser(text: "Login"),
              const SizedBox(height: 16,),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:  [
                    const Text("Don`t have an account?", style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black
                    ),),
                    InkWell(
                      onTap: () {
                        //TODO:Register Page
                        Navigator.push(context, MaterialPageRoute(builder: (context) => UserRegister(),));

                      },
                      child: const Text(" Register", style: TextStyle(
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

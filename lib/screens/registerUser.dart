import 'package:flutter/material.dart';
import 'package:wefly_project/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/btnUser.dart';
import '../widgets/textField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRegister extends StatefulWidget {
   UserRegister({Key? key}) : super(key: key);

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();

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
                    Text("Sign Up", style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w600
                    ),),
                  ],
                ),
              ),
              const SizedBox(height: 8,),

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
              const SizedBox(height: 9,),

              TextInputField(
                colorBorder: const Color.fromRGBO(217, 217, 217, 0.5),
                controller: _fullNameController,
                keyboardType: TextInputType.name,
                colorBox: const Color.fromRGBO(217, 217, 217, 0.5),
                colorBorderInput: const Color.fromRGBO(217, 217, 217, 0.5),
                colorBorderFocus: const Color.fromRGBO(217, 217, 217, 0.5),
                labelText: "Full Name",
                icon: Icons.person,
              ),
              const SizedBox(height: 9,),
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

                  });
                },
              ),
              const SizedBox(height: 9,),
              BtnUser(text: "Sign Up", onTap: () async {




                try{
                  if(_emailController.text.isEmpty&&_fullNameController.text.isEmpty&&_passwordController.text.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Enter your details well"),
                        backgroundColor:  Color(0xFFBF3978),
                      ),
                    );
                  }else{
                    var user = FirebaseAuth.instance.currentUser;
                    var userAccount = await FirebaseAuth.instance.createUserWithEmailAndPassword
                      (email: _emailController.text.trim(), password: _passwordController.text.trim());
                    var Detail =await FirebaseFirestore.instance.collection("User Register").doc(user!.email.toString()).set(
                        {
                          "Email":_emailController.text.trim(),
                          "Full Name":_fullNameController.text.trim()
                        });
                  }


                }catch (e){
                  ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(
                      content: Text("$e"),
                      backgroundColor:  Color(0xFFBF3978),
                    ),
                  );

                }









              },),
              const SizedBox(height: 9,),
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

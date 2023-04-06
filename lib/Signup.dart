import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travelzen/utils/button.dart';
import 'package:travelzen/utils/toastmessage.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool passwordInVisible = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/travling.png"))),
              ),
              Container(
                height: 150,
                width: 300,
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Let's get started!",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Fill out a few details to get",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Signed up",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter Email';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: passwordInVisible,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        passwordInVisible != passwordInVisible;
                                      });
                                    },
                                    child: Icon(
                                      passwordInVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                  focusColor: Colors.black,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter Password';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: TextFormField(
                                controller: confirmPasswordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: 'Confirm Password',
                                  focusColor: Colors.black,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Confirm Password';
                                  } else if (value != passwordController.text) {
                                    return 'Match your Password';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        )),
                    CustomButton(
                        title: 'SingUp',
                        loading: loading,
                        onTap: (){
                          //print('hi'); just checking click output
                          if(_formKey.currentState!.validate()){
                            setState(() {
                              loading = true;
                            });
                            _auth.createUserWithEmailAndPassword(
                                email: emailController.text.toString(),
                                password: passwordController.text.toString()
                            ).then((value){
                              Utils().toastMessage(value.user!.email.toString());
                              setState(() {
                                loading = false;
                              });
                            }).onError((error, stackTrace){
                              Utils().toastMessage(error.toString());
                              setState(() {
                                loading = false;
                              });
                            });
                          }
                        }),
                  ],
                ),
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signin');
                      },
                      child: Text("Sign in Here!"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

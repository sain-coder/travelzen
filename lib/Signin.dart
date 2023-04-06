import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travelzen/utils/button.dart';
import 'package:travelzen/utils/toastmessage.dart';

import 'HomeScreens/home.dart';
import 'Signup.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
   final _formKey = GlobalKey<FormState>();
   final emailController = TextEditingController();
   final passwordController = TextEditingController();
   bool passwordInVisible = true;
   final FirebaseAuth _auth = FirebaseAuth.instance;
   bool loading = false;
  @override
  //bool value = false;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(children: [
            Column(
              children: [
                Container(
                  height: 230,
                  width: 350,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/travling.png"))),
                ),
                Text(
                  "Welcome",
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Login Here!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
                          ],
                        ),
                      )),
                  
                 
                  Row(children: [
                    SizedBox(
                      width: 200,
                    ),
                    TextButton(
                        onPressed: () {}, child: Text("Forgot your Password?"))
                  ]),
                ],
              ),
            ),
            CustomButton(
                title: 'Sign In',
                loading: loading,
                onTap: (){
                  if(_formKey.currentState!.validate()){
                    setState(() {
                      loading = true;
                    });
                    _auth.signInWithEmailAndPassword(
                        email: emailController.text.toString(),
                        password: passwordController.text.toString()).then((value){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeDirect()));
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
            SizedBox(
              height: 30,
            ),
            Text("OR"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.email),
                    label: Text("Email"),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(150, 50), backgroundColor: Colors.black)),
                ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.facebook),
                    label: Text("Facebook"),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(150, 50), backgroundColor: Colors.black)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("You don't have an account?"),
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));
                }, child: Text("Signup Here!"))
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

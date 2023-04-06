import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travelzen/utils/toastmessage.dart';

import '../Signin.dart';

class HomeDirect extends StatefulWidget {
  const HomeDirect({super.key});

  @override
  State<HomeDirect> createState() => _HomeDirectState();
}

class _HomeDirectState extends State<HomeDirect> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              onTap: (){
                _auth.signOut().then((value){
                  Utils().toastMessage('singout');
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Signin()));
                }).onError((error, stackTrace){
                  Utils().toastMessage(error.toString());
                });
              },
              leading: Icon(Icons.logout),
              title: Text('Logout'),
            )
          ],
        ),
      ),
      appBar: AppBar(
        shadowColor: Colors.black,
        backgroundColor: Color.fromARGB(255, 3, 87, 155),
        title: Center(child: Text("TravelZone")),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.account_circle_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(200, 3, 87, 140)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 30.0),
          child: Column(
            children: [
              const Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text('Places',style: TextStyle(fontSize: 25.0,color: Colors.white,),),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/spots');
                },
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/shogran.jpg"),
                        fit: BoxFit.cover),
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 16.0,
                          offset: Offset(2.0, 2.0))
                    ],
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(
                        colors: [Colors.indigo, Colors.blueAccent]),
                  ),
                ),
              ),
              const Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text('Restuarants',style: TextStyle(fontSize: 25.0,color: Colors.white,),),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/spots');
                },
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/hotel.png"),
                        fit: BoxFit.cover),
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 16.0,
                          offset: Offset(2.0, 2.0))
                    ],
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(
                        colors: [Colors.indigo, Colors.blueAccent]),
                  ),
                ),
              ),
              const Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text('Vehicles',style: TextStyle(fontSize: 25.0,color: Colors.white,),),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/vehicles');
                },
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/images/cars.png",
                        ),
                        fit: BoxFit.fill),
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 16.0,
                          offset: Offset(2.0, 2.0))
                    ],
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(
                        colors: [Colors.indigo, Colors.blueAccent]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

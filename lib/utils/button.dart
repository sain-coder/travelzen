import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool loading;
  const CustomButton({Key? key,
  required this.title,
    required this.onTap,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50.0,
        width: 150.0,
        padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.all(Radius.circular(5.0))
        ),
        child: Center(
          child:  loading? const CircularProgressIndicator(color: Colors.white,):Text(title,style: TextStyle(fontSize: 20.0),
        )),
      ),
    );
  }
}

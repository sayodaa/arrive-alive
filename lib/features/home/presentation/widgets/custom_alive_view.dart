import 'package:flutter/material.dart';

class CustomAliveView extends StatelessWidget {
  const CustomAliveView({super.key, required this.text,this.color= Colors.black});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 10.0),
      child: Container(
        height: 100,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Center(child: Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: Text(text,style: const TextStyle(color: Colors.white,fontSize: 22),),
        )),
      ),
    );
  }
}

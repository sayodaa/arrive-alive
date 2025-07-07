import 'package:flutter/material.dart';

class SignLine extends StatelessWidget {
  const SignLine({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 1,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text('Or Sign with'),
          ),
          Expanded(
            child: Divider(
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}

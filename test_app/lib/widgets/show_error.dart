import 'package:flutter/material.dart';

class ShowError extends StatelessWidget {
  final String message;

  ShowError(this.message);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset("imgs/warning.png"),
          Text(
            this.message,
            style: TextStyle(fontSize: 18, color: Colors.amberAccent),
          )
        ],
      ),
    );
  }
}

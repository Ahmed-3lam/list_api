import 'package:flutter/material.dart';


class TextContainerWidget extends StatelessWidget {
  final String name;
  final bool isCompleted;
  final bool isOdd;
  const TextContainerWidget({Key? key,required this.name,required this.isCompleted,required this.isOdd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 150,
      margin: EdgeInsets.only(left: isOdd ? 60 : 30),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(
                0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Center(
          child: Text(
            name,
            style: TextStyle(color: isCompleted?Colors.orange:Colors.black),
          )),
    );
  }
}

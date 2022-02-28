import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class CurveShapedWidget extends StatelessWidget {
  final bool isOdd;
  final bool isCompleted;

  const CurveShapedWidget(
      {Key? key, required this.isOdd, required this.isCompleted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: isOdd ? Alignment.topLeft : Alignment.centerRight,
      children: [
        if (isCompleted)
          Container(
            height: 80,
            width: 300,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.orange, width: 4),
                borderRadius: const BorderRadius.all(Radius.circular(50))),
          ),
        if (!isCompleted)
          Container(
            height: 80,
            width: 300,
            padding: const EdgeInsets.only(left: 8),
            child: DottedBorder(
              borderType: BorderType.RRect,
              color: Colors.grey,
              radius: const Radius.circular(50),
              dashPattern: [8, 4],
              strokeWidth: 4,
              child: const SizedBox(
                height: 60,
                width: 260,
              ),
            ),
          ),
        Container(
          height: 80,
          width: 80,
          color: Colors.white,
        )
      ],
    );
  }
}

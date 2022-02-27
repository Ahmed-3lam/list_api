import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_api/bloc/home_cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(),
        body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
          final cubit = BlocProvider.of<HomeCubit>(context);
          if (state is HomeLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeSuccessState) {
            return ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: state.userList.length,
              itemBuilder: (cx, i) =>

                  Stack(
                clipBehavior: Clip.none,

                // alignment: Alignment.topCenter,
                children: [
                  // Positioned(
                  //   top: 20,
                  //   child: Container(
                  //     height: 80,
                  //     width: 300,
                  //     decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         border: Border(
                  //             left: BorderSide(
                  //                 style: i % 2 == 0
                  //                     ? BorderStyle.none
                  //                     : BorderStyle.solid,
                  //                 color: Colors.orange,
                  //                 width: 5),
                  //             right: BorderSide(
                  //                 style: i % 2 == 1
                  //                     ? BorderStyle.none
                  //                     : BorderStyle.solid,
                  //                 color: Colors.orange,
                  //                 width: 5),
                  //             top: BorderSide(color: Colors.orange, width: 5),
                  //             bottom:
                  //                 BorderSide(color: Colors.orange, width: 5)),
                  //         // border: Border.all(color: Colors.orange, width: 4),
                  //         // borderRadius: BorderRadius.all(Radius.circular(10))
                  //     ),
                  //   ),
                  // ),
                  Positioned(
                    top: 25,
                    child: Stack(
                      alignment: i % 2 == 1
                          ? Alignment.topLeft
                          : Alignment.centerRight,
                      children: [
                        if (i != 8 )
                          Container(
                            height: 80,
                            width: 300,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.orange, width: 4),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                          ),
                        if (i == 8)
                          Container(
                            height: 80,
                            width: 300,
                            padding: EdgeInsets.only(right: 8),
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              color: Colors.grey,
                              radius: Radius.circular(50),
                              dashPattern: [8, 4],
                              strokeWidth: 4,
                              child: Container(
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
                    ),
                  ),
                  Stack(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 50,
                            width: 200,
                            margin: EdgeInsets.only(left: i % 2 == 0 ? 60 : 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Center(
                                child: Text(
                              state.userList[i].name!,
                              style: TextStyle(color: Colors.orange),
                            )),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: i % 2 == 0 ? 60 : 30),
                        width: 200,
                        height: 4,
                        color: Colors.orange,
                      ),
                      Positioned(
                          left: i % 2 == 0 ? 50 : 20,
                          bottom: 12,
                          child: CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.orange,
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          ))
                    ],
                  )
                ],
              ),
              separatorBuilder: (cx, i) =>
                  const Divider(color: Colors.transparent, height: 30),
            );
          } else {
            return const Center(child: Text("Error"));
          }
        }));
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xffffffff).withOpacity(1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(Rect.fromLTWH(0, 0, size.width, size.height),
            bottomRight: Radius.circular(size.width * 0.1649485),
            bottomLeft: Radius.circular(size.width * 0.1649485),
            topLeft: Radius.circular(size.width * 0.1649485),
            topRight: Radius.circular(size.width * 0.1649485)),
        paint_0_fill);

    Paint paint_1_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01030928;
    paint_1_stroke.color = Color(0xfff90c0c).withOpacity(1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.005154639, size.height * 0.01562500,
                size.width * 0.9896907, size.height * 0.9687500),
            bottomRight: Radius.circular(size.width * 0.1597938),
            bottomLeft: Radius.circular(size.width * 0.1597938),
            topLeft: Radius.circular(size.width * 0.1597938),
            topRight: Radius.circular(size.width * 0.1597938)),
        paint_1_stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

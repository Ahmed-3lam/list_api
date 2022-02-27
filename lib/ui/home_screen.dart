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
                        if (i != 9 )
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
                        if (i == 9)
                          Container(
                            height: 80,
                            width: 300,
                            padding: EdgeInsets.only(left: 8),
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


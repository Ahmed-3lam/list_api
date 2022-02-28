import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_api/bloc/home_cubit/home_cubit.dart';
import 'package:list_api/ui/home_Screen/widget/CurveShapedWidget.dart';
import 'package:list_api/ui/home_Screen/widget/TextContainerWidget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
          final cubit = BlocProvider.of<HomeCubit>(context);
          if (state is HomeLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeSuccessState) {
            return ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: state.userList.length,
              itemBuilder: (cx, i) => Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: 25,
                    child: CurveShapedWidget(
                      isOdd: i % 2 == 1,
                      isCompleted: i != 9,
                    ),
                  ),
                  Stack(
                    children: [
                      TextContainerWidget(
                        isCompleted: i != state.userList.length - 1,
                        isOdd: i % 2 == 0,
                        name: state.userList[i].name!,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: i % 2 == 0 ? 60 : 30),
                        width: 150,
                        height: 4,
                        color: i != state.userList.length - 1
                            ? Colors.orange
                            : Colors.grey,
                      ),
                      Positioned(
                          left: i % 2 == 0 ? 50 : 20,
                          bottom: 12,
                          child: CircleAvatar(
                            radius: 12,
                            backgroundColor: i != state.userList.length - 1
                                ? Colors.orange
                                : Colors.grey,
                            child: i != state.userList.length - 1
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  )
                                : const Text(
                                    "?",
                                    style: TextStyle(color: Colors.white),
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

//Copy this CustomPainter code to the Bottom of the File
// class RPSCustomPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//
//     Path path_0 = Path();
//     path_0.moveTo(size.width,size.height*1.739264);
//     path_0.lineTo(size.width*0.3146718,size.height*1.739264);
//     path_0.arcToPoint(Offset(size.width*0.2512548,size.height*1.729104),radius: Radius.elliptical(size.width*0.3169884, size.height*0.5036810),rotation: 0 ,largeArc: false,clockwise: true);
//     path_0.arcToPoint(Offset(size.width*0.1387355,size.height*1.653871),radius: Radius.elliptical(size.width*0.3129479, size.height*0.4972607),rotation: 0 ,largeArc: false,clockwise: true);
//     path_0.arcToPoint(Offset(size.width*0.02472780,size.height*1.433887),radius: Radius.elliptical(size.width*0.3155888, size.height*0.5014571),rotation: 0 ,largeArc: false,clockwise: true);
//     path_0.arcToPoint(Offset(size.width*0.006388031,size.height*1.340021),radius: Radius.elliptical(size.width*0.3130772, size.height*0.4974663),rotation: 0 ,largeArc: false,clockwise: true);
//     path_0.arcToPoint(Offset(size.width*0.006388031,size.height*1.138488),radius: Radius.elliptical(size.width*0.3177490, size.height*0.5048896),rotation: 0 ,largeArc: false,clockwise: true);
//     path_0.arcToPoint(Offset(size.width*0.05373552,size.height*0.9596994),radius: Radius.elliptical(size.width*0.3129498, size.height*0.4972638),rotation: 0 ,largeArc: false,clockwise: true);
//     path_0.arcToPoint(Offset(size.width*0.1921873,size.height*0.7785583),radius: Radius.elliptical(size.width*0.3155907, size.height*0.5014601),rotation: 0 ,largeArc: false,clockwise: true);
//     path_0.arcToPoint(Offset(size.width*0.2512606,size.height*0.7494172),radius: Radius.elliptical(size.width*0.3130811, size.height*0.4974724),rotation: 0 ,largeArc: false,clockwise: true);
//     path_0.arcToPoint(Offset(size.width*0.3146718,size.height*0.7392638),radius: Radius.elliptical(size.width*0.3170019, size.height*0.5037025),rotation: 0 ,largeArc: false,clockwise: true);
//     path_0.lineTo(size.width*0.5289575,size.height*0.7392638);
//     path_0.lineTo(size.width*0.5289575,size.height*0.8006135);
//     path_0.lineTo(size.width*0.3146718,size.height*0.8006135);
//     path_0.cubicTo(size.width*0.1624498,size.height*0.8006135,size.width*0.03861004,size.height*0.9973926,size.width*0.03861004,size.height*1.239264);
//     path_0.cubicTo(size.width*0.03861004,size.height*1.481135,size.width*0.1624517,size.height*1.677914,size.width*0.3146718,size.height*1.677914);
//     path_0.lineTo(size.width,size.height*1.677914);
//     path_0.lineTo(size.width,size.height*1.739264);
//     path_0.lineTo(size.width,size.height*1.739264);
//     path_0.close();
//
//     Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
//     paint_0_fill.color = Color(0xffff8206).withOpacity(1.0);
//     canvas.drawPath(path_0,paint_0_fill);
//
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }

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

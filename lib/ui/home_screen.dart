import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_api/bloc/home_cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
          final cubit = BlocProvider.of<HomeCubit>(context);
          if (state is HomeLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeSuccessState){

            return ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: state.userList.length,
              itemBuilder: (cx, i) => Text(state.userList[i].name!),
              separatorBuilder: (cx, i) => const Divider(),
            );

          }

          else {

            return const Center(child: Text("Error"));
          }
        }));
  }
}

import 'package:catbreeds/src/presentation/cubits/cat_cubit.dart';
import 'package:catbreeds/src/presentation/widgets/breeds_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final catCubit = context.read<CatCubit>();
    catCubit.getBreeds();
    print("catbreeds view");
    return Scaffold(
      appBar: AppBar(title: Text("CatsBreeds"),centerTitle: true,),
      body: Column(
        children: [
          Text("CatsBreeds"),
          BreedsWidget()
        ],
      ),
    );
  }
}

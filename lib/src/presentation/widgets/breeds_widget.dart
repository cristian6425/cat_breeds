import 'package:catbreeds/src/data/models/breed_model.dart';
import 'package:catbreeds/src/presentation/cubits/cat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreedsWidget extends StatelessWidget {
  const BreedsWidget({super.key});

  @override
  Widget build(BuildContext context) {
  return BlocBuilder<CatCubit,CatState>(builder: (context,state){
      if (state.state.isLoading){
        return const CircularProgressIndicator();
      }
      return Flexible(
        child: ListView.builder(
          itemCount: state.breeds.length,
          itemBuilder: (BuildContext context, int index) {

            return card(state.breeds[index]);
          },
        ),
      );
    },); 
  }

  Widget card(BreedModel breed){
    return Card(
      margin: EdgeInsets.all(8),

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(breed.name),
                Text("Mas.."),
              ],
            ),
            Image.network(breed.urlImage, width: 200,height: 200,cacheHeight: 200,cacheWidth: 200,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(breed.origin),
                Text("Inteligencia ${breed.intelligence.toString()}"),
              ],
            ),
          ],
        ),
      ),
    );
  }

}

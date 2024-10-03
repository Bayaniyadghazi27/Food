import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nnn/Blocs/recipe/recipe_bloc.dart';

class Recipedetails extends StatelessWidget {
  final String? namerecipe;
  const Recipedetails({super.key, required this.namerecipe});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RecipeBloc()..add(getRecipeone(name: namerecipe)),
        child: Scaffold(
            appBar: AppBar(
              title: Text(namerecipe!),
            ),
            body:
                BlocBuilder<RecipeBloc, RecipeState>(builder: (context, state) {
              if (state is RecipeLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is recipeoneSuccees) {
                return SingleChildScrollView(
                  child: Column(children: [
                    Container(
                        height: 170,
                        width: double.infinity,
                        child: Image.network(state.recipeone.image!)),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 233, 175, 89),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '${state.recipeone.fullPrice.toString()}\$',
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      state.recipeone.description!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 233, 175, 89),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Ingredients',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          SizedBox(height: 10),
                          Container(
                            height: MediaQuery.of(context).size.height *
                                0.6, // تعيين ارتفاع ثابت للـ ListView
                            child: ListView.builder(
                              itemCount: state.recipeone.ingredients!.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  elevation: 3,
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: ListTile(
                                    title: Text(
                                        state.recipeone.ingredients![index]),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
                );
              } else {
                return Center(
                  child: Text('$state.message'),
                );
              }
            })));
  }
}

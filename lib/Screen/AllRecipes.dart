import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nnn/Blocs/recipe/recipe_bloc.dart';
import 'package:nnn/Screen/recipedetails.dart';

class Cartscreen extends StatelessWidget {
  final String? name;

  Cartscreen({required this.name});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RecipeBloc()..add(Getrecipe(name: name)),
        child: Scaffold(
          appBar: AppBar(
            title: Text('cart'),
          ),
          body: BlocBuilder<RecipeBloc, RecipeState>(builder: (context, state) {
            if (state is RecipeLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is RecipeSuccees) {
              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                      ),
                      itemCount: state.recipe.length,
                      itemBuilder: (context, index) {
                        if (state.recipe[index].kindOfRecipe == name) {
                          print('kind of recipe is : ${state.recipe[index].kindOfRecipe}');
                          print('name of categoriesv :$name');
                        }
                        return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Recipedetails(
                                          namerecipe:
                                              state.recipe[index].name)));
                            },
                            child: Column(
                              children: [
                                Card(
                                  elevation: 4,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8)),
                                      child: Image.network(
                                        state.recipe[index].image!,
                                        fit: BoxFit.cover,
                                        height: 150,
                                      )),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(8),
                                        bottomRight: Radius.circular(8),
                                      )),
                                  width: double.infinity,
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    children: [
                                      Text(
                                        state.recipe[index].name!,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        state.recipe[index].fullPrice
                                            .toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ));
                      }));
            } else {
              return Center(child: Text('$state.message'));
            }
          }),
        ));
  }
}

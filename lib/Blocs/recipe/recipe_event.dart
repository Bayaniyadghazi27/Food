part of 'recipe_bloc.dart';

class RecipeEvent {}

class Getrecipe extends RecipeEvent {
  final String? name;

  Getrecipe({required this.name});

}

class Addrecipe extends RecipeEvent {
  final Recipe recipe;
  Addrecipe({required this.recipe});
}

class getRecipeone extends RecipeEvent {
  final String? name;

  getRecipeone({required this.name});
}

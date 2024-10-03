part of 'recipe_bloc.dart';

class RecipeState {}

final class RecipeInitial extends RecipeState {}

final class RecipeLoading extends RecipeState {}

final class RecipeSuccees extends RecipeState {
  final List<Recipe> recipe;
  RecipeSuccees({required this.recipe});
}

final class RecipeError extends RecipeState {
  final String message;

  RecipeError({required this.message});
}

final class recipeoneSuccees extends RecipeState {
  final Recipe recipeone;

  recipeoneSuccees({required this.recipeone});
}
final class recipeaddedsuccees extends RecipeState{}

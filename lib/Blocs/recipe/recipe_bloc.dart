import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nnn/Model/recipe.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
part 'recipe_event.dart';
part 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  RecipeBloc() : super(RecipeInitial()) {
    on<Addrecipe>((event, emit) async {
      emit(RecipeLoading());
      try {
        await addrecipe(event.recipe);
        emit(recipeaddedsuccees());
      } catch (e) {
        print('adde failed:$e');
        emit(RecipeError(message: e.toString()));
      }
    });

    on<getRecipeone>((event, emit) async {
      emit(RecipeLoading());
      try {
        final List<Recipe> recipes = await getRecipes();
        print('Fetched recipes: $recipes');
        final Recipe recipeone = recipes.firstWhere(
          (rec) => rec.name == event.name,
        );
        emit(recipeoneSuccees(recipeone: recipeone));
      } catch (e) {
        print('Error getting the recipe : $e');
        emit(RecipeError(message: e.toString()));
      }
    });
    on<Getrecipe>((event, emit) async {
      emit(RecipeLoading());

      try {
        final List<Recipe> recipes = await getRecipes();
        print('Fetched recipes: $recipes');
        final filteredRecipes = recipes.where(
          (element) => event.name == element.kindOfRecipe,
        ).toList();
        emit(RecipeSuccees(recipe: filteredRecipes));
      } catch (e) {
        print('Error fetching recipes: $e');

        emit(RecipeError(message: e.toString()));
      }
    });
  }
}

Future<List<Recipe>> getRecipes() async {
  final response = await http.get(Uri.parse(
      'https://foodie-c9305-default-rtdb.firebaseio.com/recipes.json'));
  if (response.statusCode == 200) {
    final data = json.decode(response.body) as Map<String, dynamic>;
    return data.values.map((item) => Recipe.fromJson(item)).toList();
  } else {
    throw Exception('Failed to fetch recipes');
  }
}

Future<void> addrecipe(Recipe recipe) async {
  try {
    final response = await http.post(
      Uri.parse(
          'https://foodie-c9305-default-rtdb.firebaseio.com/recipes.json'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(recipe.toJson()),
    );
    if (response.statusCode == 200) {
      print('Recipe added sucessfully');
    } else {
      print('Failed to add recipe : ${response.body}');
    }
  } catch (e) {
    print('Error occuered : $e');
  }
}

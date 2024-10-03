import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nnn/Blocs/recipe/recipe_bloc.dart';
import 'package:nnn/Model/recipe.dart';

class AddrecipeUI extends StatefulWidget {
  AddrecipeUI({super.key});

  @override
  State<AddrecipeUI> createState() => _AddrecipeUIState();
}

class _AddrecipeUIState extends State<AddrecipeUI> {
  final TextEditingController _nameContoller = TextEditingController();

  final TextEditingController _priceContoller = TextEditingController();

  final TextEditingController _imageContoller = TextEditingController();

  final TextEditingController _descriptionContoller = TextEditingController();

  final TextEditingController _kindrecipeContoller = TextEditingController();

  final TextEditingController _ingredeintController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  final List<String> ingredients = [];

  void _addIngredient() {
    if (_ingredeintController.text.isNotEmpty) {
      setState(() {
        ingredients.add(_ingredeintController.text);
        _ingredeintController.clear();
      });
    }
  }

  void _submitForm(BuildContext context) {
    if (_formkey.currentState!.validate()) {
      print('the name controller : ${_nameContoller.text}');
      final Recipe recipee = Recipe(
          name: _nameContoller.text,
          fullPrice: double.tryParse(_priceContoller.text),
          image: _imageContoller.text,
          ingredients: ingredients,
          kindOfRecipe: _kindrecipeContoller.text,
          description: _descriptionContoller.text);
      print('the name of the recipe : ${recipee.name}');

      BlocProvider.of<RecipeBloc>(context).add(Addrecipe(recipe: recipee));
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add recipe'),
      ),
      body: Form(
        key: _formkey,
        child: Padding(
            padding: EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(children: [
                TextFormField(
                  controller: _nameContoller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a vaalid value';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'add category',
                    labelText: 'name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _priceContoller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a vaalid value';
                    }
                    final price = double.tryParse(value);
                    if (price == null || price < 0) {
                      return 'please enter a valid ';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'price category',
                    labelText: 'Price',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _imageContoller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a vaalid value';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'image category ',
                    labelText: 'Image',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _descriptionContoller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a vaalid value';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'description category',
                    labelText: 'description ',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                    controller: _kindrecipeContoller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a vaalid value';
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.blue),
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.blue),
                      hintText: 'Kind of recipe',
                      labelText: 'kind',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    )),
                SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a vaalid value';
                    }
                    return null;
                  },
                  controller: _ingredeintController,
                ),
                ElevatedButton.icon(
                  onPressed: _addIngredient,
                  label: Icon(
                    Icons.add,
                  ),
                ),
                Wrap(
                    children: ingredients
                        .map((ingredent) => Chip(
                              label: Text(ingredent),
                              onDeleted: () {
                                setState(() {
                                  ingredients.remove(ingredent);
                                });
                              },
                            ))
                        .toList()),
                ElevatedButton(
                  onPressed: () => _submitForm(context),
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(8),
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                )
              ]),
            )),
      ),
    );
  }
}

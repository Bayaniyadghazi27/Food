import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nnn/Blocs/recipe/recipe_bloc.dart';
import 'package:nnn/Screen/h.dart';
import 'package:nnn/Screen/login.dart';
import 'package:nnn/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RecipeBloc>(
      create: (context) => RecipeBloc(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Food App',
          theme: ThemeData(primarySwatch: Colors.orange),
          home: HomePage()),
    );
  }
}

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nnn/Blocs/recipe/recipe_bloc.dart';
import 'package:nnn/Model/recipe.dart';
import 'package:nnn/Screen/Addrecipe.dart';
import 'package:nnn/Screen/favorite.dart';
import 'package:nnn/Screen/home.dart';
import 'package:nnn/Screen/login.dart';
import 'package:nnn/Screen/search.dart';
import 'package:nnn/Screen/setting.dart';
import 'package:nnn/homepage.dart';

class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [App(), Searchitem(), Favorite(), settings()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddrecipeUI()));
      // context.read<RecipeBloc>().add(Addrecipe(recipe:Recipe(name: '', ingredients: [''] )));
        },
        
        tooltip: 'Increment',
        child: Icon(Icons.add),
        backgroundColor: Color.fromRGBO(236, 184, 10, 1),
        foregroundColor: Colors.white,
        mini: true,
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Color.fromARGB(255, 228, 213, 13),
        showInactiveTitle: true,
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        iconSize: 20,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() {
          _currentIndex = index;
        }),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: Colors.black,
            inactiveColor: Colors.white,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.search),
            title: Text('Search', style: TextStyle(color: Colors.black)),
            activeColor: Colors.lightGreen,
            inactiveColor: Colors.white,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favorite', style: TextStyle(color: Colors.black)),
            inactiveColor: Colors.white,
            activeColor: Colors.red,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings', style: TextStyle(color: Colors.black)),
            inactiveColor: Colors.white,
            activeColor: Colors.blue,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

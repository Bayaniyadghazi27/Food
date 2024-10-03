import 'dart:ui';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
//import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
//import 'package:flutter/foundation.dart';
//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nnn/Blocs/itembloc/bloc/item_bloc.dart';
import 'package:nnn/Model/Categories.dart';
import 'package:nnn/Screen/AllRecipes.dart';
import 'package:nnn/Screen/favorite.dart';
import 'package:nnn/Screen/home.dart';
//import 'package:nnn/main.dart';
import 'package:nnn/Screen/search.dart';

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ItemBloc()..add(Getcategories()),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Food Items'),
        ),
        body: BlocBuilder<ItemBloc, ItemState>(
          builder: (context, state) {
            if (state is ItemLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is Itemsuccess) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: state.item.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        print('${state.item[index].name}');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Cartscreen(name: state.item[index].name)),
                        );
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
                                  state.item[index].image!,
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
                            child: Text(
                              state.item[index].name!,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            } else {
              return Center(
                child: Text('$state.message'),
              );
            }
          },
        ),
      ),
    );
  }
}

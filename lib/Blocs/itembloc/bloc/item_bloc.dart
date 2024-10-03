import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:nnn/Model/Categories.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  ItemBloc() : super(ItemInitial()) {
    on<Getcategories>((event, emit) async {
      emit(ItemLoading());

      try {
        final List<foodItem> categories = await getCategories();
        print('Fetched categories: $categories');
        emit(Itemsuccess(item: categories));
      } catch (e) {
        print('Error fetching categories: $e');
        emit(ItemError(errorMessage: e.toString()));
      }
    });
  }
}
Future<List<foodItem>> getCategories() async {
  final response = await http.get(Uri.parse(
      'https://foodie-c9305-default-rtdb.firebaseio.com/categories.json'));
  if (response.statusCode == 200) {
    final data = json.decode(response.body) as Map<String, dynamic>;
    return data.values.map((item) => foodItem.fromJson(item)).toList();
  } else {
    throw Exception('Failed to fetch categories');
  }
}

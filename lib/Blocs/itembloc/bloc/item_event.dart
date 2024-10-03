part of 'item_bloc.dart';

class ItemEvent {}

class Getcategories extends ItemEvent {}

class AddItem extends ItemEvent {
  final foodItem item;
  AddItem({required this.item});
}



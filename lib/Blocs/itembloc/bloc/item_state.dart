part of 'item_bloc.dart';

class ItemState {}

final class ItemInitial extends ItemState {}

final class ItemLoading extends ItemState {}

final class Itemsuccess extends ItemState {
  final List<foodItem> item;
  Itemsuccess({required this.item});
}

final class ItemError extends ItemState {
  final String errorMessage;
  ItemError({required this.errorMessage});
}


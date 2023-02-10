part of 'home_category_bloc.dart';

abstract class HomeCategoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeCategoryEventSelecting extends HomeCategoryEvent {
  final ProductCategory? selectedCategory;

  HomeCategoryEventSelecting(this.selectedCategory);
}

class HomeCategoryEventFetching extends HomeCategoryEvent {}

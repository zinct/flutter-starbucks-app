part of 'home_category_bloc.dart';

enum HomeCategoryStatus { initial, loading, done, failure }

class HomeCategoryState {
  final List<ProductCategory> categories;
  final ProductCategory? selectedCategory;
  final HomeCategoryStatus status;

  HomeCategoryState(
      {this.categories = const [],
      this.selectedCategory,
      this.status = HomeCategoryStatus.initial});

  HomeCategoryState copyWith({
    List<ProductCategory>? categories,
    ProductCategory? selectedCategory,
    HomeCategoryStatus? status,
  }) {
    return HomeCategoryState(
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory,
      status: status ?? this.status,
    );
  }
}

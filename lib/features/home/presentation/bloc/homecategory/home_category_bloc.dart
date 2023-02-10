import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:starbacks/core/usecase/usecase.dart';
import 'package:starbacks/features/product/domain/entities/product.dart';
import 'package:starbacks/features/product/domain/usecases/get_all_category.dart';

part 'home_category_event.dart';
part 'home_category_state.dart';

class HomeCategoryBloc extends Bloc<HomeCategoryEvent, HomeCategoryState> {
  GetAllCategory usecase;

  HomeCategoryBloc({required this.usecase}) : super(HomeCategoryState()) {
    on<HomeCategoryEventFetching>((event, emit) async {
      emit(state.copyWith(status: HomeCategoryStatus.loading));

      var data = await usecase.call(NoParams());

      data.fold((l) {
        emit(state.copyWith(status: HomeCategoryStatus.failure));
      },
          (r) => emit(state.copyWith(
                categories: r,
                selectedCategory: null,
                status: HomeCategoryStatus.done,
              )));
    });

    on<HomeCategoryEventSelecting>((event, emit) {
      emit(state.copyWith(selectedCategory: event.selectedCategory));
    });
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starbacks/features/cart/data/datasource/cart_local_datasource.dart';
import 'package:starbacks/features/cart/data/repositories/cart_repository_v1.dart';
import 'package:starbacks/features/cart/domain/repositories/cart_repository.dart';
import 'package:starbacks/features/cart/domain/usecase/change_quantity_cart.dart';
import 'package:starbacks/features/cart/domain/usecase/create_cart.dart';
import 'package:starbacks/features/cart/domain/usecase/empty_cart.dart';
import 'package:starbacks/features/cart/domain/usecase/get_list_cart.dart';
import 'package:starbacks/features/cart/domain/usecase/remove_cart.dart';
import 'package:starbacks/features/cart/presentation/cubit/cart/cart_cubit.dart';
import 'package:starbacks/features/home/presentation/bloc/homecategory/home_category_bloc.dart';
import 'package:starbacks/features/intro/presentation/cubit/splash/splash_cubit.dart';
import 'package:starbacks/features/product/data/datasource/product_remote_datasource.dart';
import 'package:starbacks/features/product/data/repositories/product_repository_v1.dart';
import 'package:starbacks/features/product/domain/repositories/product_repository.dart';
import 'package:starbacks/features/product/domain/usecases/get_all_category.dart';
import 'package:starbacks/features/product/domain/usecases/get_products.dart';
import 'package:starbacks/features/product/presentation/cubit/productlist/product_list_cubit.dart';

final getIt = GetIt.instance;

void initialize() async {
  // Data sources
  getIt.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceFirebase());
  getIt.registerLazySingleton<CartLocalDataSource>(
      () => CartLocalDataSourceSharedPreference());

  // Repositories
  getIt.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryV1(remoteDataSource: getIt()));
  getIt.registerLazySingleton<CartRepository>(
      () => CartRepositoryV1(localDataSource: getIt()));

  // Usecase - Product
  getIt.registerLazySingleton(() => GetProducts(repository: getIt()));
  getIt.registerLazySingleton(() => GetAllCategory(repository: getIt()));

  // Usecase - Cart
  getIt.registerLazySingleton(() => GetListCart(repository: getIt()));
  getIt.registerLazySingleton(() => CreateCart(repository: getIt()));
  getIt.registerLazySingleton(() => ChangeQuantityCart(repository: getIt()));
  getIt.registerLazySingleton(() => EmptyCart(repository: getIt()));
  getIt.registerLazySingleton(() => RemoveCart(repository: getIt()));

  // Cubit
  getIt.registerFactory(() => SplashCubit());
  getIt.registerFactory(() => ProductListCubit(usecase: getIt()));
  getIt.registerFactory(() => HomeCategoryBloc(usecase: getIt()));
  getIt.registerFactory(() => CartCubit(
        createCartUsecase: getIt(),
        getListCartUsecase: getIt(),
        changeQuantityCart: getIt(),
        emptyCartUsecase: getIt(),
        removeCartUseCase: getIt(),
      ));

  // External
  getIt.registerLazySingleton(() => FirebaseFirestore.instance);
  getIt.registerLazySingletonAsync(() => SharedPreferences.getInstance());
  getIt.registerLazySingleton(() => Logger());
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:starbacks/features/product/data/model/product_categories_model.dart';
import 'package:starbacks/features/product/data/model/product_model.dart';
import 'package:starbacks/features/product/data/model/products_model.dart';
import 'package:starbacks/features/product/domain/entities/product.dart';
import 'package:starbacks/injection_container.dart';

abstract class ProductRemoteDataSource {
  Future<ProductsModel> getProducts(String? name, ProductCategory? category);
  Future<ProductModel> getProduct(String id);
  Future<ProductCategoriesModel> getProductCategories();
}

const String PRODUCT_COLLECTION_NAME = 'products';
const String CATEGORY_COLLECTION_NAME = 'categories';

class ProductRemoteDataSourceFirebase implements ProductRemoteDataSource {
  @override
  Future<ProductsModel> getProducts(
      String? name, ProductCategory? category) async {
    CollectionReference ref =
        getIt<FirebaseFirestore>().collection(PRODUCT_COLLECTION_NAME);

    var collection = await ref.get();
    var data = {
      'data': collection.docs.map((e) {
        return {
          ...e.data() as Map<String, dynamic>,
          ...{'id': e.id}
        };
      }).toList()
    };

    return ProductsModel.fromJson(data);
  }

  @override
  Future<ProductModel> getProduct(String id) async {
    CollectionReference products = throw UnimplementedError();
  }

  @override
  Future<ProductCategoriesModel> getProductCategories() async {
    CollectionReference ref =
        getIt<FirebaseFirestore>().collection(CATEGORY_COLLECTION_NAME);

    var collection = await ref.get();
    var data = {
      'data': collection.docs.map((e) {
        return {
          ...e.data() as Map<String, dynamic>,
          ...{'id': e.id}
        };
      }).toList()
    };

    return ProductCategoriesModel.fromJson(data);
  }
}

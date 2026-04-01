


import '../../../../../../../../core/utils/resource.dart';
import '../../../../../../../navigation_layout/tabs/categories/domain/entities/category.dart';
import '../../../../../../../products/domain/entity/product.dart';

class HomeState {
  late Resource<List<Category>> categoriesApi = Resource.initial();
  late Resource<List<Product>> productsApi = Resource.initial();

  HomeState({required this.categoriesApi, required this.productsApi});

  HomeState.initial() {
    categoriesApi = Resource.initial();
    productsApi = Resource.initial();
  }

  HomeState copyWith({
    Resource<List<Category>>? categoriesApi,
    Resource<List<Product>>? productsApi,
  }) {
    return HomeState(
      categoriesApi: categoriesApi ?? this.categoriesApi,
      productsApi: productsApi ?? this.productsApi,
    );
  }
}

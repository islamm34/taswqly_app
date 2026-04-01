
import '../../../../../../core/utils/api_result.dart';
import '../../../../../network/models/response/category/categories_response.dart';
import '../../../../../network/models/response/products/products_response.dart';

abstract class HomeRemoteDataSource {
  Future<ApiResult<CategoriesResponse>> getCategories();

  Future<ApiResult<ProductsResponse>> getProducts();

  Future<ApiResult<CategoriesResponse>> getSubCategories(String categoryId);
}

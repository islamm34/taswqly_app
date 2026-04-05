
import '../../../../core/utils/api_result.dart';
import '../models/category.dart';
import '../models/product.dart';

abstract class HomeRepo {
  Future<ApiResult<List<Category>>> getCategories();

  Future<ApiResult<List<Product>>> getProducts();

  Future<ApiResult<List<Category>>> getSubCategories(String categoryId);
}

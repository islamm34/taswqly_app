
import '../../../../core/utils/api_result.dart';
import '../../../navigation_layout/tabs/categories/domain/entities/category.dart';
import '../../../products/domain/entity/product.dart';

abstract class HomeRepo {
  Future<ApiResult<List<Category>>> getCategories();

  Future<ApiResult<List<Product>>> getProducts();

  Future<ApiResult<List<Category>>> getSubCategories(String categoryId);
}

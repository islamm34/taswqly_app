import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/utils/api_result.dart';
import '../../../../../core/utils/app_errors.dart';
import '../../../../../core/utils/extensions/connectivity_extension.dart';
import '../../../../navigation_layout/tabs/categories/domain/entities/category.dart';
import '../../../../products/domain/entity/product.dart';
import '../../../domain/repositories/home_repo.dart';
import '../../mappers/category_mapper.dart';
import '../../mappers/product_mapper.dart';
import 'data_sorues/home_remote_data_source.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource _homeRemoteDataSource;
  final Connectivity _connectivity;
  final CategoryMapper _categoryMapper;

  HomeRepoImpl(
    this._homeRemoteDataSource,
    this._connectivity,
    this._categoryMapper,
  );

  Future<ApiResult<List<Category>>> getCategories() async {
    if (await _connectivity.isConnected()) {
      var apiResult = await _homeRemoteDataSource.getCategories();
      if (apiResult.isSuccess) {
        var categoriesResponse = apiResult.getData();
        return SuccessApiResult(
          _categoryMapper.toCategories(categoriesResponse?.categories ?? []),
        );
      } else {
        return ErrorApiResult(apiResult.error);
      }
    } else {
      return ErrorApiResult(NetworkError());
    }
  }

  Future<ApiResult<List<Product>>> getProducts() async {
    if (await _connectivity.isConnected()) {
      var apiResult = await _homeRemoteDataSource.getProducts();
      if (apiResult.isSuccess) {
        var productsResponse = apiResult.getData();
        return SuccessApiResult(
          productsResponse?.products
              ?.map((remoteProduct) => remoteProduct.toProduct())
              .toList(),
        );
      } else {
        return ErrorApiResult(apiResult.error);
      }
    } else {
      return ErrorApiResult(NetworkError());
    }
  }

  Future<ApiResult<List<Category>>> getSubCategories(String categoryId) async {
    if (await _connectivity.isConnected()) {
      var apiResult = await _homeRemoteDataSource.getSubCategories(categoryId);
      if (apiResult.isSuccess) {
        var categoriesResponse = apiResult.getData();
        return SuccessApiResult(
          _categoryMapper.toCategories(categoriesResponse?.categories ?? []),
        );
      } else {
        return ErrorApiResult(apiResult.error);
      }
    } else {
      return ErrorApiResult(NetworkError());
    }
  }
}

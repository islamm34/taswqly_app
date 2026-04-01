import 'package:injectable/injectable.dart';

import '../../../../core/utils/api_result.dart';
import '../../../navigation_layout/tabs/categories/domain/entities/category.dart';
import '../repositories/home_repo.dart';


@injectable
class GetSubCategoriesUseCase {
  final HomeRepo _homeRepo;

  GetSubCategoriesUseCase(this._homeRepo);

  Future<ApiResult<List<Category>>> call(String categoryId) =>
      _homeRepo.getSubCategories(categoryId);
}

import 'package:injectable/injectable.dart';

import '../../../../core/utils/api_result.dart';
import '../../../navigation_layout/tabs/categories/domain/entities/category.dart';
import '../repositories/home_repo.dart';
@injectable
class GetCategoriesUseCase {
  final HomeRepo _homeRepo;

  GetCategoriesUseCase(this._homeRepo);

  Future<ApiResult<List<Category>>> call() => _homeRepo.getCategories();
}

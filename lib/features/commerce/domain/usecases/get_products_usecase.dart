import 'package:injectable/injectable.dart';

import '../../../../core/utils/api_result.dart';
import '../../../products/domain/entity/product.dart';
import '../repositories/home_repo.dart';

@injectable
class GetProductsUseCase {
  final HomeRepo _homeRepo;

  GetProductsUseCase(this._homeRepo);

  Future<ApiResult<List<Product>>> call() => _homeRepo.getProducts();
}

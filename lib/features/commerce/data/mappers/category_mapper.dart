import 'package:injectable/injectable.dart';

import '../../../navigation_layout/tabs/categories/domain/entities/category.dart';
import '../../../network/models/response/category/remote_category.dart';

@injectable
class CategoryMapper {
  Category toCategory(RemoteCategory remoteCategory) {
    return Category(
      id: remoteCategory.id,
      name: remoteCategory.name,
      image: remoteCategory.image,
      categoryId: remoteCategory.categoryId,
    );
  }

  List<Category> toCategories(List<RemoteCategory> categories) {
    return categories.map(toCategory).toList();
  }
}

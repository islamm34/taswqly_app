import '../../../network/models/response/products/remote_product.dart';
import '../../../products/domain/entity/product.dart';

extension RemoteProductMapper on RemoteProduct {
  Product toProduct() {
    return Product(
      id: id,
      title: title,
      availableColors: null,
      brandId: brand?.id,
      categoryId: category?.id,
      description: description,
      imageCover: imageCover,
      images: images,
      price: price!.toInt(),
      priceAfterDiscount: priceAfterDiscount!.toInt(),
      quantity: quantity?.toInt(),
      ratingsAverage: ratingsAverage?.toDouble(),
      ratingsQuantity: ratingsQuantity?.toInt(),
    );
  }
}

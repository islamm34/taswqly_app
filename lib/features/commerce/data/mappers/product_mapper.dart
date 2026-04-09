
import '../../../network/models/response/products/remote_product.dart';
import '../../domain/models/product.dart';

extension RemoteProductMapper on RemoteProduct {
  Product toProduct() {
    return Product(
      id: id,
      title: title,
      ///Missing data from api
      availableColors: [],
      brandId: brand?.id,
      categoryId: category?.id,
      description: description,
      imageCover: imageCover,
      images: images,
      price: price?.toDouble(),
      priceAfterDiscount: priceAfterDiscount?.toDouble(),
      quantity: quantity?.toInt(),
      ratingsAverage: ratingsAverage?.toDouble(),
      ratingsQuantity: ratingsQuantity?.toInt(),
    );
  }
}

import 'package:fruithub_dashboard/features/add_product/domain/entities/add_product_entity.dart';

abstract class ProductsRepo {
  Future<void> addProduct(AddProductEntity product);
}

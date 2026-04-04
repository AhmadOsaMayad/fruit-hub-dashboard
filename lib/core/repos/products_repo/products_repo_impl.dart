import 'package:dartz/dartz.dart';
import 'package:fruithub_dashboard/core/errors/failures.dart';
import 'package:fruithub_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruithub_dashboard/core/services/data_service.dart';
import 'package:fruithub_dashboard/core/utils/back_end_points.dart';
import 'package:fruithub_dashboard/features/add_product/data/models/product_model.dart';
import 'package:fruithub_dashboard/features/add_product/domain/entities/product_entity.dart';

class ProductsRepoImpl implements ProductsRepo {
  final DatabaseService databaseService;
  ProductsRepoImpl({required this.databaseService});
  @override
  Future<Either<Failure, void>> addProduct(ProductEntity product) async {
    try {
      await databaseService.addData(
        data: ProductModel.fromEntity(product).toJson(),
        path: BackEndPoints.addProductsCollection,
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to add product:- ${e.toString()}'));
    }
  }
}

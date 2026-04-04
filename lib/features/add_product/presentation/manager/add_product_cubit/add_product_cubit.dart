import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruithub_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruithub_dashboard/features/add_product/domain/entities/product_entity.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit({required this.productsRepo, required this.imagesRepo})
    : super(AddProductInitial());

  final ProductsRepo productsRepo;
  final ImagesRepo imagesRepo;

  Future<void> addProduct(ProductEntity product) async {
    emit(AddProductLoading());
    var result = await imagesRepo.uploadingImage(product.image);
    result.fold((failure) => emit(AddProductFailure(failure.message)), (
      url,
    ) async {
      product.imageUrl = url;
      var result = await productsRepo.addProduct(product);

      result.fold(
        (failure) => emit(AddProductFailure(failure.message)),
        (_) => emit(AddProductSuccess()),
      );
    });
  }
}

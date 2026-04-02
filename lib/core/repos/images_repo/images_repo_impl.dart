import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruithub_dashboard/core/errors/failures.dart';
import 'package:fruithub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruithub_dashboard/core/services/fire_storage.dart';
import 'package:fruithub_dashboard/core/utils/back_end_points.dart';

class ImagesRepoImpl implements ImagesRepo {
  final FireStorage fireStorage;
  ImagesRepoImpl({required this.fireStorage});
  @override
  Future<Either<Failure, String>> uploadingImage(File image) async {
    try {
      final imageUrl = await fireStorage.uploadImage(
        image,
        BackEndPoints.images,
      );
      return Right(imageUrl);
    } catch (e) {
      return Left(
        ServerFailure('Failed to upload image:- to String:  ${e.toString()}'),
      );
    }
  }
}

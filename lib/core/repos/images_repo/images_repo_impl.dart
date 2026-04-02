import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruithub_dashboard/core/errors/failures.dart';
import 'package:fruithub_dashboard/core/repos/images_repo/images_repo.dart';

class ImagesRepoImpl implements ImagesRepo {
  @override
  Future<Either<Failure, String>> uploadingImage(File image) {
    // TODO: implement uploadingImage
    throw UnimplementedError();
  }
}

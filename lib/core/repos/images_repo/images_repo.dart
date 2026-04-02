import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruithub_dashboard/core/errors/failures.dart';

abstract class ImagesRepo {
  Future<Either<Failure, String>> uploadingImage(File image);
}

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruithub_dashboard/core/services/storage_service.dart';
import 'package:path/path.dart' as b;

class FireStorage implements StorageService {
  final storageReference = FirebaseStorage.instance.ref();
  @override
  Future<String> uploadImage(File file, String path) async {
    try {
      String fileName = b.basename(file.path);
      String extensionName = b.extension(file.path);
      final fileRef = storageReference.child('$path/$fileName.$extensionName');
      // final imageRef = storageReference.child(path);
      final uploadTask = fileRef.putFile(file);
      final snapshot = await uploadTask;
      final downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } on FirebaseException catch (e) {
      throw Exception('Failed to upload image: $e');
    }
  }
}

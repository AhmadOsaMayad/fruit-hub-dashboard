import 'dart:io';
import 'package:fruithub_dashboard/core/utils/back_end_points.dart';
import 'package:path/path.dart' as b;
import 'package:fruithub_dashboard/core/services/storage_service.dart';
import 'package:fruithub_dashboard/core/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService implements StorageService {
  static late Supabase _supabase;
  static late SupabaseStorageClient _storage;

  static Future<void> supabaseInit() async {
    _supabase = await Supabase.initialize(
      url: kSupabaseUrl,
      anonKey: kSupabaseKey!,
    );
    _storage = _supabase.client.storage;
  }

  static Future<bool> isBucketExists(String bucketName) async {
    final response = await _storage.listBuckets();
    return response.any((bucket) => bucket.name == bucketName);
  }

  static Future<void> createBucket(String bucketName) async {
    if (!(await isBucketExists(bucketName))) {
      await _storage.createBucket(bucketName);
    }
  }

  @override
  Future<String> uploadImage(File file, String path) async {
    String fileName = b.basename(file.path);
    String bucketName = BackEndPoints.fruitsImages;
    String fullPath = '$path/$fileName';

    await createBucket(bucketName);
    return await _storage
        .from(bucketName)
        .upload(fullPath, file)
        .then((v) => getPubURL(bucketName, fullPath));
  }

  String getPubURL(String bucketName, String fullPath) =>
      _storage.from(bucketName).getPublicUrl(fullPath);
}

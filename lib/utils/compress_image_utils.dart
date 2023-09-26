import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';

import '../mixins/file_utils_mixin.dart';

class CompressImage {
  Future<AppFile?> compressImage(
    AppFile image,
  ) async {
    final Directory tempDirection = await getTemporaryDirectory();
    final String path = tempDirection.path;
    final XFile? compressedImage =
        await FlutterImageCompress.compressAndGetFile(
      image.path,
      '$path/img_${image.name}.jpg',
      quality: 70,
    );
    if (compressedImage == null) {
      return null;
    }

    return compressedImage.toAppFile();
  }
}

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';

import '../../mixins/file_utils_mixin.dart';
import '../../ui.dart';

class AppImage extends StatelessWidget {
  const AppImage._({
    Key? key,
    this.imageFile,
    this.url,
    this.path,
  }) : super(key: key);

  final AppFile? imageFile;
  final String? url;
  final String? path;

  static AppImage network(String url) {
    return AppImage._(url: url);
  }

  static AppImage asset(String path) {
    return AppImage._(path: path);
  }

  static AppImage file(AppFile file) {
    return AppImage._(imageFile: file);
  }

  @override
  Widget build(BuildContext context) {
    if (imageFile != null) {
      return Image.file(File(imageFile!.path));
    }

    if (path != null) {
      return Image.asset(path!);
    }

    if (url != null) {
      return CachedNetworkImage(
        imageUrl: url!,
        fit: BoxFit.cover,
        placeholder: (_, __) {
          return const AppProgressIndicator();
        },
      );
    }

    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text('No image available'),
    );
  }
}

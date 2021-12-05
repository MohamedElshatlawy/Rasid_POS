import 'package:flutter/material.dart';
import 'package:rasid_jack/utilities/constants/app_assets.dart';
import 'package:rasid_jack/utilities/constants/app_colors.dart';

class AppImage extends StatelessWidget {
  final VoidCallback? onPressed;
  final String path;
  final double? height;
  final double? width;
  final bool? isCircular;
  final BoxFit? boxFit;

  const AppImage({
    required this.path,
    this.height,
    this.width,
    this.isCircular = false,
    this.boxFit=BoxFit.contain,
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isCircular! ? ClipOval(child: image()) : image();
  }

  Widget image() {
    if (path.startsWith('assets')) {
      return assetImage();
    } else {
      return netWorkImage();
    }
  }

  Widget netWorkImage() {
    return Image.network(
      path,
      scale: 1.1,
      fit: BoxFit.cover,
      width: width,
      height: height,
      errorBuilder:
          (BuildContext? context, Object? object, StackTrace? stackTrace) {
        return Icon(
          Icons.error,
          color: AppColors.redColor,
        );
      },
      loadingBuilder: (BuildContext? context, Widget? child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child!;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
            valueColor: AlwaysStoppedAnimation(AppColors.primaryColor),
          ),
        );
      },
    );
  }

  Widget assetImage() {
    return Image.asset(
      path,
      scale: 1.1,
      fit:boxFit,
      width: width,
      height: height,
      errorBuilder:
          (BuildContext? context, Object? object, StackTrace? stackTrace) {
        return Image.asset(
          AppAssets.logo,
        );
      },
    );
  }
}

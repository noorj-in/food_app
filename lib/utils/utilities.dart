// import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/utils/app.dart';

AppBar appBar({
  required String title,
  VoidCallback? leadingCallback,
}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.white,
    leading: InkResponse(
      onTap: leadingCallback ?? () => app.pop(),
      child: Icon(
        Icons.arrow_back,
        color: customColors.black,
      ),
    ),
    title: Text(
      title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

// ExtendedImage extendedImage({
//   required String url,
//   double? height,
//   double? width,
//   BoxFit? fit,
// }) {
//   if (url.isEmpty) {
//     return ExtendedImage.asset(
//       'assets/images/ic_logo.png',
//       height: height,
//       width: width,
//       alignment: Alignment.center,
//       fit: BoxFit.contain,
//     );
//   } else if (url.startsWith('assets/')) {
//     return ExtendedImage.asset(
//       url,
//       height: height,
//       width: width,
//       fit: fit ?? BoxFit.cover,
//     );
//   } else {
//     return ExtendedImage.network(
//       url,
//       fit: fit ?? BoxFit.cover,
//       cache: true,
//       height: height,
//       width: width,
//       cacheMaxAge: const Duration(hours: 1),
//       cacheRawData: true,
//       enableMemoryCache: false,
//       enableLoadState: false,
//       handleLoadingProgress: true,
//       loadStateChanged: (ExtendedImageState state) {
//         switch (state.extendedImageLoadState) {
//           case LoadState.loading:
//             return Image.asset(
//               'assets/images/ic_logo.png',
//               height: height,
//               width: width,
//               alignment: Alignment.center,
//               fit: BoxFit.contain,
//             );
//           case LoadState.completed:
//             return null;
//           case LoadState.failed:
//             return Image.asset(
//               'assets/images/ic_logo.png',
//               height: height,
//               width: width,
//               alignment: Alignment.center,
//               fit: BoxFit.contain,
//             );
//         }
//       },
//       printError: false,
//     );
//   }
// }

void showFloatingSnack(
    String message, {
      Duration duration = const Duration(seconds: 3),
    }) {
  ScaffoldMessenger.of(app.ctx!).showSnackBar(
    SnackBar(
      duration: duration,
      content: Text(
        message,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      showCloseIcon: true,
      closeIconColor: Colors.white,
      backgroundColor: customColors.black,
      shape: const StadiumBorder(),
      margin: EdgeInsets.only(
        bottom: 15.h,
        left: 20.w,
        right: 20.w,
      ),
      behavior: SnackBarBehavior.floating,
    ),
  );
}

BoxDecoration cardShadow({double? borderRadius, Color? color}) => BoxDecoration(
  color: color ?? Colors.white,
  borderRadius: BorderRadius.circular(borderRadius ?? 20.r),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.08),
      spreadRadius: 0,
      blurRadius: 4,
      offset: const Offset(0, 1),
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.02),
      spreadRadius: 0,
      blurRadius: 6,
      offset: const Offset(0, 0),
    ),
  ],
);
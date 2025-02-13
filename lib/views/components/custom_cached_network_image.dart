import 'package:c_valentine_app/constants/utilities.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  const CustomCachedNetworkImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: imageUrl,
      placeholder: (context, url) => _buildShimmerPlaceholder(),
      errorWidget: (context, url, error) => const Icon(Icons.broken_image),
    );
  }

  Widget _buildShimmerPlaceholder() {
    return Shimmer.fromColors(
      baseColor: Utilities.primaryColor,
      highlightColor: Utilities.highlightColor,
      child: Container(
        width: 180.w,
        color: Utilities.primaryColor,
      ),
    );
  }
}

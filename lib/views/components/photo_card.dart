import 'package:c_valentine_app/constants/utilities.dart';
import 'package:c_valentine_app/views/components/custom_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
// import 'package:flutter_swipable/flutter_swipable.dart';

class PhotoCard extends StatelessWidget {
  final String image;
  final String date;
  final String? description;
  const PhotoCard({
    super.key,
    required this.image,
    required this.date,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Swipable(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 580.h,
            width: 432.w,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: Utilities.textColor),
              color: Utilities.primaryColor,
            ),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: SizedBox(
                      height: 328.h,
                      width: 432.w,
                      child: CustomCachedNetworkImage(
                        imageUrl: image,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    date,
                    style: TextStyle(
                      fontFamily: 'PlayfairDisplay',
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  description != null
                      ? Column(
                          children: [
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              description!,
                              style: TextStyle(
                                fontSize: 16.spMin,
                              ),
                            ),
                          ],
                        )
                      : const SizedBox.shrink()
                ]),
          ),
        ],
      ),
    );
  }
}

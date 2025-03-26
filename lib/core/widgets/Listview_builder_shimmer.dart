// import 'package:Learn_U/core/resource_manger/color_manager.dart';
// import 'package:Learn_U/core/utils/config_size.dart';
// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';

// class ListviewBuilderShimmer extends StatelessWidget {
//   const ListviewBuilderShimmer(
//       {super.key,
//       required this.scrollDirection,
//       required this.height,
//       required this.width});
//   final Axis scrollDirection;
//   final double height;
//   final double width;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: height, // Match the height of the ListView
//       child: ListView.builder(
//         shrinkWrap: true,
//         physics: ClampingScrollPhysics(),
//         scrollDirection: scrollDirection,
//         itemCount: 5, // Number of shimmer items
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: EdgeInsets.all(ConfigSize.defaultSize! * 2),
//             child: Shimmer.fromColors(
//               baseColor: Colors.grey[300]!,
//               highlightColor: Colors.grey[100]!,
//               child: Container(
//                 width: width,
//                 height: height,
//                 decoration: BoxDecoration(
//                   color: ColorManager.whiteColor,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

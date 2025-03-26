// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';

// class CustomDropDownMenu extends StatefulWidget {
//   CustomDropDownMenu(
//       {super.key,
//       required this.hint,
//       required this.list,
//       required this.selectedValue,
//       required this.ontap,
//       required this.color});
//   final String hint;
//   final List<dynamic> list;
//   final Function(String?) ontap;
//   final String? selectedValue;
//   final Color color;

//   @override
//   State<CustomDropDownMenu> createState() => _CustomDropDownMenuState();
// }

// class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton2<String>(
//           isDense: true,
//           isExpanded: true,
//           hint: Text(widget.hint),
//           items: widget.list.map((country) {
//             return DropdownMenuItem<String>(
//               value: country.id.toString(), // Ensure value is not null
//               child: Text(
//                 country.name?.toUpperCase() ?? '',
//                 style: TextStyle(
//                     fontSize: ConfigSize.defaultSize! * 1.6,
//                     fontWeight: FontWeight.bold,
//                     color: ColorManager.black),
//               ),
//             );
//           }).toList(),
//           value: widget.selectedValue,
//           onChanged: widget.ontap,
//           buttonStyleData: ButtonStyleData(
//             decoration: BoxDecoration(
//               borderRadius: const BorderRadius.all(Radius.circular(12)),
//               color: widget.color,
//               border: Border.all(color: ColorManager.black, width: 1),
//             ),
//             padding:
//                 EdgeInsets.symmetric(horizontal: ConfigSize.defaultSize! * 1.6),
//             height: ConfigSize.defaultSize! * 5.5,
//             width: ConfigSize.screenWidth,
//           ),
//           menuItemStyleData: MenuItemStyleData(
//             height: ConfigSize.defaultSize! * 4.0,
//           ),
//         ),
//       ),
//     );
//   }
// }

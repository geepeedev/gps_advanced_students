import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

enum DraweritemEnum {
  classroom(itemName: 'Classroom', itemIcon: IconsaxPlusLinear.building),
  quiz(itemName: 'Quiz', itemIcon: IconsaxPlusLinear.pen_tool),
  result(itemName: 'Result', itemIcon: IconsaxPlusLinear.arrange_square),
  profile(itemName: 'Profile', itemIcon: IconsaxPlusLinear.profile);

  final String itemName;
  final IconData itemIcon;

  const DraweritemEnum({required this.itemName, required this.itemIcon});
}

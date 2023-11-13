import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({Key? key, required this.appBarIcon, this.onTap}) : super(key: key);
final Icon appBarIcon;
final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Center(
            child: appBarIcon
        ),
      ),
    );
  }
}
